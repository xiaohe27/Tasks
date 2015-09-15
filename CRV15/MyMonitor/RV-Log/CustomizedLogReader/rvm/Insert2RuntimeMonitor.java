package rvm;
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
import com.runtimeverification.rvmonitor.java.rt.time.*;
import com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitor;

final class Insert2Monitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<Insert2Monitor> {

	Insert2Monitor_Set(){
		this.size = 0;
		this.elements = new Insert2Monitor[4];
	}
	final void event_insert(String user, String db, String data, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_insert(user, db, data, time);
				if(monitorfinalMonitor.Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_insert2DB2(String data, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_insert2DB2(data, time);
				if(monitorfinalMonitor.Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_insert2DB3(String data, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_insert2DB3(data, time);
				if(monitorfinalMonitor.Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
}

class Insert2Monitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			Insert2Monitor ret = (Insert2Monitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	static final int Prop_1_transition_insert[] = {0, 1};;
	static final int Prop_1_transition_insert2DB2[] = {0, 1};;
	static final int Prop_1_transition_insert2DB3[] = {0, 1};;

	volatile boolean Prop_1_Category_fail = false;

	private final AtomicInteger pairValue;

	Insert2Monitor() {
		this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;

	}

	@Override public final int getState() {
		return this.getState(this.pairValue.get() ) ;
	}
	@Override public final int getLastEvent() {
		return this.getLastEvent(this.pairValue.get() ) ;
	}
	private final int getState(int pairValue) {
		return (pairValue & 1) ;
	}
	private final int getLastEvent(int pairValue) {
		return (pairValue >> 1) ;
	}
	private final int calculatePairValue(int lastEvent, int state) {
		return (((lastEvent + 1) << 1) | state) ;
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

	final boolean Prop_1_event_insert(String user, String db, String data, long time) {
		{
			if (db != null && db.equals("db2"))
			{
				Prop_1_event_insert2DB2(data, time);
			}

			if (db != null && db.equals("db3"))
			{
				Prop_1_event_insert2DB3(data, time);
			}
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_insert) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_insert2DB2(String data, long time) {
		{}

		int nextstate = this.handleEvent(1, Prop_1_transition_insert2DB2) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_insert2DB3(String data, long time) {
		{}

		int nextstate = this.handleEvent(2, Prop_1_transition_insert2DB3) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final void Prop_1_handler_fail (){
		{System.err.println("The data is not propagated to db3 after inserting to db2.");}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		Prop_1_Category_fail = false;
	}

	// RVMRef_data was suppressed to reduce memory overhead

	@Override
	protected final void terminateInternal(int idnum) {
		int lastEvent = this.getLastEvent();

		switch(idnum){
			case 0:
			break;
		}
		switch(lastEvent) {
			case -1:
			return;
			case 0:
			//insert
			return;
			case 1:
			//insert2DB2
			return;
			case 2:
			//insert2DB3
			return;
		}
		return;
	}

	public static int getNumberOfEvents() {
		return 3;
	}

	public static int getNumberOfStates() {
		return 2;
	}

}

public final class Insert2RuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager Insert2MapManager;
	static {
		Insert2MapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		Insert2MapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock Insert2_RVMLock = new ReentrantLock();
	static final Condition Insert2_RVMLock_cond = Insert2_RVMLock.newCondition();

	private static boolean Insert2_activated = false;

	// Declarations for Indexing Trees
	private static Object Insert2_data_Map_cachekey_data;
	private static Insert2Monitor Insert2_data_Map_cachevalue;
	private static final MapOfMonitor<Insert2Monitor> Insert2_data_Map = new MapOfMonitor<Insert2Monitor>(0) ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += Insert2_data_Map.cleanUpUnnecessaryMappings();
		return collected;
	}

	static {
		Constraint_future c1476394199 = new Constraint_future();
		c1476394199.addConstraint("insert2DB3", "[0, 60]");
		AbstractMonitor.putConstraint("insert2DB2", c1476394199);
	}

	protected static final TimeReminder timeReminder = new TimeReminder(0L, 9223372036854775807L);
	static int beginEventCount = 0;
	static int endEventCount = 0;

	static {
		TimeReminder.beginBaseTime = 0;
		TimeReminder.endBaseTime = 0;
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
		RuntimeOption.setIndexByVal(true) ;
	}

	public static final void insertEvent(String user, String db, String data, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		timeReminder.update("insert", time);

		CachedWeakReference wr_data = null;
		MapOfMonitor<Insert2Monitor> matchedLastMap = null;
		Insert2Monitor matchedEntry = null;
		boolean cachehit = false;
		if ((data == Insert2_data_Map_cachekey_data) ) {
			matchedEntry = Insert2_data_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_data = new CachedWeakReference(data) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<Insert2Monitor> itmdMap = Insert2_data_Map;
				matchedLastMap = itmdMap;
				Insert2Monitor node_data = Insert2_data_Map.getNodeEquivalent(wr_data) ;
				matchedEntry = node_data;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_data == null) ) {
				wr_data = new CachedWeakReference(data) ;
			}
			// D(X) main:4
			Insert2Monitor created = new Insert2Monitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_data, created) ;
		}
		// D(X) main:8--9
		final Insert2Monitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_insert(user, db, data, time);
		if(matchedEntryfinalMonitor.Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			Insert2_data_Map_cachekey_data = data;
			Insert2_data_Map_cachevalue = matchedEntry;
		}

		Insert2_RVMLock.unlock();
	}

	public static final void insert2DB2Event(String data, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		timeReminder.update("insert2DB2", time);

		CachedWeakReference wr_data = null;
		MapOfMonitor<Insert2Monitor> matchedLastMap = null;
		Insert2Monitor matchedEntry = null;
		boolean cachehit = false;
		if ((data == Insert2_data_Map_cachekey_data) ) {
			matchedEntry = Insert2_data_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_data = new CachedWeakReference(data) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<Insert2Monitor> itmdMap = Insert2_data_Map;
				matchedLastMap = itmdMap;
				Insert2Monitor node_data = Insert2_data_Map.getNodeEquivalent(wr_data) ;
				matchedEntry = node_data;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_data == null) ) {
				wr_data = new CachedWeakReference(data) ;
			}
			// D(X) main:4
			Insert2Monitor created = new Insert2Monitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_data, created) ;
		}
		// D(X) main:8--9
		final Insert2Monitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_insert2DB2(data, time);
		if(matchedEntryfinalMonitor.Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			Insert2_data_Map_cachekey_data = data;
			Insert2_data_Map_cachevalue = matchedEntry;
		}

		Insert2_RVMLock.unlock();
	}

	public static final void insert2DB3Event(String data, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		timeReminder.update("insert2DB3", time);

		CachedWeakReference wr_data = null;
		MapOfMonitor<Insert2Monitor> matchedLastMap = null;
		Insert2Monitor matchedEntry = null;
		boolean cachehit = false;
		if ((data == Insert2_data_Map_cachekey_data) ) {
			matchedEntry = Insert2_data_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_data = new CachedWeakReference(data) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<Insert2Monitor> itmdMap = Insert2_data_Map;
				matchedLastMap = itmdMap;
				Insert2Monitor node_data = Insert2_data_Map.getNodeEquivalent(wr_data) ;
				matchedEntry = node_data;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_data == null) ) {
				wr_data = new CachedWeakReference(data) ;
			}
			// D(X) main:4
			Insert2Monitor created = new Insert2Monitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_data, created) ;
		}
		// D(X) main:8--9
		final Insert2Monitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_insert2DB3(data, time);
		if(matchedEntryfinalMonitor.Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			Insert2_data_Map_cachekey_data = data;
			Insert2_data_Map_cachevalue = matchedEntry;
		}

		Insert2_RVMLock.unlock();
	}

}
