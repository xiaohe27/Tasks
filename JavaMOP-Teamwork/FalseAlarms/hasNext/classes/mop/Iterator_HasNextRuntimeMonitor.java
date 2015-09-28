package mop;
import java.util.*;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging.Level;
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
				if(monitorfinalMonitor.Prop_1_Category_violation) {
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
				if(monitorfinalMonitor.Prop_1_Category_violation) {
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
				if(monitorfinalMonitor.Prop_1_Category_violation) {
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

	static final int Prop_1_transition_hasnexttrue[] = {1, 1, 3, 3};;
	static final int Prop_1_transition_hasnextfalse[] = {0, 0, 3, 3};;
	static final int Prop_1_transition_next[] = {2, 0, 3, 3};;

	volatile boolean Prop_1_Category_violation = false;

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
		this.Prop_1_Category_violation = nextstate == 2;

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
		this.Prop_1_Category_violation = nextstate == 2;

		return true;
	}

	final boolean Prop_1_event_next(Iterator i) {
		{
		}

		int nextstate = this.handleEvent(2, Prop_1_transition_next) ;
		this.Prop_1_Category_violation = nextstate == 2;

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

		Prop_1_Category_violation = false;
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

public final class Iterator_HasNextRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager Iterator_HasNextMapManager;
	static {
		Iterator_HasNextMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		Iterator_HasNextMapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock Iterator_HasNext_RVMLock = new ReentrantLock();
	static final Condition Iterator_HasNext_RVMLock_cond = Iterator_HasNext_RVMLock.newCondition();

	private static boolean Iterator_HasNext_activated = false;

	// Declarations for Indexing Trees
	private static Object Iterator_HasNext_i_Map_cachekey_i;
	private static Iterator_HasNextMonitor Iterator_HasNext_i_Map_cachevalue;
	private static final MapOfMonitor<Iterator_HasNextMonitor> Iterator_HasNext_i_Map = new MapOfMonitor<Iterator_HasNextMonitor>(0) ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += Iterator_HasNext_i_Map.cleanUpUnnecessaryMappings();
		return collected;
	}

	static {
	}

	public static void actionsAtTheEnd(){
	}
	// Removing terminated monitors from partitioned sets
	static {
		TerminatedMonitorCleaner.start() ;
	}
	// Setting the behavior of the runtime library according to the compile-time option
	static {
		RuntimeOption.enableFineGrainedLock(false) ;
		RuntimeOption.setIndexByVal(false) ;
	}

	public static final void hasnexttrueEvent(Iterator i, boolean b) {
		Iterator_HasNext_activated = true;
		while (!Iterator_HasNext_RVMLock.tryLock()) {
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
		if(matchedEntryfinalMonitor.Prop_1_Category_violation) {
			matchedEntryfinalMonitor.Prop_1_handler_violation();
		}

		if ((cachehit == false) ) {
			Iterator_HasNext_i_Map_cachekey_i = i;
			Iterator_HasNext_i_Map_cachevalue = matchedEntry;
		}

		Iterator_HasNext_RVMLock.unlock();
	}

	public static final void hasnextfalseEvent(Iterator i, boolean b) {
		Iterator_HasNext_activated = true;
		while (!Iterator_HasNext_RVMLock.tryLock()) {
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
		if(matchedEntryfinalMonitor.Prop_1_Category_violation) {
			matchedEntryfinalMonitor.Prop_1_handler_violation();
		}

		if ((cachehit == false) ) {
			Iterator_HasNext_i_Map_cachekey_i = i;
			Iterator_HasNext_i_Map_cachevalue = matchedEntry;
		}

		Iterator_HasNext_RVMLock.unlock();
	}

	public static final void nextEvent(Iterator i) {
		Iterator_HasNext_activated = true;
		while (!Iterator_HasNext_RVMLock.tryLock()) {
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
		if(matchedEntryfinalMonitor.Prop_1_Category_violation) {
			matchedEntryfinalMonitor.Prop_1_handler_violation();
		}

		if ((cachehit == false) ) {
			Iterator_HasNext_i_Map_cachekey_i = i;
			Iterator_HasNext_i_Map_cachevalue = matchedEntry;
		}

		Iterator_HasNext_RVMLock.unlock();
	}

}
