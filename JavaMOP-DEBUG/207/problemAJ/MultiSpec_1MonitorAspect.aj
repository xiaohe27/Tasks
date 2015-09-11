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

	pointcut ListIterator_hasNextPrevious_previous(ListIterator i) : (call(* ListIterator.previous()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_hasNextPrevious_previous(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_previousEvent(i);
	}

	pointcut ListIterator_hasNextPrevious_next(ListIterator i) : (call(* ListIterator.next()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_hasNextPrevious_next(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_nextEvent(i);
	}

	pointcut ListIterator_Set_set(ListIterator i) : (call(* ListIterator+.set(..)) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_Set_set(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_Set_setEvent(i);
	}

	pointcut ListIterator_Set_previous(ListIterator i) : (call(* ListIterator+.previous()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_Set_previous(i) {
		//ListIterator_RemoveOnce_previous
		MultiSpec_1RuntimeMonitor.ListIterator_RemoveOnce_previousEvent(i);
		//ListIterator_Set_previous
		MultiSpec_1RuntimeMonitor.ListIterator_Set_previousEvent(i);
	}

	before (ListIterator i) : ListIterator_Set_next(i) {
		//ListIterator_RemoveOnce_next
		MultiSpec_1RuntimeMonitor.ListIterator_RemoveOnce_nextEvent(i);
		//ListIterator_Set_next
		MultiSpec_1RuntimeMonitor.ListIterator_Set_nextEvent(i);
	}

	pointcut ListIterator_Set_add(ListIterator i) : (call(void ListIterator+.add(..)) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_Set_add(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_Set_addEvent(i);
	}

	before (ListIterator i) : ListIterator_Set_remove(i) {
		//ListIterator_RemoveOnce_remove
		MultiSpec_1RuntimeMonitor.ListIterator_RemoveOnce_removeEvent(i);
		//ListIterator_Set_remove
		MultiSpec_1RuntimeMonitor.ListIterator_Set_removeEvent(i);
	}

	pointcut List_UnsafeListIterator_useiter(ListIterator i) : ((call(* Iterator+.hasNext(..)) || call(* ListIterator+.hasPrevious(..)) || call(* Iterator+.next(..)) || call(* ListIterator+.previous(..)) || call(* ListIterator+.nextIndex(..)) || call(* ListIterator+.previousIndex(..))) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : List_UnsafeListIterator_useiter(i) {
		MultiSpec_1RuntimeMonitor.List_UnsafeListIterator_useiterEvent(i);
	}

	pointcut List_UnsafeListIterator_modify(List l) : ((call(* Collection+.add*(..)) || call(* Collection+.clear(..)) || call(* Collection+.remove*(..)) || call(* Collection+.retain*(..))) && target(l)) && MOP_CommonPointCut();
	before (List l) : List_UnsafeListIterator_modify(l) {
		MultiSpec_1RuntimeMonitor.List_UnsafeListIterator_modifyEvent(l);
	}

	pointcut List_UnsafeListIterator_create(List l) : (call(ListIterator List+.listIterator()) && target(l)) && MOP_CommonPointCut();
	after (List l) returning (ListIterator i) : List_UnsafeListIterator_create(l) {
		MultiSpec_1RuntimeMonitor.List_UnsafeListIterator_createEvent(l, i);
	}

	pointcut ListIterator_Set_create() : (call(ListIterator Iterable+.listIterator())) && MOP_CommonPointCut();
	after () returning (ListIterator i) : ListIterator_Set_create() {
		MultiSpec_1RuntimeMonitor.ListIterator_Set_createEvent(i);
	}

	pointcut ListIterator_hasNextPrevious_hasnexttrue(ListIterator i) : (call(* ListIterator.hasNext()) && target(i)) && MOP_CommonPointCut();
	after (ListIterator i) returning (boolean b) : ListIterator_hasNextPrevious_hasnexttrue(i) {
		//ListIterator_hasNextPrevious_hasnexttrue
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_hasnexttrueEvent(i, b);
		//ListIterator_hasNextPrevious_hasnextfalse
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_hasnextfalseEvent(i, b);
	}

	pointcut ListIterator_hasNextPrevious_hasprevioustrue(ListIterator i) : (call(* ListIterator.hasPrevious()) && target(i)) && MOP_CommonPointCut();
	after (ListIterator i) returning (boolean b) : ListIterator_hasNextPrevious_hasprevioustrue(i) {
		//ListIterator_hasNextPrevious_hasprevioustrue
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_hasprevioustrueEvent(i, b);
		//ListIterator_hasNextPrevious_haspreviousfalse
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_haspreviousfalseEvent(i, b);
	}

	pointcut Iterator_HasNext_hasnexttrue(Iterator i) : (call(* Iterator+.hasNext()) && target(i)) && MOP_CommonPointCut();
	after (Iterator i) returning (boolean b) : Iterator_HasNext_hasnexttrue(i) {
		//Iterator_HasNext_hasnexttrue
		MultiSpec_1RuntimeMonitor.Iterator_HasNext_hasnexttrueEvent(i, b);
		//Iterator_HasNext_hasnextfalse
		MultiSpec_1RuntimeMonitor.Iterator_HasNext_hasnextfalseEvent(i, b);
	}

}
