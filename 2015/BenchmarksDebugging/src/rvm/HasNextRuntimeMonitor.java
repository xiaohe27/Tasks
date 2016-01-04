package rvm;
import com.runtimeverification.rvmonitor.java.rt.RuntimeOption;
import com.runtimeverification.rvmonitor.java.rt.ref.CachedStrongReference;
import com.runtimeverification.rvmonitor.java.rt.table.MapOfMonitor;
import com.runtimeverification.rvmonitor.java.rt.tablebase.TerminatedMonitorCleaner;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

final class HasNextMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<HasNextMonitor> {

	HasNextMonitor_Set(){
		this.size = 0;
		this.elements = new HasNextMonitor[4];
	}
	final void event_hasNextTrue(Integer iterator, boolean b) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			HasNextMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final HasNextMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_hasNextTrue(iterator, b);
				if(monitorfinalMonitor.Prop_1_Category_violation) {
					monitorfinalMonitor.Prop_1_handler_violation();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_hasNextFalse(Integer iterator, boolean b) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			HasNextMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final HasNextMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_hasNextFalse(iterator, b);
				if(monitorfinalMonitor.Prop_1_Category_violation) {
					monitorfinalMonitor.Prop_1_handler_violation();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_next(Integer iterator) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			HasNextMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final HasNextMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_next(iterator);
				if(monitorfinalMonitor.Prop_1_Category_violation) {
					monitorfinalMonitor.Prop_1_handler_violation();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
}

class HasNextMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			HasNextMonitor ret = (HasNextMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	private Integer iterator;
	public static boolean hasViolation;

	static final int Prop_1_transition_hasNextTrue[] = {1, 1, 3, 3};;
	static final int Prop_1_transition_hasNextFalse[] = {0, 0, 3, 3};;
	static final int Prop_1_transition_next[] = {2, 0, 3, 3};;

	volatile boolean Prop_1_Category_violation = false;

	private final AtomicInteger pairValue;

	HasNextMonitor() {
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

	final boolean Prop_1_event_hasNextTrue(Integer iterator, boolean b) {
		{
			this.iterator = iterator;
			if ( ! (b) ) {
				return false;
			}
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_hasNextTrue) ;
		this.Prop_1_Category_violation = nextstate == 2;

		return true;
	}

	final boolean Prop_1_event_hasNextFalse(Integer iterator, boolean b) {
		{
			this.iterator = iterator;
			if ( b ) {
				return false;
			}
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_hasNextFalse) ;
		this.Prop_1_Category_violation = nextstate == 2;

		return true;
	}

	final boolean Prop_1_event_next(Integer iterator) {
		{
			this.iterator = iterator;
		}

		int nextstate = this.handleEvent(2, Prop_1_transition_next) ;
		this.Prop_1_Category_violation = nextstate == 2;

		return true;
	}

	final void Prop_1_handler_violation (){
		{
			System.err.println("Violation. Iterator:" + this.iterator);
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		Prop_1_Category_violation = false;
	}

	// RVMRef_iterator was suppressed to reduce memory overhead

	//alive_parameters_0 = [Integer iterator]
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
			//hasNextTrue
			//alive_iterator
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//hasNextFalse
			//alive_iterator
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 2:
			//next
			//alive_iterator
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

public final class HasNextRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager HasNextMapManager;
	static {
		HasNextMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		HasNextMapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock HasNext_RVMLock = new ReentrantLock();
	static final Condition HasNext_RVMLock_cond = HasNext_RVMLock.newCondition();

	private static boolean HasNext_activated = false;

	// Declarations for Indexing Trees
	private static Object HasNext_iterator_Map_cachekey_iterator;
	private static HasNextMonitor HasNext_iterator_Map_cachevalue;
	private static final MapOfMonitor<HasNextMonitor> HasNext_iterator_Map = new MapOfMonitor<HasNextMonitor>(0) ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += HasNext_iterator_Map.cleanUpUnnecessaryMappings();
		return collected;
	}

	// Removing terminated monitors from partitioned sets
	static {
		TerminatedMonitorCleaner.start() ;
	}
	// Setting the behavior of the runtime library according to the compile-time option
	static {
		RuntimeOption.enableFineGrainedLock(false) ;
		RuntimeOption.setIndexByVal(true) ;
	}

	public static final void hasNextTrueEvent(Integer iterator, boolean b) {
		HasNext_activated = true;
		while (!HasNext_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedStrongReference wr_iterator = null;
		MapOfMonitor<HasNextMonitor> matchedLastMap = null;
		HasNextMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((iterator .equals( HasNext_iterator_Map_cachekey_iterator) ) ) {
			matchedEntry = HasNext_iterator_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_iterator = new CachedStrongReference(iterator) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<HasNextMonitor> itmdMap = HasNext_iterator_Map;
				matchedLastMap = itmdMap;
				HasNextMonitor node_iterator = HasNext_iterator_Map.getNodeEquivalent(wr_iterator) ;
				matchedEntry = node_iterator;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_iterator == null) ) {
				wr_iterator = new CachedStrongReference(iterator) ;
			}
			// D(X) main:4
			HasNextMonitor created = new HasNextMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_iterator, created) ;
		}
		// D(X) main:8--9
		final HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_hasNextTrue(iterator, b);
		if(matchedEntryfinalMonitor.Prop_1_Category_violation) {
			matchedEntryfinalMonitor.Prop_1_handler_violation();
		}

		if ((cachehit == false) ) {
			HasNext_iterator_Map_cachekey_iterator = iterator;
			HasNext_iterator_Map_cachevalue = matchedEntry;
		}

		HasNext_RVMLock.unlock();
	}

	public static final void hasNextFalseEvent(Integer iterator, boolean b) {
		HasNext_activated = true;
		while (!HasNext_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedStrongReference wr_iterator = null;
		MapOfMonitor<HasNextMonitor> matchedLastMap = null;
		HasNextMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((iterator .equals( HasNext_iterator_Map_cachekey_iterator) ) ) {
			matchedEntry = HasNext_iterator_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_iterator = new CachedStrongReference(iterator) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<HasNextMonitor> itmdMap = HasNext_iterator_Map;
				matchedLastMap = itmdMap;
				HasNextMonitor node_iterator = HasNext_iterator_Map.getNodeEquivalent(wr_iterator) ;
				matchedEntry = node_iterator;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_iterator == null) ) {
				wr_iterator = new CachedStrongReference(iterator) ;
			}
			// D(X) main:4
			HasNextMonitor created = new HasNextMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_iterator, created) ;
		}
		// D(X) main:8--9
		final HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_hasNextFalse(iterator, b);
		if(matchedEntryfinalMonitor.Prop_1_Category_violation) {
			matchedEntryfinalMonitor.Prop_1_handler_violation();
		}

		if ((cachehit == false) ) {
			HasNext_iterator_Map_cachekey_iterator = iterator;
			HasNext_iterator_Map_cachevalue = matchedEntry;
		}

		HasNext_RVMLock.unlock();
	}

	public static final void nextEvent(Integer iterator) {
		HasNext_activated = true;
		while (!HasNext_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedStrongReference wr_iterator = null;
		MapOfMonitor<HasNextMonitor> matchedLastMap = null;
		HasNextMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((iterator .equals( HasNext_iterator_Map_cachekey_iterator) ) ) {
			matchedEntry = HasNext_iterator_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_iterator = new CachedStrongReference(iterator) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<HasNextMonitor> itmdMap = HasNext_iterator_Map;
				matchedLastMap = itmdMap;
				HasNextMonitor node_iterator = HasNext_iterator_Map.getNodeEquivalent(wr_iterator) ;
				matchedEntry = node_iterator;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_iterator == null) ) {
				wr_iterator = new CachedStrongReference(iterator) ;
			}
			// D(X) main:4
			HasNextMonitor created = new HasNextMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_iterator, created) ;
		}
		// D(X) main:8--9
		final HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_next(iterator);
		if(matchedEntryfinalMonitor.Prop_1_Category_violation) {
			matchedEntryfinalMonitor.Prop_1_handler_violation();
		}

		if ((cachehit == false) ) {
			HasNext_iterator_Map_cachekey_iterator = iterator;
			HasNext_iterator_Map_cachevalue = matchedEntry;
		}

		HasNext_RVMLock.unlock();
	}

}
