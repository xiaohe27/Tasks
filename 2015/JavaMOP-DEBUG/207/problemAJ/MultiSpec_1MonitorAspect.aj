package mop;
import java.util.*;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging.Level;
import java.lang.*;
import java.util.concurrent.*;
import java.util.concurrent.locks.*;
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

public aspect MultiSpec_1MonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public MultiSpec_1MonitorAspect(){
	}

	// Declarations for the Lock
	static ReentrantLock MultiSpec_1_MOPLock = new ReentrantLock();
	static Condition MultiSpec_1_MOPLock_cond = MultiSpec_1_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution() && BaseAspect.notwithin();
	pointcut ListIterator_Set_remove(Iterator i) : (call(void Iterator+.remove()) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : ListIterator_Set_remove(i) {
		MultiSpec_1RuntimeMonitor.Iterator_RemoveOnce_removeEvent(i);
	}

	pointcut ListIterator_Set_next(Iterator i) : (call(* Iterator+.next()) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : ListIterator_Set_next(i) {
		//Iterator_RemoveOnce_next
		MultiSpec_1RuntimeMonitor.Iterator_RemoveOnce_nextEvent(i);
		//Iterator_HasNext_next
		MultiSpec_1RuntimeMonitor.Iterator_HasNext_nextEvent(i);
	}


/*
	before (ListIterator i) : ListIterator_Set_next(i) {
		//ListIterator_RemoveOnce_next
		MultiSpec_1RuntimeMonitor.ListIterator_RemoveOnce_nextEvent(i);
		//ListIterator_Set_next
		MultiSpec_1RuntimeMonitor.ListIterator_Set_nextEvent(i);
	}
*/

	pointcut ListIterator_Set_remove2(ListIterator i) : (call(void Iterator+.remove()) && target(i)) && MOP_CommonPointCut();

	before (ListIterator i) : ListIterator_Set_remove2(i) {
		//ListIterator_RemoveOnce_remove
		MultiSpec_1RuntimeMonitor.ListIterator_RemoveOnce_removeEvent(i);
		//ListIterator_Set_remove
		MultiSpec_1RuntimeMonitor.ListIterator_Set_removeEvent(i);
	}

}
