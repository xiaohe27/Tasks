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

public aspect EnforceTest2MonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public EnforceTest2MonitorAspect(){
		Runtime.getRuntime().addShutdownHook(new EnforceTest2_DummyHookThread());
	}

	// Declarations for the Lock
	static ReentrantLock EnforceTest2_MOPLock = new ReentrantLock();
	static Condition EnforceTest2_MOPLock_cond = EnforceTest2_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution() && BaseAspect.notwithin();
	pointcut EnforceTest2_oneBegin() : (execution(* SimpleRunnable.run(..))) && MOP_CommonPointCut();
	before () : EnforceTest2_oneBegin() {
		//EnforceTest2_twoBegin
		EnforceTest2RuntimeMonitor.twoBeginEvent();
		//EnforceTest2_oneBegin
		EnforceTest2RuntimeMonitor.oneBeginEvent();
	}

	after () : EnforceTest2_oneBegin() {
		//EnforceTest2_oneEnd
		EnforceTest2RuntimeMonitor.oneEndEvent();
		//EnforceTest2_twoEnd
		EnforceTest2RuntimeMonitor.twoEndEvent();
	}

	before (): (execution(void *.main(..)) ) && MOP_CommonPointCut() {
		EnforceTest2RuntimeMonitor.startDeadlockDetection();
	}
	after (Thread t): (call(void Thread+.start()) && target(t)) && MOP_CommonPointCut() {
		while (!EnforceTest2_MOPLock.tryLock()) {
			Thread.yield();
		}
		EnforceTest2RuntimeMonitor.EnforceTest2_ThreadMonitor_ThreadSet.add(t);
		EnforceTest2_MOPLock_cond.signalAll();
		EnforceTest2_MOPLock.unlock();
	}

	class EnforceTest2_DummyHookThread extends Thread {
		public void run(){
		}
	}
}
