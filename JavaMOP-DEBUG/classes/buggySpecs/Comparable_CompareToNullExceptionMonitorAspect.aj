package mop;
import java.io.*;
import java.lang.*;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging.Level;
import java.util.concurrent.*;
import java.util.concurrent.locks.*;
import java.util.*;
import java.lang.ref.*;
import com.runtimeverification.rvmonitor.java.rt.*;
import com.runtimeverification.rvmonitor.java.rt.ref.*;
import com.runtimeverification.rvmonitor.java.rt.table.*;
import com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractIndexingTree;
import com.runtimeverification.rvmonitor.java.rt.tablebase.SetEventDelegator;
import com.runtimeverification.rvmonitor.java.rt.tablebase.TableAdopter.Tuple2;
import com.runtimeverification.rvmonitor.java.rt.tablebase.TableAdopter.Tuple3;
import com.runtimeverification.rvmonitor.java.rt.tablebase.IDisableHolder;
import com.runtimeverification.rvmonitor.java.rt.tablebase.IMonitor;
import com.runtimeverification.rvmonitor.java.rt.tablebase.DisableHolder;
import com.runtimeverification.rvmonitor.java.rt.tablebase.TerminatedMonitorCleaner;
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

public aspect Comparable_CompareToNullExceptionMonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public Comparable_CompareToNullExceptionMonitorAspect(){
	}

	// Declarations for the Lock
	static ReentrantLock Comparable_CompareToNullException_MOPLock = new ReentrantLock();
	static Condition Comparable_CompareToNullException_MOPLock_cond = Comparable_CompareToNullException_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution() && BaseAspect.notwithin();
	pointcut Comparable_CompareToNullException_badexception(Object o) : (call(* Comparable+.compareTo(..)) && args(o) && if(o == null)) && MOP_CommonPointCut();
	after (Object o) throwing (Exception e) : Comparable_CompareToNullException_badexception(o) {
		Comparable_CompareToNullExceptionRuntimeMonitor.badexceptionEvent(o, e);
	}

	pointcut Comparable_CompareToNullException_badcompare(Object o) : (call(* Comparable+.compareTo(..)) && args(o) && if(o == null)) && MOP_CommonPointCut();
	after (Object o) returning (int i) : Comparable_CompareToNullException_badcompare(o) {
		Comparable_CompareToNullExceptionRuntimeMonitor.badcompareEvent(o, i);
	}

}
