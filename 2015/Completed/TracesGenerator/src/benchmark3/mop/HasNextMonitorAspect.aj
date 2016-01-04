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

public aspect HasNextMonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public HasNextMonitorAspect(){
	}

	// Declarations for the Lock
	static ReentrantLock HasNext_MOPLock = new ReentrantLock();
	static Condition HasNext_MOPLock_cond = HasNext_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution() && BaseAspect.notwithin();
	pointcut HasNext_next(Iterator i) : (call(* Iterator.next()) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : HasNext_next(i) {
		HasNextRuntimeMonitor.nextEvent(i);


        System.out.print("next, " + System.identityHashCode(i)
                + ", \r\n");
	}

	pointcut HasNext_hasnexttrue(Iterator i) : (call(* Iterator.hasNext()) && target(i)) && MOP_CommonPointCut();
	after (Iterator i) returning (boolean b) : HasNext_hasnexttrue(i) {
		//HasNext_hasnexttrue
		HasNextRuntimeMonitor.hasNextTrueEvent(i, b);

        System.out.print("hasNextTrue, " + System.identityHashCode(i)
                + ", " + b + "\r\n");

		//HasNext_hasnextfalse
		HasNextRuntimeMonitor.hasNextFalseEvent(i, b);


        System.out.print("hasNextFalse, " + System.identityHashCode(i)
                + ", " + b + "\r\n");
	}

}
