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

final class Iterator_HasNextMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<Iterator_HasNextMonitor> {

	Iterator_HasNextMonitor_Set(){
		this.size = 0;
		this.elements = new Iterator_HasNextMonitor[4];
	}
	final void event_hasnexttrue(Iterator i, boolean b) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			Iterator_HasNextMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Iterator_HasNextMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_hasnexttrue(i, b);
				if(monitorfinalMonitor.Iterator_HasNextMonitor_Prop_1_Category_violation) {
					monitorfinalMonitor.Prop_1_handler_violation();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_hasnextfalse(Iterator i, boolean b) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			Iterator_HasNextMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Iterator_HasNextMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_hasnextfalse(i, b);
				if(monitorfinalMonitor.Iterator_HasNextMonitor_Prop_1_Category_violation) {
					monitorfinalMonitor.Prop_1_handler_violation();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_next(Iterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			Iterator_HasNextMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Iterator_HasNextMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_next(i);
				if(monitorfinalMonitor.Iterator_HasNextMonitor_Prop_1_Category_violation) {
					monitorfinalMonitor.Prop_1_handler_violation();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
}
final class Iterator_RemoveOnceMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<Iterator_RemoveOnceMonitor> {

	Iterator_RemoveOnceMonitor_Set(){
		this.size = 0;
		this.elements = new Iterator_RemoveOnceMonitor[4];
	}
	final void event_remove(Iterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			Iterator_RemoveOnceMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Iterator_RemoveOnceMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_remove(i);
				if(monitorfinalMonitor.Iterator_RemoveOnceMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_next(Iterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			Iterator_RemoveOnceMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Iterator_RemoveOnceMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_next(i);
				if(monitorfinalMonitor.Iterator_RemoveOnceMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
}
final class ListIterator_RemoveOnceMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<ListIterator_RemoveOnceMonitor> {

	ListIterator_RemoveOnceMonitor_Set(){
		this.size = 0;
		this.elements = new ListIterator_RemoveOnceMonitor[4];
	}
	final void event_remove(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_RemoveOnceMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_RemoveOnceMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_remove(i);
				if(monitorfinalMonitor.ListIterator_RemoveOnceMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_next(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_RemoveOnceMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_RemoveOnceMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_next(i);
				if(monitorfinalMonitor.ListIterator_RemoveOnceMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_previous(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_RemoveOnceMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_RemoveOnceMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_previous(i);
				if(monitorfinalMonitor.ListIterator_RemoveOnceMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
}
final class ListIterator_SetMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<ListIterator_SetMonitor> {

	ListIterator_SetMonitor_Set(){
		this.size = 0;
		this.elements = new ListIterator_SetMonitor[4];
	}
	final void event_create(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_SetMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_SetMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_create(i);
				if(monitorfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_remove(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_SetMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_SetMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_remove(i);
				if(monitorfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_add(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_SetMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_SetMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_add(i);
				if(monitorfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_next(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_SetMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_SetMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_next(i);
				if(monitorfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_previous(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_SetMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_SetMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_previous(i);
				if(monitorfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_set(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_SetMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_SetMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_set(i);
				if(monitorfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
}
final class ListIterator_hasNextPreviousMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<ListIterator_hasNextPreviousMonitor> {

	ListIterator_hasNextPreviousMonitor_Set(){
		this.size = 0;
		this.elements = new ListIterator_hasNextPreviousMonitor[4];
	}
	final void event_hasnexttrue(ListIterator i, boolean b) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_hasNextPreviousMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_hasNextPreviousMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_hasnexttrue(i, b);
				if(monitorfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_hasnextfalse(ListIterator i, boolean b) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_hasNextPreviousMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_hasNextPreviousMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_hasnextfalse(i, b);
				if(monitorfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_next(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_hasNextPreviousMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_hasNextPreviousMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_next(i);
				if(monitorfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_hasprevioustrue(ListIterator i, boolean b) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_hasNextPreviousMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_hasNextPreviousMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_hasprevioustrue(i, b);
				if(monitorfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_haspreviousfalse(ListIterator i, boolean b) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_hasNextPreviousMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_hasNextPreviousMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_haspreviousfalse(i, b);
				if(monitorfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_previous(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ListIterator_hasNextPreviousMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ListIterator_hasNextPreviousMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_previous(i);
				if(monitorfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
}
final class List_UnsafeListIteratorMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<List_UnsafeListIteratorMonitor> {

	List_UnsafeListIteratorMonitor_Set(){
		this.size = 0;
		this.elements = new List_UnsafeListIteratorMonitor[4];
	}
	final void event_create(List l, ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			List_UnsafeListIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final List_UnsafeListIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_create(l, i);
				if(monitorfinalMonitor.List_UnsafeListIteratorMonitor_Prop_1_Category_match) {
					monitorfinalMonitor.Prop_1_handler_match();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_modify(List l) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			List_UnsafeListIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final List_UnsafeListIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_modify(l);
				if(monitorfinalMonitor.List_UnsafeListIteratorMonitor_Prop_1_Category_match) {
					monitorfinalMonitor.Prop_1_handler_match();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_useiter(ListIterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			List_UnsafeListIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final List_UnsafeListIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_useiter(i);
				if(monitorfinalMonitor.List_UnsafeListIteratorMonitor_Prop_1_Category_match) {
					monitorfinalMonitor.Prop_1_handler_match();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
}

class Iterator_HasNextMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			Iterator_HasNextMonitor ret = (Iterator_HasNextMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	static final int Prop_1_transition_hasnexttrue[] = {2, 3, 2, 3};;
	static final int Prop_1_transition_hasnextfalse[] = {0, 3, 0, 3};;
	static final int Prop_1_transition_next[] = {1, 3, 0, 3};;

	volatile boolean Iterator_HasNextMonitor_Prop_1_Category_violation = false;

	private final AtomicInteger pairValue;

	Iterator_HasNextMonitor() {
		this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;

	}

	@Override public final int getState() {
		return this.getState(this.pairValue.get() ) ;
	}
	@Override public final int getLastEvent() {
		return this.getLastEvent(this.pairValue.get() ) ;
	}
	private final int getState(int pairValue) {
		return (pairValue & 3) ;
	}
	private final int getLastEvent(int pairValue) {
		return (pairValue >> 2) ;
	}
	private final int calculatePairValue(int lastEvent, int state) {
		return (((lastEvent + 1) << 2) | state) ;
	}

	private final int handleEvent(int eventId, int[] table) {
		int nextstate;
		while (true) {
			int oldpairvalue = this.pairValue.get() ;
			int oldstate = this.getState(oldpairvalue) ;
			nextstate = table [ oldstate ];
			int nextpairvalue = this.calculatePairValue(eventId, nextstate) ;
			if (this.pairValue.compareAndSet(oldpairvalue, nextpairvalue) ) {
				break;
			}
		}
		return nextstate;
	}

	final boolean Prop_1_event_hasnexttrue(Iterator i, boolean b) {
		{
			if ( ! (b) ) {
				return false;
			}
			{
			}
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_hasnexttrue) ;
		this.Iterator_HasNextMonitor_Prop_1_Category_violation = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_hasnextfalse(Iterator i, boolean b) {
		{
			if ( ! (!b) ) {
				return false;
			}
			{
			}
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_hasnextfalse) ;
		this.Iterator_HasNextMonitor_Prop_1_Category_violation = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_next(Iterator i) {
		{
		}

		int nextstate = this.handleEvent(2, Prop_1_transition_next) ;
		this.Iterator_HasNextMonitor_Prop_1_Category_violation = nextstate == 1;

		return true;
	}

	final void Prop_1_handler_violation (){
		{
			RVMLogging.out.println(Level.WARNING, "Specification Iterator_HasNext has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/Iterator_HasNext.html");
			RVMLogging.out.println(Level.WARNING, "Iterator.hasNext() was not called before calling next().");
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		Iterator_HasNextMonitor_Prop_1_Category_violation = false;
	}

	// RVMRef_i was suppressed to reduce memory overhead

	//alive_parameters_0 = [Iterator i]
	boolean alive_parameters_0 = true;

	@Override
	protected final void terminateInternal(int idnum) {
		int lastEvent = this.getLastEvent();

		switch(idnum){
			case 0:
			alive_parameters_0 = false;
			break;
		}
		switch(lastEvent) {
			case -1:
			return;
			case 0:
			//hasnexttrue
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//hasnextfalse
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 2:
			//next
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

		}
		return;
	}

	public static int getNumberOfEvents() {
		return 3;
	}

	public static int getNumberOfStates() {
		return 4;
	}

}
class Iterator_RemoveOnceMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			Iterator_RemoveOnceMonitor ret = (Iterator_RemoveOnceMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	static final int Prop_1_transition_remove[] = {2, 0, 2};;
	static final int Prop_1_transition_next[] = {1, 1, 2};;

	volatile boolean Iterator_RemoveOnceMonitor_Prop_1_Category_fail = false;

	private final AtomicInteger pairValue;

	Iterator_RemoveOnceMonitor() {
		this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;

	}

	@Override public final int getState() {
		return this.getState(this.pairValue.get() ) ;
	}
	@Override public final int getLastEvent() {
		return this.getLastEvent(this.pairValue.get() ) ;
	}
	private final int getState(int pairValue) {
		return (pairValue & 3) ;
	}
	private final int getLastEvent(int pairValue) {
		return (pairValue >> 2) ;
	}
	private final int calculatePairValue(int lastEvent, int state) {
		return (((lastEvent + 1) << 2) | state) ;
	}

	private final int handleEvent(int eventId, int[] table) {
		int nextstate;
		while (true) {
			int oldpairvalue = this.pairValue.get() ;
			int oldstate = this.getState(oldpairvalue) ;
			nextstate = table [ oldstate ];
			int nextpairvalue = this.calculatePairValue(eventId, nextstate) ;
			if (this.pairValue.compareAndSet(oldpairvalue, nextpairvalue) ) {
				break;
			}
		}
		return nextstate;
	}

	final boolean Prop_1_event_remove(Iterator i) {
		{
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_remove) ;
		this.Iterator_RemoveOnceMonitor_Prop_1_Category_fail = nextstate == 2;

		return true;
	}

	final boolean Prop_1_event_next(Iterator i) {
		{
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_next) ;
		this.Iterator_RemoveOnceMonitor_Prop_1_Category_fail = nextstate == 2;

		return true;
	}

	final void Prop_1_handler_fail (){
		{
			RVMLogging.out.println(Level.CRITICAL, "Specification Iterator_RemoveOnce has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/Iterator_RemoveOnce.html");
			RVMLogging.out.println(Level.CRITICAL, "Iterator.remove() can be called only once per call to next().");
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		Iterator_RemoveOnceMonitor_Prop_1_Category_fail = false;
	}

	// RVMRef_i was suppressed to reduce memory overhead

	//alive_parameters_0 = [Iterator i]
	boolean alive_parameters_0 = true;

	@Override
	protected final void terminateInternal(int idnum) {
		int lastEvent = this.getLastEvent();

		switch(idnum){
			case 0:
			alive_parameters_0 = false;
			break;
		}
		switch(lastEvent) {
			case -1:
			return;
			case 0:
			//remove
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//next
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

		}
		return;
	}

	public static int getNumberOfEvents() {
		return 2;
	}

	public static int getNumberOfStates() {
		return 3;
	}

}
class ListIterator_RemoveOnceMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			ListIterator_RemoveOnceMonitor ret = (ListIterator_RemoveOnceMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	static final int Prop_1_transition_remove[] = {2, 0, 2};;
	static final int Prop_1_transition_next[] = {1, 1, 2};;
	static final int Prop_1_transition_previous[] = {1, 1, 2};;

	volatile boolean ListIterator_RemoveOnceMonitor_Prop_1_Category_fail = false;

	private final AtomicInteger pairValue;

	ListIterator_RemoveOnceMonitor() {
		this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;

	}

	@Override public final int getState() {
		return this.getState(this.pairValue.get() ) ;
	}
	@Override public final int getLastEvent() {
		return this.getLastEvent(this.pairValue.get() ) ;
	}
	private final int getState(int pairValue) {
		return (pairValue & 3) ;
	}
	private final int getLastEvent(int pairValue) {
		return (pairValue >> 2) ;
	}
	private final int calculatePairValue(int lastEvent, int state) {
		return (((lastEvent + 1) << 2) | state) ;
	}

	private final int handleEvent(int eventId, int[] table) {
		int nextstate;
		while (true) {
			int oldpairvalue = this.pairValue.get() ;
			int oldstate = this.getState(oldpairvalue) ;
			nextstate = table [ oldstate ];
			int nextpairvalue = this.calculatePairValue(eventId, nextstate) ;
			if (this.pairValue.compareAndSet(oldpairvalue, nextpairvalue) ) {
				break;
			}
		}
		return nextstate;
	}

	final boolean Prop_1_event_remove(ListIterator i) {
		{
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_remove) ;
		this.ListIterator_RemoveOnceMonitor_Prop_1_Category_fail = nextstate == 2;

		return true;
	}

	final boolean Prop_1_event_next(ListIterator i) {
		{
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_next) ;
		this.ListIterator_RemoveOnceMonitor_Prop_1_Category_fail = nextstate == 2;

		return true;
	}

	final boolean Prop_1_event_previous(ListIterator i) {
		{
		}

		int nextstate = this.handleEvent(2, Prop_1_transition_previous) ;
		this.ListIterator_RemoveOnceMonitor_Prop_1_Category_fail = nextstate == 2;

		return true;
	}

	final void Prop_1_handler_fail (){
		{
			RVMLogging.out.println(Level.CRITICAL, "Specification ListIterator_RemoveOnce has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/ListIterator_RemoveOnce.html");
			RVMLogging.out.println(Level.CRITICAL, "ListIterator.remove() can be called only once per call to next()/previous().");
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		ListIterator_RemoveOnceMonitor_Prop_1_Category_fail = false;
	}

	// RVMRef_i was suppressed to reduce memory overhead

	//alive_parameters_0 = [ListIterator i]
	boolean alive_parameters_0 = true;

	@Override
	protected final void terminateInternal(int idnum) {
		int lastEvent = this.getLastEvent();

		switch(idnum){
			case 0:
			alive_parameters_0 = false;
			break;
		}
		switch(lastEvent) {
			case -1:
			return;
			case 0:
			//remove
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//next
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 2:
			//previous
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

		}
		return;
	}

	public static int getNumberOfEvents() {
		return 3;
	}

	public static int getNumberOfStates() {
		return 3;
	}

}
class ListIterator_SetMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			ListIterator_SetMonitor ret = (ListIterator_SetMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	static final int Prop_1_transition_create[] = {2, 4, 4, 4, 4};;
	static final int Prop_1_transition_remove[] = {4, 3, 4, 4, 4};;
	static final int Prop_1_transition_add[] = {4, 2, 2, 4, 4};;
	static final int Prop_1_transition_next[] = {4, 1, 1, 1, 4};;
	static final int Prop_1_transition_previous[] = {4, 1, 1, 1, 4};;
	static final int Prop_1_transition_set[] = {4, 1, 4, 4, 4};;

	volatile boolean ListIterator_SetMonitor_Prop_1_Category_fail = false;

	private final AtomicInteger pairValue;

	ListIterator_SetMonitor() {
		this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;

	}

	@Override public final int getState() {
		return this.getState(this.pairValue.get() ) ;
	}
	@Override public final int getLastEvent() {
		return this.getLastEvent(this.pairValue.get() ) ;
	}
	private final int getState(int pairValue) {
		return (pairValue & 7) ;
	}
	private final int getLastEvent(int pairValue) {
		return (pairValue >> 3) ;
	}
	private final int calculatePairValue(int lastEvent, int state) {
		return (((lastEvent + 1) << 3) | state) ;
	}

	private final int handleEvent(int eventId, int[] table) {
		int nextstate;
		while (true) {
			int oldpairvalue = this.pairValue.get() ;
			int oldstate = this.getState(oldpairvalue) ;
			nextstate = table [ oldstate ];
			int nextpairvalue = this.calculatePairValue(eventId, nextstate) ;
			if (this.pairValue.compareAndSet(oldpairvalue, nextpairvalue) ) {
				break;
			}
		}
		return nextstate;
	}

	final boolean Prop_1_event_create(ListIterator i) {
		{
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_create) ;
		this.ListIterator_SetMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final boolean Prop_1_event_remove(ListIterator i) {
		{
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_remove) ;
		this.ListIterator_SetMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final boolean Prop_1_event_add(ListIterator i) {
		{
		}

		int nextstate = this.handleEvent(2, Prop_1_transition_add) ;
		this.ListIterator_SetMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final boolean Prop_1_event_next(ListIterator i) {
		{
		}

		int nextstate = this.handleEvent(3, Prop_1_transition_next) ;
		this.ListIterator_SetMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final boolean Prop_1_event_previous(ListIterator i) {
		{
		}

		int nextstate = this.handleEvent(4, Prop_1_transition_previous) ;
		this.ListIterator_SetMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final boolean Prop_1_event_set(ListIterator i) {
		{
		}

		int nextstate = this.handleEvent(5, Prop_1_transition_set) ;
		this.ListIterator_SetMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final void Prop_1_handler_fail (){
		{
			RVMLogging.out.println(Level.CRITICAL, "Specification ListIterator_Set has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/ListIterator_Set.html");
			RVMLogging.out.println(Level.CRITICAL, "ListIterator.set() can be made only if neither remove() nor add() have been called after the last call to next() or previous().");
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		ListIterator_SetMonitor_Prop_1_Category_fail = false;
	}

	// RVMRef_i was suppressed to reduce memory overhead

	//alive_parameters_0 = [ListIterator i]
	boolean alive_parameters_0 = true;

	@Override
	protected final void terminateInternal(int idnum) {
		int lastEvent = this.getLastEvent();

		switch(idnum){
			case 0:
			alive_parameters_0 = false;
			break;
		}
		switch(lastEvent) {
			case -1:
			return;
			case 0:
			//create
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//remove
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 2:
			//add
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 3:
			//next
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 4:
			//previous
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 5:
			//set
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

		}
		return;
	}

	public static int getNumberOfEvents() {
		return 6;
	}

	public static int getNumberOfStates() {
		return 5;
	}

}
class ListIterator_hasNextPreviousMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			ListIterator_hasNextPreviousMonitor ret = (ListIterator_hasNextPreviousMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	static final int Prop_1_transition_hasnexttrue[] = {1, 1, 3, 3, 4};;
	static final int Prop_1_transition_hasnextfalse[] = {0, 0, 2, 2, 4};;
	static final int Prop_1_transition_next[] = {4, 2, 4, 2, 4};;
	static final int Prop_1_transition_hasprevioustrue[] = {2, 3, 2, 3, 4};;
	static final int Prop_1_transition_haspreviousfalse[] = {0, 1, 0, 1, 4};;
	static final int Prop_1_transition_previous[] = {4, 4, 1, 1, 4};;

	volatile boolean ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail = false;

	private final AtomicInteger pairValue;

	ListIterator_hasNextPreviousMonitor() {
		this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;

	}

	@Override public final int getState() {
		return this.getState(this.pairValue.get() ) ;
	}
	@Override public final int getLastEvent() {
		return this.getLastEvent(this.pairValue.get() ) ;
	}
	private final int getState(int pairValue) {
		return (pairValue & 7) ;
	}
	private final int getLastEvent(int pairValue) {
		return (pairValue >> 3) ;
	}
	private final int calculatePairValue(int lastEvent, int state) {
		return (((lastEvent + 1) << 3) | state) ;
	}

	private final int handleEvent(int eventId, int[] table) {
		int nextstate;
		while (true) {
			int oldpairvalue = this.pairValue.get() ;
			int oldstate = this.getState(oldpairvalue) ;
			nextstate = table [ oldstate ];
			int nextpairvalue = this.calculatePairValue(eventId, nextstate) ;
			if (this.pairValue.compareAndSet(oldpairvalue, nextpairvalue) ) {
				break;
			}
		}
		return nextstate;
	}

	final boolean Prop_1_event_hasnexttrue(ListIterator i, boolean b) {
		{
			if ( ! (b) ) {
				return false;
			}
			{
			}
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_hasnexttrue) ;
		this.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final boolean Prop_1_event_hasnextfalse(ListIterator i, boolean b) {
		{
			if ( ! (!b) ) {
				return false;
			}
			{
			}
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_hasnextfalse) ;
		this.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final boolean Prop_1_event_next(ListIterator i) {
		{
		}

		int nextstate = this.handleEvent(2, Prop_1_transition_next) ;
		this.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final boolean Prop_1_event_hasprevioustrue(ListIterator i, boolean b) {
		{
			if ( ! (b) ) {
				return false;
			}
			{
			}
		}

		int nextstate = this.handleEvent(3, Prop_1_transition_hasprevioustrue) ;
		this.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final boolean Prop_1_event_haspreviousfalse(ListIterator i, boolean b) {
		{
			if ( ! (!b) ) {
				return false;
			}
			{
			}
		}

		int nextstate = this.handleEvent(4, Prop_1_transition_haspreviousfalse) ;
		this.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final boolean Prop_1_event_previous(ListIterator i) {
		{
		}

		int nextstate = this.handleEvent(5, Prop_1_transition_previous) ;
		this.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail = nextstate == 4;

		return true;
	}

	final void Prop_1_handler_fail (){
		{
			RVMLogging.out.println(Level.WARNING, "Specification ListIterator_hasNextPrevious has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/ListIterator_hasNextPrevious.html");
			RVMLogging.out.println(Level.WARNING, "ListIterator.hasNext()/hasPrevious() was not called before calling next()/previous().");
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail = false;
	}

	// RVMRef_i was suppressed to reduce memory overhead

	//alive_parameters_0 = [ListIterator i]
	boolean alive_parameters_0 = true;

	@Override
	protected final void terminateInternal(int idnum) {
		int lastEvent = this.getLastEvent();

		switch(idnum){
			case 0:
			alive_parameters_0 = false;
			break;
		}
		switch(lastEvent) {
			case -1:
			return;
			case 0:
			//hasnexttrue
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//hasnextfalse
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 2:
			//next
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 3:
			//hasprevioustrue
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 4:
			//haspreviousfalse
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 5:
			//previous
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

		}
		return;
	}

	public static int getNumberOfEvents() {
		return 6;
	}

	public static int getNumberOfStates() {
		return 5;
	}

}
class List_UnsafeListIteratorMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			List_UnsafeListIteratorMonitor ret = (List_UnsafeListIteratorMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	WeakReference Ref_i = null;
	WeakReference Ref_l = null;

	static final int Prop_1_transition_create[] = {1, 4, 4, 4, 4};;
	static final int Prop_1_transition_modify[] = {4, 3, 4, 3, 4};;
	static final int Prop_1_transition_useiter[] = {4, 1, 4, 2, 4};;

	volatile boolean List_UnsafeListIteratorMonitor_Prop_1_Category_match = false;

	private final AtomicInteger pairValue;

	List_UnsafeListIteratorMonitor() {
		this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;

	}

	@Override public final int getState() {
		return this.getState(this.pairValue.get() ) ;
	}
	@Override public final int getLastEvent() {
		return this.getLastEvent(this.pairValue.get() ) ;
	}
	private final int getState(int pairValue) {
		return (pairValue & 7) ;
	}
	private final int getLastEvent(int pairValue) {
		return (pairValue >> 3) ;
	}
	private final int calculatePairValue(int lastEvent, int state) {
		return (((lastEvent + 1) << 3) | state) ;
	}

	private final int handleEvent(int eventId, int[] table) {
		int nextstate;
		while (true) {
			int oldpairvalue = this.pairValue.get() ;
			int oldstate = this.getState(oldpairvalue) ;
			nextstate = table [ oldstate ];
			int nextpairvalue = this.calculatePairValue(eventId, nextstate) ;
			if (this.pairValue.compareAndSet(oldpairvalue, nextpairvalue) ) {
				break;
			}
		}
		return nextstate;
	}

	final boolean Prop_1_event_create(List l, ListIterator i) {
		{
		}
		if(Ref_i == null){
			Ref_i = new WeakReference(i);
		}
		if(Ref_l == null){
			Ref_l = new WeakReference(l);
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_create) ;
		this.List_UnsafeListIteratorMonitor_Prop_1_Category_match = nextstate == 2;

		return true;
	}

	final boolean Prop_1_event_modify(List l) {
		ListIterator i = null;
		if(Ref_i != null){
			i = (ListIterator)Ref_i.get();
		}
		{
		}
		if(Ref_l == null){
			Ref_l = new WeakReference(l);
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_modify) ;
		this.List_UnsafeListIteratorMonitor_Prop_1_Category_match = nextstate == 2;

		return true;
	}

	final boolean Prop_1_event_useiter(ListIterator i) {
		List l = null;
		if(Ref_l != null){
			l = (List)Ref_l.get();
		}
		{
		}
		if(Ref_i == null){
			Ref_i = new WeakReference(i);
		}

		int nextstate = this.handleEvent(2, Prop_1_transition_useiter) ;
		this.List_UnsafeListIteratorMonitor_Prop_1_Category_match = nextstate == 2;

		return true;
	}

	final void Prop_1_handler_match (){
		{
			RVMLogging.out.println(Level.CRITICAL, "Specification List_UnsafeListIterator has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/List_UnsafeListIterator.html");
			RVMLogging.out.println(Level.CRITICAL, "The list was modified while a list iterator is being used.");
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		List_UnsafeListIteratorMonitor_Prop_1_Category_match = false;
	}

	// RVMRef_l was suppressed to reduce memory overhead
	// RVMRef_i was suppressed to reduce memory overhead

	//alive_parameters_0 = [List l, ListIterator i]
	boolean alive_parameters_0 = true;
	//alive_parameters_1 = [ListIterator i]
	boolean alive_parameters_1 = true;

	@Override
	protected final void terminateInternal(int idnum) {
		int lastEvent = this.getLastEvent();

		switch(idnum){
			case 0:
			alive_parameters_0 = false;
			break;
			case 1:
			alive_parameters_0 = false;
			alive_parameters_1 = false;
			break;
		}
		switch(lastEvent) {
			case -1:
			return;
			case 0:
			//create
			//alive_l && alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//modify
			//alive_i
			if(!(alive_parameters_1)){
				RVM_terminated = true;
				return;
			}
			break;

			case 2:
			//useiter
			//alive_l && alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

		}
		return;
	}

	public static int getNumberOfEvents() {
		return 3;
	}

	public static int getNumberOfStates() {
		return 5;
	}

}

class MultiSpec_1RuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager MultiSpec_1MapManager;
	static {
		MultiSpec_1MapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		MultiSpec_1MapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock MultiSpec_1_RVMLock = new ReentrantLock();
	static final Condition MultiSpec_1_RVMLock_cond = MultiSpec_1_RVMLock.newCondition();

	private static boolean Iterator_HasNext_activated = false;
	private static boolean Iterator_RemoveOnce_activated = false;
	private static boolean ListIterator_RemoveOnce_activated = false;
	private static boolean ListIterator_Set_activated = false;
	private static boolean ListIterator_hasNextPrevious_activated = false;
	private static boolean List_UnsafeListIterator_activated = false;

	// Declarations for Indexing Trees
	private static Object Iterator_HasNext_i_Map_cachekey_i;
	private static Iterator_HasNextMonitor Iterator_HasNext_i_Map_cachevalue;
	private static final MapOfMonitor<Iterator_HasNextMonitor> Iterator_HasNext_i_Map = new MapOfMonitor<Iterator_HasNextMonitor>(0) ;

	private static Object Iterator_RemoveOnce_i_Map_cachekey_i;
	private static Iterator_RemoveOnceMonitor Iterator_RemoveOnce_i_Map_cachevalue;
	private static final MapOfMonitor<Iterator_RemoveOnceMonitor> Iterator_RemoveOnce_i_Map = new MapOfMonitor<Iterator_RemoveOnceMonitor>(0) ;

	private static Object ListIterator_RemoveOnce_i_Map_cachekey_i;
	private static ListIterator_RemoveOnceMonitor ListIterator_RemoveOnce_i_Map_cachevalue;
	private static final MapOfMonitor<ListIterator_RemoveOnceMonitor> ListIterator_RemoveOnce_i_Map = new MapOfMonitor<ListIterator_RemoveOnceMonitor>(0) ;

	private static Object ListIterator_Set_i_Map_cachekey_i;
	private static ListIterator_SetMonitor ListIterator_Set_i_Map_cachevalue;
	private static final MapOfMonitor<ListIterator_SetMonitor> ListIterator_Set_i_Map = new MapOfMonitor<ListIterator_SetMonitor>(0) ;

	private static Object ListIterator_hasNextPrevious_i_Map_cachekey_i;
	private static ListIterator_hasNextPreviousMonitor ListIterator_hasNextPrevious_i_Map_cachevalue;
	private static final MapOfMonitor<ListIterator_hasNextPreviousMonitor> ListIterator_hasNextPrevious_i_Map = new MapOfMonitor<ListIterator_hasNextPreviousMonitor>(0) ;

	private static Object List_UnsafeListIterator_i_Map_cachekey_i;
	private static List_UnsafeListIteratorMonitor_Set List_UnsafeListIterator_i_Map_cachevalue;
	private static Object List_UnsafeListIterator_l_Map_cachekey_l;
	private static Tuple2<MapOfMonitor<List_UnsafeListIteratorMonitor>, List_UnsafeListIteratorMonitor_Set> List_UnsafeListIterator_l_Map_cachevalue;
	private static Object List_UnsafeListIterator_l_i_Map_cachekey_i;
	private static Object List_UnsafeListIterator_l_i_Map_cachekey_l;
	private static List_UnsafeListIteratorMonitor List_UnsafeListIterator_l_i_Map_cachevalue;
	private static final MapOfSet<List_UnsafeListIteratorMonitor_Set> List_UnsafeListIterator_i_Map = new MapOfSet<List_UnsafeListIteratorMonitor_Set>(1) ;
	private static final MapOfMapSet<MapOfMonitor<List_UnsafeListIteratorMonitor>, List_UnsafeListIteratorMonitor_Set> List_UnsafeListIterator_l_i_Map = new MapOfMapSet<MapOfMonitor<List_UnsafeListIteratorMonitor>, List_UnsafeListIteratorMonitor_Set>(0) ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += Iterator_HasNext_i_Map.cleanUpUnnecessaryMappings();
		collected += Iterator_RemoveOnce_i_Map.cleanUpUnnecessaryMappings();
		collected += ListIterator_RemoveOnce_i_Map.cleanUpUnnecessaryMappings();
		collected += ListIterator_Set_i_Map.cleanUpUnnecessaryMappings();
		collected += ListIterator_hasNextPrevious_i_Map.cleanUpUnnecessaryMappings();
		collected += List_UnsafeListIterator_i_Map.cleanUpUnnecessaryMappings();
		collected += List_UnsafeListIterator_l_i_Map.cleanUpUnnecessaryMappings();
		return collected;
	}

	// Removing terminated monitors from partitioned sets
	static {
		TerminatedMonitorCleaner.start() ;
	}
	// Setting the behavior of the runtime library according to the compile-time option
	static {
		RuntimeOption.enableFineGrainedLock(false) ;
	}

	public static final void Iterator_HasNext_hasnexttrueEvent(Iterator i, boolean b) {
		Iterator_HasNext_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<Iterator_HasNextMonitor> matchedLastMap = null;
		Iterator_HasNextMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == Iterator_HasNext_i_Map_cachekey_i) ) {
			matchedEntry = Iterator_HasNext_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<Iterator_HasNextMonitor> itmdMap = Iterator_HasNext_i_Map;
				matchedLastMap = itmdMap;
				Iterator_HasNextMonitor node_i = Iterator_HasNext_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			Iterator_HasNextMonitor created = new Iterator_HasNextMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final Iterator_HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_hasnexttrue(i, b);
		if(matchedEntryfinalMonitor.Iterator_HasNextMonitor_Prop_1_Category_violation) {
			matchedEntryfinalMonitor.Prop_1_handler_violation();
		}

		if ((cachehit == false) ) {
			Iterator_HasNext_i_Map_cachekey_i = i;
			Iterator_HasNext_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void Iterator_HasNext_hasnextfalseEvent(Iterator i, boolean b) {
		Iterator_HasNext_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<Iterator_HasNextMonitor> matchedLastMap = null;
		Iterator_HasNextMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == Iterator_HasNext_i_Map_cachekey_i) ) {
			matchedEntry = Iterator_HasNext_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<Iterator_HasNextMonitor> itmdMap = Iterator_HasNext_i_Map;
				matchedLastMap = itmdMap;
				Iterator_HasNextMonitor node_i = Iterator_HasNext_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			Iterator_HasNextMonitor created = new Iterator_HasNextMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final Iterator_HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_hasnextfalse(i, b);
		if(matchedEntryfinalMonitor.Iterator_HasNextMonitor_Prop_1_Category_violation) {
			matchedEntryfinalMonitor.Prop_1_handler_violation();
		}

		if ((cachehit == false) ) {
			Iterator_HasNext_i_Map_cachekey_i = i;
			Iterator_HasNext_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void Iterator_HasNext_nextEvent(Iterator i) {
		Iterator_HasNext_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<Iterator_HasNextMonitor> matchedLastMap = null;
		Iterator_HasNextMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == Iterator_HasNext_i_Map_cachekey_i) ) {
			matchedEntry = Iterator_HasNext_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<Iterator_HasNextMonitor> itmdMap = Iterator_HasNext_i_Map;
				matchedLastMap = itmdMap;
				Iterator_HasNextMonitor node_i = Iterator_HasNext_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			Iterator_HasNextMonitor created = new Iterator_HasNextMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final Iterator_HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_next(i);
		if(matchedEntryfinalMonitor.Iterator_HasNextMonitor_Prop_1_Category_violation) {
			matchedEntryfinalMonitor.Prop_1_handler_violation();
		}

		if ((cachehit == false) ) {
			Iterator_HasNext_i_Map_cachekey_i = i;
			Iterator_HasNext_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void Iterator_RemoveOnce_removeEvent(Iterator i) {
		Iterator_RemoveOnce_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<Iterator_RemoveOnceMonitor> matchedLastMap = null;
		Iterator_RemoveOnceMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == Iterator_RemoveOnce_i_Map_cachekey_i) ) {
			matchedEntry = Iterator_RemoveOnce_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<Iterator_RemoveOnceMonitor> itmdMap = Iterator_RemoveOnce_i_Map;
				matchedLastMap = itmdMap;
				Iterator_RemoveOnceMonitor node_i = Iterator_RemoveOnce_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			Iterator_RemoveOnceMonitor created = new Iterator_RemoveOnceMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final Iterator_RemoveOnceMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_remove(i);
		if(matchedEntryfinalMonitor.Iterator_RemoveOnceMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			Iterator_RemoveOnce_i_Map_cachekey_i = i;
			Iterator_RemoveOnce_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void Iterator_RemoveOnce_nextEvent(Iterator i) {
		Iterator_RemoveOnce_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<Iterator_RemoveOnceMonitor> matchedLastMap = null;
		Iterator_RemoveOnceMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == Iterator_RemoveOnce_i_Map_cachekey_i) ) {
			matchedEntry = Iterator_RemoveOnce_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<Iterator_RemoveOnceMonitor> itmdMap = Iterator_RemoveOnce_i_Map;
				matchedLastMap = itmdMap;
				Iterator_RemoveOnceMonitor node_i = Iterator_RemoveOnce_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			Iterator_RemoveOnceMonitor created = new Iterator_RemoveOnceMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final Iterator_RemoveOnceMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_next(i);
		if(matchedEntryfinalMonitor.Iterator_RemoveOnceMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			Iterator_RemoveOnce_i_Map_cachekey_i = i;
			Iterator_RemoveOnce_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_hasNextPrevious_hasnexttrueEvent(ListIterator i, boolean b) {
		ListIterator_hasNextPrevious_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<ListIterator_hasNextPreviousMonitor> matchedLastMap = null;
		ListIterator_hasNextPreviousMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == ListIterator_hasNextPrevious_i_Map_cachekey_i) ) {
			matchedEntry = ListIterator_hasNextPrevious_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<ListIterator_hasNextPreviousMonitor> itmdMap = ListIterator_hasNextPrevious_i_Map;
				matchedLastMap = itmdMap;
				ListIterator_hasNextPreviousMonitor node_i = ListIterator_hasNextPrevious_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			ListIterator_hasNextPreviousMonitor created = new ListIterator_hasNextPreviousMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final ListIterator_hasNextPreviousMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_hasnexttrue(i, b);
		if(matchedEntryfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			ListIterator_hasNextPrevious_i_Map_cachekey_i = i;
			ListIterator_hasNextPrevious_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_hasNextPrevious_hasnextfalseEvent(ListIterator i, boolean b) {
		ListIterator_hasNextPrevious_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<ListIterator_hasNextPreviousMonitor> matchedLastMap = null;
		ListIterator_hasNextPreviousMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == ListIterator_hasNextPrevious_i_Map_cachekey_i) ) {
			matchedEntry = ListIterator_hasNextPrevious_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<ListIterator_hasNextPreviousMonitor> itmdMap = ListIterator_hasNextPrevious_i_Map;
				matchedLastMap = itmdMap;
				ListIterator_hasNextPreviousMonitor node_i = ListIterator_hasNextPrevious_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			ListIterator_hasNextPreviousMonitor created = new ListIterator_hasNextPreviousMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final ListIterator_hasNextPreviousMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_hasnextfalse(i, b);
		if(matchedEntryfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			ListIterator_hasNextPrevious_i_Map_cachekey_i = i;
			ListIterator_hasNextPrevious_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_hasNextPrevious_nextEvent(ListIterator i) {
		ListIterator_hasNextPrevious_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<ListIterator_hasNextPreviousMonitor> matchedLastMap = null;
		ListIterator_hasNextPreviousMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == ListIterator_hasNextPrevious_i_Map_cachekey_i) ) {
			matchedEntry = ListIterator_hasNextPrevious_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<ListIterator_hasNextPreviousMonitor> itmdMap = ListIterator_hasNextPrevious_i_Map;
				matchedLastMap = itmdMap;
				ListIterator_hasNextPreviousMonitor node_i = ListIterator_hasNextPrevious_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			ListIterator_hasNextPreviousMonitor created = new ListIterator_hasNextPreviousMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final ListIterator_hasNextPreviousMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_next(i);
		if(matchedEntryfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			ListIterator_hasNextPrevious_i_Map_cachekey_i = i;
			ListIterator_hasNextPrevious_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_hasNextPrevious_hasprevioustrueEvent(ListIterator i, boolean b) {
		ListIterator_hasNextPrevious_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<ListIterator_hasNextPreviousMonitor> matchedLastMap = null;
		ListIterator_hasNextPreviousMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == ListIterator_hasNextPrevious_i_Map_cachekey_i) ) {
			matchedEntry = ListIterator_hasNextPrevious_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<ListIterator_hasNextPreviousMonitor> itmdMap = ListIterator_hasNextPrevious_i_Map;
				matchedLastMap = itmdMap;
				ListIterator_hasNextPreviousMonitor node_i = ListIterator_hasNextPrevious_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			ListIterator_hasNextPreviousMonitor created = new ListIterator_hasNextPreviousMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final ListIterator_hasNextPreviousMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_hasprevioustrue(i, b);
		if(matchedEntryfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			ListIterator_hasNextPrevious_i_Map_cachekey_i = i;
			ListIterator_hasNextPrevious_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_hasNextPrevious_haspreviousfalseEvent(ListIterator i, boolean b) {
		ListIterator_hasNextPrevious_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<ListIterator_hasNextPreviousMonitor> matchedLastMap = null;
		ListIterator_hasNextPreviousMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == ListIterator_hasNextPrevious_i_Map_cachekey_i) ) {
			matchedEntry = ListIterator_hasNextPrevious_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<ListIterator_hasNextPreviousMonitor> itmdMap = ListIterator_hasNextPrevious_i_Map;
				matchedLastMap = itmdMap;
				ListIterator_hasNextPreviousMonitor node_i = ListIterator_hasNextPrevious_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			ListIterator_hasNextPreviousMonitor created = new ListIterator_hasNextPreviousMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final ListIterator_hasNextPreviousMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_haspreviousfalse(i, b);
		if(matchedEntryfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			ListIterator_hasNextPrevious_i_Map_cachekey_i = i;
			ListIterator_hasNextPrevious_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_hasNextPrevious_previousEvent(ListIterator i) {
		ListIterator_hasNextPrevious_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<ListIterator_hasNextPreviousMonitor> matchedLastMap = null;
		ListIterator_hasNextPreviousMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == ListIterator_hasNextPrevious_i_Map_cachekey_i) ) {
			matchedEntry = ListIterator_hasNextPrevious_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<ListIterator_hasNextPreviousMonitor> itmdMap = ListIterator_hasNextPrevious_i_Map;
				matchedLastMap = itmdMap;
				ListIterator_hasNextPreviousMonitor node_i = ListIterator_hasNextPrevious_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			ListIterator_hasNextPreviousMonitor created = new ListIterator_hasNextPreviousMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final ListIterator_hasNextPreviousMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_previous(i);
		if(matchedEntryfinalMonitor.ListIterator_hasNextPreviousMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			ListIterator_hasNextPrevious_i_Map_cachekey_i = i;
			ListIterator_hasNextPrevious_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_RemoveOnce_removeEvent(ListIterator i) {
		ListIterator_RemoveOnce_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<ListIterator_RemoveOnceMonitor> matchedLastMap = null;
		ListIterator_RemoveOnceMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == ListIterator_RemoveOnce_i_Map_cachekey_i) ) {
			matchedEntry = ListIterator_RemoveOnce_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<ListIterator_RemoveOnceMonitor> itmdMap = ListIterator_RemoveOnce_i_Map;
				matchedLastMap = itmdMap;
				ListIterator_RemoveOnceMonitor node_i = ListIterator_RemoveOnce_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			ListIterator_RemoveOnceMonitor created = new ListIterator_RemoveOnceMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final ListIterator_RemoveOnceMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_remove(i);
		if(matchedEntryfinalMonitor.ListIterator_RemoveOnceMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			ListIterator_RemoveOnce_i_Map_cachekey_i = i;
			ListIterator_RemoveOnce_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_RemoveOnce_nextEvent(ListIterator i) {
		ListIterator_RemoveOnce_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<ListIterator_RemoveOnceMonitor> matchedLastMap = null;
		ListIterator_RemoveOnceMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == ListIterator_RemoveOnce_i_Map_cachekey_i) ) {
			matchedEntry = ListIterator_RemoveOnce_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<ListIterator_RemoveOnceMonitor> itmdMap = ListIterator_RemoveOnce_i_Map;
				matchedLastMap = itmdMap;
				ListIterator_RemoveOnceMonitor node_i = ListIterator_RemoveOnce_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			ListIterator_RemoveOnceMonitor created = new ListIterator_RemoveOnceMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final ListIterator_RemoveOnceMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_next(i);
		if(matchedEntryfinalMonitor.ListIterator_RemoveOnceMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			ListIterator_RemoveOnce_i_Map_cachekey_i = i;
			ListIterator_RemoveOnce_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_RemoveOnce_previousEvent(ListIterator i) {
		ListIterator_RemoveOnce_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<ListIterator_RemoveOnceMonitor> matchedLastMap = null;
		ListIterator_RemoveOnceMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == ListIterator_RemoveOnce_i_Map_cachekey_i) ) {
			matchedEntry = ListIterator_RemoveOnce_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<ListIterator_RemoveOnceMonitor> itmdMap = ListIterator_RemoveOnce_i_Map;
				matchedLastMap = itmdMap;
				ListIterator_RemoveOnceMonitor node_i = ListIterator_RemoveOnce_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			ListIterator_RemoveOnceMonitor created = new ListIterator_RemoveOnceMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final ListIterator_RemoveOnceMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_previous(i);
		if(matchedEntryfinalMonitor.ListIterator_RemoveOnceMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			ListIterator_RemoveOnce_i_Map_cachekey_i = i;
			ListIterator_RemoveOnce_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_Set_createEvent(ListIterator i) {
		ListIterator_Set_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<ListIterator_SetMonitor> matchedLastMap = null;
		ListIterator_SetMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == ListIterator_Set_i_Map_cachekey_i) ) {
			matchedEntry = ListIterator_Set_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<ListIterator_SetMonitor> itmdMap = ListIterator_Set_i_Map;
				matchedLastMap = itmdMap;
				ListIterator_SetMonitor node_i = ListIterator_Set_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			ListIterator_SetMonitor created = new ListIterator_SetMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final ListIterator_SetMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_create(i);
		if(matchedEntryfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			ListIterator_Set_i_Map_cachekey_i = i;
			ListIterator_Set_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_Set_removeEvent(ListIterator i) {
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (ListIterator_Set_activated) {
			ListIterator_SetMonitor matchedEntry = null;
			boolean cachehit = false;
			if ((i == ListIterator_Set_i_Map_cachekey_i) ) {
				matchedEntry = ListIterator_Set_i_Map_cachevalue;
				cachehit = true;
			}
			else {
				// FindEntry
				ListIterator_SetMonitor node_i = ListIterator_Set_i_Map.getNodeWithStrongRef(i) ;
				matchedEntry = node_i;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				final ListIterator_SetMonitor matchedEntryfinalMonitor = matchedEntry;
				matchedEntry.Prop_1_event_remove(i);
				if(matchedEntryfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
					matchedEntryfinalMonitor.Prop_1_handler_fail();
				}

				if ((cachehit == false) ) {
					ListIterator_Set_i_Map_cachekey_i = i;
					ListIterator_Set_i_Map_cachevalue = matchedEntry;
				}
			}

		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_Set_addEvent(ListIterator i) {
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (ListIterator_Set_activated) {
			ListIterator_SetMonitor matchedEntry = null;
			boolean cachehit = false;
			if ((i == ListIterator_Set_i_Map_cachekey_i) ) {
				matchedEntry = ListIterator_Set_i_Map_cachevalue;
				cachehit = true;
			}
			else {
				// FindEntry
				ListIterator_SetMonitor node_i = ListIterator_Set_i_Map.getNodeWithStrongRef(i) ;
				matchedEntry = node_i;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				final ListIterator_SetMonitor matchedEntryfinalMonitor = matchedEntry;
				matchedEntry.Prop_1_event_add(i);
				if(matchedEntryfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
					matchedEntryfinalMonitor.Prop_1_handler_fail();
				}

				if ((cachehit == false) ) {
					ListIterator_Set_i_Map_cachekey_i = i;
					ListIterator_Set_i_Map_cachevalue = matchedEntry;
				}
			}

		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_Set_nextEvent(ListIterator i) {
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (ListIterator_Set_activated) {
			ListIterator_SetMonitor matchedEntry = null;
			boolean cachehit = false;
			if ((i == ListIterator_Set_i_Map_cachekey_i) ) {
				matchedEntry = ListIterator_Set_i_Map_cachevalue;
				cachehit = true;
			}
			else {
				// FindEntry
				ListIterator_SetMonitor node_i = ListIterator_Set_i_Map.getNodeWithStrongRef(i) ;
				matchedEntry = node_i;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				final ListIterator_SetMonitor matchedEntryfinalMonitor = matchedEntry;
				matchedEntry.Prop_1_event_next(i);
				if(matchedEntryfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
					matchedEntryfinalMonitor.Prop_1_handler_fail();
				}

				if ((cachehit == false) ) {
					ListIterator_Set_i_Map_cachekey_i = i;
					ListIterator_Set_i_Map_cachevalue = matchedEntry;
				}
			}

		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_Set_previousEvent(ListIterator i) {
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (ListIterator_Set_activated) {
			ListIterator_SetMonitor matchedEntry = null;
			boolean cachehit = false;
			if ((i == ListIterator_Set_i_Map_cachekey_i) ) {
				matchedEntry = ListIterator_Set_i_Map_cachevalue;
				cachehit = true;
			}
			else {
				// FindEntry
				ListIterator_SetMonitor node_i = ListIterator_Set_i_Map.getNodeWithStrongRef(i) ;
				matchedEntry = node_i;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				final ListIterator_SetMonitor matchedEntryfinalMonitor = matchedEntry;
				matchedEntry.Prop_1_event_previous(i);
				if(matchedEntryfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
					matchedEntryfinalMonitor.Prop_1_handler_fail();
				}

				if ((cachehit == false) ) {
					ListIterator_Set_i_Map_cachekey_i = i;
					ListIterator_Set_i_Map_cachevalue = matchedEntry;
				}
			}

		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void ListIterator_Set_setEvent(ListIterator i) {
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (ListIterator_Set_activated) {
			ListIterator_SetMonitor matchedEntry = null;
			boolean cachehit = false;
			if ((i == ListIterator_Set_i_Map_cachekey_i) ) {
				matchedEntry = ListIterator_Set_i_Map_cachevalue;
				cachehit = true;
			}
			else {
				// FindEntry
				ListIterator_SetMonitor node_i = ListIterator_Set_i_Map.getNodeWithStrongRef(i) ;
				matchedEntry = node_i;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				final ListIterator_SetMonitor matchedEntryfinalMonitor = matchedEntry;
				matchedEntry.Prop_1_event_set(i);
				if(matchedEntryfinalMonitor.ListIterator_SetMonitor_Prop_1_Category_fail) {
					matchedEntryfinalMonitor.Prop_1_handler_fail();
				}

				if ((cachehit == false) ) {
					ListIterator_Set_i_Map_cachekey_i = i;
					ListIterator_Set_i_Map_cachevalue = matchedEntry;
				}
			}

		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void List_UnsafeListIterator_createEvent(List l, ListIterator i) {
		List_UnsafeListIterator_activated = true;
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		CachedWeakReference wr_l = null;
		MapOfMonitor<List_UnsafeListIteratorMonitor> matchedLastMap = null;
		List_UnsafeListIteratorMonitor matchedEntry = null;
		boolean cachehit = false;
		if (((i == List_UnsafeListIterator_l_i_Map_cachekey_i) && (l == List_UnsafeListIterator_l_i_Map_cachekey_l) ) ) {
			matchedEntry = List_UnsafeListIterator_l_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_l = new CachedWeakReference(l) ;
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				Tuple2<MapOfMonitor<List_UnsafeListIteratorMonitor>, List_UnsafeListIteratorMonitor_Set> node_l = List_UnsafeListIterator_l_i_Map.getNodeEquivalent(wr_l) ;
				if ((node_l == null) ) {
					node_l = new Tuple2<MapOfMonitor<List_UnsafeListIteratorMonitor>, List_UnsafeListIteratorMonitor_Set>() ;
					List_UnsafeListIterator_l_i_Map.putNode(wr_l, node_l) ;
					node_l.setValue1(new MapOfMonitor<List_UnsafeListIteratorMonitor>(1) ) ;
					node_l.setValue2(new List_UnsafeListIteratorMonitor_Set() ) ;
				}
				MapOfMonitor<List_UnsafeListIteratorMonitor> itmdMap = node_l.getValue1() ;
				matchedLastMap = itmdMap;
				List_UnsafeListIteratorMonitor node_l_i = node_l.getValue1() .getNodeEquivalent(wr_i) ;
				matchedEntry = node_l_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_l == null) ) {
				wr_l = new CachedWeakReference(l) ;
			}
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			List_UnsafeListIteratorMonitor created = new List_UnsafeListIteratorMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
			// D(X) defineNew:5 for <i>
			{
				// InsertMonitor
				List_UnsafeListIteratorMonitor_Set node_i = List_UnsafeListIterator_i_Map.getNodeEquivalent(wr_i) ;
				if ((node_i == null) ) {
					node_i = new List_UnsafeListIteratorMonitor_Set() ;
					List_UnsafeListIterator_i_Map.putNode(wr_i, node_i) ;
				}
				node_i.add(created) ;
			}
			// D(X) defineNew:5 for <l>
			{
				// InsertMonitor
				Tuple2<MapOfMonitor<List_UnsafeListIteratorMonitor>, List_UnsafeListIteratorMonitor_Set> node_l = List_UnsafeListIterator_l_i_Map.getNodeEquivalent(wr_l) ;
				if ((node_l == null) ) {
					node_l = new Tuple2<MapOfMonitor<List_UnsafeListIteratorMonitor>, List_UnsafeListIteratorMonitor_Set>() ;
					List_UnsafeListIterator_l_i_Map.putNode(wr_l, node_l) ;
					node_l.setValue1(new MapOfMonitor<List_UnsafeListIteratorMonitor>(1) ) ;
					node_l.setValue2(new List_UnsafeListIteratorMonitor_Set() ) ;
				}
				List_UnsafeListIteratorMonitor_Set targetSet = node_l.getValue2() ;
				targetSet.add(created) ;
			}
		}
		// D(X) main:8--9
		final List_UnsafeListIteratorMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_create(l, i);
		if(matchedEntryfinalMonitor.List_UnsafeListIteratorMonitor_Prop_1_Category_match) {
			matchedEntryfinalMonitor.Prop_1_handler_match();
		}

		if ((cachehit == false) ) {
			List_UnsafeListIterator_l_i_Map_cachekey_i = i;
			List_UnsafeListIterator_l_i_Map_cachekey_l = l;
			List_UnsafeListIterator_l_i_Map_cachevalue = matchedEntry;
		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void List_UnsafeListIterator_modifyEvent(List l) {
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (List_UnsafeListIterator_activated) {
			Tuple2<MapOfMonitor<List_UnsafeListIteratorMonitor>, List_UnsafeListIteratorMonitor_Set> matchedEntry = null;
			boolean cachehit = false;
			if ((l == List_UnsafeListIterator_l_Map_cachekey_l) ) {
				matchedEntry = List_UnsafeListIterator_l_Map_cachevalue;
				cachehit = true;
			}
			else {
				// FindEntry
				Tuple2<MapOfMonitor<List_UnsafeListIteratorMonitor>, List_UnsafeListIteratorMonitor_Set> node_l = List_UnsafeListIterator_l_i_Map.getNodeWithStrongRef(l) ;
				if ((node_l != null) ) {
					matchedEntry = node_l;
				}
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				List_UnsafeListIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
				if ((stateTransitionedSet != null) ) {
					stateTransitionedSet.event_modify(l);

					if ((cachehit == false) ) {
						List_UnsafeListIterator_l_Map_cachekey_l = l;
						List_UnsafeListIterator_l_Map_cachevalue = matchedEntry;
					}
				}
			}

		}

		MultiSpec_1_RVMLock.unlock();
	}

	public static final void List_UnsafeListIterator_useiterEvent(ListIterator i) {
		while (!MultiSpec_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (List_UnsafeListIterator_activated) {
			List_UnsafeListIteratorMonitor_Set matchedEntry = null;
			boolean cachehit = false;
			if ((i == List_UnsafeListIterator_i_Map_cachekey_i) ) {
				matchedEntry = List_UnsafeListIterator_i_Map_cachevalue;
				cachehit = true;
			}
			else {
				// FindEntry
				List_UnsafeListIteratorMonitor_Set node_i = List_UnsafeListIterator_i_Map.getNodeWithStrongRef(i) ;
				if ((node_i != null) ) {
					matchedEntry = node_i;
				}
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_useiter(i);

				if ((cachehit == false) ) {
					List_UnsafeListIterator_i_Map_cachekey_i = i;
					List_UnsafeListIterator_i_Map_cachevalue = matchedEntry;
				}
			}

		}

		MultiSpec_1_RVMLock.unlock();
	}

}


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
	pointcut List_UnsafeListIterator_useiter(ListIterator i) : ((call(* Iterator+.hasNext(..)) || call(* ListIterator+.hasPrevious(..)) || call(* Iterator+.next(..)) || call(* ListIterator+.previous(..)) || call(* ListIterator+.nextIndex(..)) || call(* ListIterator+.previousIndex(..))) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : List_UnsafeListIterator_useiter(i) {
		MultiSpec_1RuntimeMonitor.List_UnsafeListIterator_useiterEvent(i);
	}

	pointcut List_UnsafeListIterator_modify(List l) : ((call(* Collection+.add*(..)) || call(* Collection+.clear(..)) || call(* Collection+.remove*(..)) || call(* Collection+.retain*(..))) && target(l)) && MOP_CommonPointCut();
	before (List l) : List_UnsafeListIterator_modify(l) {
		MultiSpec_1RuntimeMonitor.List_UnsafeListIterator_modifyEvent(l);
	}

	pointcut ListIterator_Set_set(ListIterator i) : (call(* ListIterator+.set(..)) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_Set_set(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_Set_setEvent(i);
	}

	pointcut ListIterator_Set_add(ListIterator i) : (call(void ListIterator+.add(..)) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_Set_add(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_Set_addEvent(i);
	}

	pointcut ListIterator_RemoveOnce_previous(ListIterator i) : (call(* ListIterator+.previous()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_RemoveOnce_previous(i) {
		//ListIterator_Set_previous
		MultiSpec_1RuntimeMonitor.ListIterator_Set_previousEvent(i);
		//ListIterator_RemoveOnce_previous
		MultiSpec_1RuntimeMonitor.ListIterator_RemoveOnce_previousEvent(i);
	}

	pointcut Iterator_HasNext_next(ListIterator i) : (call(* Iterator+.next()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : Iterator_HasNext_next(i) {
		//ListIterator_Set_next
		MultiSpec_1RuntimeMonitor.ListIterator_Set_nextEvent(i);
		//ListIterator_RemoveOnce_next
		MultiSpec_1RuntimeMonitor.ListIterator_RemoveOnce_nextEvent(i);
	}

	pointcut Iterator_RemoveOnce_remove(ListIterator i) : (call(void Iterator+.remove()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : Iterator_RemoveOnce_remove(i) {
		//ListIterator_Set_remove
		MultiSpec_1RuntimeMonitor.ListIterator_Set_removeEvent(i);
		//ListIterator_RemoveOnce_remove
		MultiSpec_1RuntimeMonitor.ListIterator_RemoveOnce_removeEvent(i);
	}

	pointcut ListIterator_hasNextPrevious_previous(ListIterator i) : (call(* ListIterator.previous()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_hasNextPrevious_previous(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_previousEvent(i);
	}

	pointcut ListIterator_hasNextPrevious_next(ListIterator i) : (call(* ListIterator.next()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_hasNextPrevious_next(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_nextEvent(i);
	}

	before (Iterator i) : Iterator_RemoveOnce_remove(i) {
		MultiSpec_1RuntimeMonitor.Iterator_RemoveOnce_removeEvent(i);
	}

	before (Iterator i) : Iterator_HasNext_next(i) {
		//Iterator_RemoveOnce_next
		MultiSpec_1RuntimeMonitor.Iterator_RemoveOnce_nextEvent(i);
		//Iterator_HasNext_next
		MultiSpec_1RuntimeMonitor.Iterator_HasNext_nextEvent(i);
	}

	pointcut Iterator_HasNext_hasnexttrue(Iterator i) : (call(* Iterator+.hasNext()) && target(i)) && MOP_CommonPointCut();
	after (Iterator i) returning (boolean b) : Iterator_HasNext_hasnexttrue(i) {
		//Iterator_HasNext_hasnexttrue
		MultiSpec_1RuntimeMonitor.Iterator_HasNext_hasnexttrueEvent(i, b);
		//Iterator_HasNext_hasnextfalse
		MultiSpec_1RuntimeMonitor.Iterator_HasNext_hasnextfalseEvent(i, b);
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

	pointcut ListIterator_Set_create() : (call(ListIterator Iterable+.listIterator())) && MOP_CommonPointCut();
	after () returning (ListIterator i) : ListIterator_Set_create() {
		MultiSpec_1RuntimeMonitor.ListIterator_Set_createEvent(i);
	}

	pointcut List_UnsafeListIterator_create(List l) : (call(ListIterator List+.listIterator()) && target(l)) && MOP_CommonPointCut();
	after (List l) returning (ListIterator i) : List_UnsafeListIterator_create(l) {
		MultiSpec_1RuntimeMonitor.List_UnsafeListIterator_createEvent(l, i);
	}

}
