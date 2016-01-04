package mop;
import java.util.concurrent.*;
import java.util.concurrent.locks.*;
import java.util.*;

import java.lang.ref.*;
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

public aspect EnforceTestMonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public EnforceTestMonitorAspect(){
		Runtime.getRuntime().addShutdownHook(new EnforceTest_DummyHookThread());
	}

	// Declarations for the Lock
	static ReentrantLock EnforceTest_MOPLock = new ReentrantLock();
	static Condition EnforceTest_MOPLock_cond = EnforceTest_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution() && BaseAspect.notwithin();
	pointcut EnforceTest_twoBegin() : (execution(* SimpleRunnable2.run(..))) && MOP_CommonPointCut();
	before () : EnforceTest_twoBegin() {
		EnforceTestRuntimeMonitor.twoBeginEvent();
	}

	pointcut EnforceTest_oneBegin() : (execution(* SimpleRunnable1.run(..))) && MOP_CommonPointCut();
	before () : EnforceTest_oneBegin() {
		EnforceTestRuntimeMonitor.oneBeginEvent();
	}

	pointcut EnforceTest_oneEnd() : (execution(* SimpleRunnable1.run(..))) && MOP_CommonPointCut();
	after () : EnforceTest_oneEnd() {
		EnforceTestRuntimeMonitor.oneEndEvent();
	}

	pointcut EnforceTest_twoEnd() : (execution(* SimpleRunnable2.run(..))) && MOP_CommonPointCut();
	after () : EnforceTest_twoEnd() {
		EnforceTestRuntimeMonitor.twoEndEvent();
	}

	before (): (execution(void *.main(..)) ) && MOP_CommonPointCut() {
		EnforceTestRuntimeMonitor.startDeadlockDetection();
	}
	after (Thread t): (call(void Thread+.start()) && target(t)) && MOP_CommonPointCut() {
		while (!EnforceTest_MOPLock.tryLock()) {
			Thread.yield();
		}
		EnforceTestRuntimeMonitor.EnforceTest_ThreadMonitor_ThreadSet.add(t);
		EnforceTest_MOPLock_cond.signalAll();
		EnforceTest_MOPLock.unlock();
	}

	class EnforceTest_DummyHookThread extends Thread {
		public void run(){
		}
	}
}
