package mop;
import java.io.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.locks.*;
import java.lang.ref.*;
import java.util.concurrent.atomic.AtomicInteger;
import org.aspectj.lang.*;

aspect BaseAspect {
	pointcut notwithin() :
	!within(sun..*) &&
	!within(java..*) &&
	!within(javax..*) &&
	!within(com.sun..*) &&
	!within(org.dacapo.harness..*) &&
	!within(org.apache.commons..*) &&
	!within(org.apache.geronimo..*) &&
	!within(net.sf.cglib..*) &&
	!within(mop..*) &&
	!within(javamoprt..*) &&
	!within(rvmonitorrt..*) &&
	!within(com.runtimeverification..*);
}

public aspect SafeMapIteratorMonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public SafeMapIteratorMonitorAspect(){
	}

	// Declarations for the Lock
	static ReentrantLock SafeMapIterator_MOPLock = new ReentrantLock();
	static Condition SafeMapIterator_MOPLock_cond = SafeMapIterator_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution() && BaseAspect.notwithin();
	pointcut SafeMapIterator_useIter(Iterator i) : (call(* Iterator.next()) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : SafeMapIterator_useIter(i) {
		SafeMapIteratorRuntimeMonitor.useIterEvent(i);
		System.out.print("useIter, , , " + System.identityHashCode(i) + "\r\n");
	}

	pointcut SafeMapIterator_createColl(Map map) : ((call(* Map.values()) || call(* Map.keySet())) && target(map)) && MOP_CommonPointCut();
	after (Map map) returning (Collection c) : SafeMapIterator_createColl(map) {
		SafeMapIteratorRuntimeMonitor.createCollEvent(map, c);
        System.out.print("createColl," + System.identityHashCode(map) + ", " + System
        .identityHashCode(c) + ", \r\n");
	}

	pointcut SafeMapIterator_createIter(Collection c) : (call(* Collection.iterator()) && target(c)) && MOP_CommonPointCut();
	after (Collection c) returning (Iterator i) : SafeMapIterator_createIter(c) {
		SafeMapIteratorRuntimeMonitor.createIterEvent(c, i);
		System.out.print("createIter, , " + System.identityHashCode(c) + ", " + System
		.identityHashCode(i) + "\r\n");
	}

	pointcut SafeMapIterator_updateMap(Map map) : ((call(* Map.put*(..)) || call(* Map.putAll*(..))
	|| call(* Map.clear()) || call(* Map.remove*(..))) && target(map)) && MOP_CommonPointCut();
	after (Map map) : SafeMapIterator_updateMap(map) {
		SafeMapIteratorRuntimeMonitor.updateMapEvent(map);
		System.out.print("updateMap, " + System.identityHashCode(map) + ", , \r\n");
	}

}
