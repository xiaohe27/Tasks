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

public aspect myEnforceMonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public myEnforceMonitorAspect(){
		Runtime.getRuntime().addShutdownHook(new myEnforce_DummyHookThread());
	}

	// Declarations for the Lock
	static ReentrantLock myEnforce_MOPLock = new ReentrantLock();
	static Condition myEnforce_MOPLock_cond = myEnforce_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution() && BaseAspect.notwithin();
	pointcut myEnforce_one() : (execution(* *run(..))) && MOP_CommonPointCut();
	before () : myEnforce_one() {
		//myEnforce_two
		myEnforceRuntimeMonitor.twoEvent();
		//myEnforce_one
		myEnforceRuntimeMonitor.oneEvent();
	}

	before (): (execution(void *.main(..)) ) && MOP_CommonPointCut() {
		myEnforceRuntimeMonitor.startDeadlockDetection();
	}
	after (Thread t): (call(void Thread+.start()) && target(t)) && MOP_CommonPointCut() {
		while (!myEnforce_MOPLock.tryLock()) {
			Thread.yield();
		}
		myEnforceRuntimeMonitor.myEnforce_ThreadMonitor_ThreadSet.add(t);
		myEnforce_MOPLock_cond.signalAll();
		myEnforce_MOPLock.unlock();
	}

	class myEnforce_DummyHookThread extends Thread {
		public void run(){
		}
	}
}
