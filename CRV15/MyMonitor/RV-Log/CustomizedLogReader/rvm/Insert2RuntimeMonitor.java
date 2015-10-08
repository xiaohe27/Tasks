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

final class Insert2Monitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<Insert2Monitor> {

	Insert2Monitor_Set(){
		this.size = 0;
		this.elements = new Insert2Monitor[4];
	}
	final void event_insert(String user, String db, String p, String data, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_insert(user, db, p, data, time);
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
	final void event_select(String user, String b, String c, String d, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_select(user, b, c, d, time);
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
	final void event_update(String user, String b, String c, String d, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_update(user, b, c, d, time);
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
	final void event_delete(String user, String b, String c, String d, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_delete(user, b, c, d, time);
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
	final void event_script_start(String user, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_script_start(user, time);
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
	final void event_script_end(String user, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_script_end(user, time);
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
	final void event_script_svn(String user, String b, String c, int d, int e, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_script_svn(user, b, c, d, e, time);
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
	final void event_script_md5(String user, String b, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_script_md5(user, b, time);
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
	final void event_commit(String user, int b, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Insert2Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Insert2Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_commit(user, b, time);
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

	static LinkedList<Insert2Monitor> monitorList = new LinkedList<>();

	static void check(long time){
		int size=monitorList.size();

		while(!monitorList.isEmpty()){
			Insert2Monitor monitor = monitorList.getFirst();
			if(monitor.deadline > time)
			return;

			if(monitor.ok)
			monitorList.removeFirst();

			else{
				System.err.println("expected data '" + monitor.dat + "' is not inserted into db3 before time " + monitor.deadline);
				System.exit(1);
			}
		}
	}

	private boolean ok;

	private long deadline;
	private String dat;

	WeakReference Ref_data = null;

	static final int Prop_1_transition_insert[] = {0, 1};;
	static final int Prop_1_transition_select[] = {0, 1};;
	static final int Prop_1_transition_update[] = {0, 1};;
	static final int Prop_1_transition_delete[] = {0, 1};;
	static final int Prop_1_transition_script_start[] = {0, 1};;
	static final int Prop_1_transition_script_end[] = {0, 1};;
	static final int Prop_1_transition_script_svn[] = {0, 1};;
	static final int Prop_1_transition_script_md5[] = {0, 1};;
	static final int Prop_1_transition_commit[] = {0, 1};;

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

	final boolean Prop_1_event_insert(String user, String db, String p, String data, long time) {
		{
			check(time);

			if (db != null && db.equals("db2"))
			{
				this.ok = false;
				this.deadline = time+60;
				this.dat = data;

				monitorList.add(this);
			}

			if (db != null && db.equals("db3"))
			{
				ok = true;
			}
		}
		if(Ref_data == null){
			Ref_data = new WeakReference(data);
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_insert) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_select(String user, String b, String c, String d, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{        check(time);}

		int nextstate = this.handleEvent(1, Prop_1_transition_select) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_update(String user, String b, String c, String d, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{        check(time);}

		int nextstate = this.handleEvent(2, Prop_1_transition_update) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_delete(String user, String b, String c, String d, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{        check(time);}

		int nextstate = this.handleEvent(3, Prop_1_transition_delete) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_script_start(String user, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{        check(time);}

		int nextstate = this.handleEvent(4, Prop_1_transition_script_start) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_script_end(String user, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{        check(time);}

		int nextstate = this.handleEvent(5, Prop_1_transition_script_end) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_script_svn(String user, String b, String c, int d, int e, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{        check(time);}

		int nextstate = this.handleEvent(6, Prop_1_transition_script_svn) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_script_md5(String user, String b, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{        check(time);}

		int nextstate = this.handleEvent(7, Prop_1_transition_script_md5) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_commit(String user, int b, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{        check(time);}

		int nextstate = this.handleEvent(8, Prop_1_transition_commit) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final void Prop_1_handler_fail (){
		{System.err.println("...");}

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
			//select
			return;
			case 2:
			//update
			return;
			case 3:
			//delete
			return;
			case 4:
			//script_start
			return;
			case 5:
			//script_end
			return;
			case 6:
			//script_svn
			return;
			case 7:
			//script_md5
			return;
			case 8:
			//commit
			return;
		}
		return;
	}

	public static int getNumberOfEvents() {
		return 9;
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
	private static final Insert2Monitor_Set Insert2__Map = new Insert2Monitor_Set() ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += Insert2_data_Map.cleanUpUnnecessaryMappings();
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
		RuntimeOption.setIndexByVal(true) ;
	}

	public static final void insertEvent(String user, String db, String p, String data, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

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
			// D(X) defineNew:5 for <>
			{
				// InsertMonitor
				Insert2Monitor_Set targetSet = Insert2__Map;
				targetSet.add(created) ;
			}
		}
		// D(X) main:8--9
		final Insert2Monitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_insert(user, db, p, data, time);
		if(matchedEntryfinalMonitor.Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			Insert2_data_Map_cachekey_data = data;
			Insert2_data_Map_cachevalue = matchedEntry;
		}

		Insert2_RVMLock.unlock();
	}

	public static final void selectEvent(String user, String b, String c, String d, long time) {
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Insert2_activated) {
			Insert2Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Insert2__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_select(user, b, c, d, time);

			}

		}

		Insert2_RVMLock.unlock();
	}

	public static final void updateEvent(String user, String b, String c, String d, long time) {
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Insert2_activated) {
			Insert2Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Insert2__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_update(user, b, c, d, time);

			}

		}

		Insert2_RVMLock.unlock();
	}

	public static final void deleteEvent(String user, String b, String c, String d, long time) {
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Insert2_activated) {
			Insert2Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Insert2__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_delete(user, b, c, d, time);

			}

		}

		Insert2_RVMLock.unlock();
	}

	public static final void script_startEvent(String user, long time) {
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Insert2_activated) {
			Insert2Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Insert2__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_script_start(user, time);

			}

		}

		Insert2_RVMLock.unlock();
	}

	public static final void script_endEvent(String user, long time) {
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Insert2_activated) {
			Insert2Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Insert2__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_script_end(user, time);

			}

		}

		Insert2_RVMLock.unlock();
	}

	public static final void script_svnEvent(String user, String b, String c, int d, int e, long time) {
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Insert2_activated) {
			Insert2Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Insert2__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_script_svn(user, b, c, d, e, time);

			}

		}

		Insert2_RVMLock.unlock();
	}

	public static final void script_md5Event(String user, String b, long time) {
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Insert2_activated) {
			Insert2Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Insert2__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_script_md5(user, b, time);

			}

		}

		Insert2_RVMLock.unlock();
	}

	public static final void commitEvent(String user, int b, long time) {
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Insert2_activated) {
			Insert2Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Insert2__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_commit(user, b, time);

			}

		}

		Insert2_RVMLock.unlock();
	}

}
