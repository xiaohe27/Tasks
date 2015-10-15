package rvm;
import java.io.*;
import java.util.*;
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

final class Del12Monitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<Del12Monitor> {

	Del12Monitor_Set(){
		this.size = 0;
		this.elements = new Del12Monitor[4];
	}
	final void event_insert(String user, String db, String p, String data, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Del12Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Del12Monitor monitorfinalMonitor = monitor;
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
	final void event_delete(String user, String db, String p, String data, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Del12Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Del12Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_delete(user, db, p, data, time);
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
			Del12Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Del12Monitor monitorfinalMonitor = monitor;
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
			Del12Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Del12Monitor monitorfinalMonitor = monitor;
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
	final void event_script_start(String user, long time) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Del12Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Del12Monitor monitorfinalMonitor = monitor;
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
			Del12Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Del12Monitor monitorfinalMonitor = monitor;
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
			Del12Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Del12Monitor monitorfinalMonitor = monitor;
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
			Del12Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Del12Monitor monitorfinalMonitor = monitor;
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
			Del12Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final Del12Monitor monitorfinalMonitor = monitor;
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

class Del12Monitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			Del12Monitor ret = (Del12Monitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	public static final long timeBound = 30 * 60 * 60;

	public static boolean withinForwardBound(long baseT, long curT) {
		return curT >= baseT && curT < baseT + timeBound;
	}

	public static boolean withinBackwardBound(long baseT, long curT) {
		return curT >= 0 &&  curT > baseT - timeBound && curT <= baseT;
	}

	class Record {
		final long dueTime;

		boolean delDataFromDB2;
		final boolean insertedToDB1;
		final boolean allPastNotInsertedToDB2;

		boolean alwaysNotInsertedToDB2;

		public Record(long cTime) {
			this.dueTime = cTime + timeBound;

			this.delDataFromDB2 = (cTime == del_db2_time);
			this.insertedToDB1 = withinBackwardBound(cTime, ins_db1_time);
			this.allPastNotInsertedToDB2 = !withinBackwardBound(cTime, ins_db2_time);

			this.alwaysNotInsertedToDB2 = (cTime != ins_db2_time);
		}

		public boolean isSAT () {
			return delDataFromDB2 || (insertedToDB1 && allPastNotInsertedToDB2 && alwaysNotInsertedToDB2);
		}

		public String toString() {
			return "Del " + data + " from db1 @" + (dueTime - timeBound) + "\n";
		}

	}

	public static void check(long time) {
		for (int i = 0; i < monitors.size(); i++) {
			Del12Monitor monitor = monitors.get(i);

			if (time < monitor.firstDueTime) {return;}

			monitor.checkLocalRecords(time);

			if (monitor.del_db1_records.isEmpty()) {
				monitors.remove(i);
				i--;
			}
		}
	}

	private long firstDueTime;

	private long ins_db1_time = -1;
	private long ins_db2_time = -1;
	private long del_db2_time = -1;

	private String data;

	private ArrayList<Record> del_db1_records = new ArrayList<>();

	private static final ArrayList<Del12Monitor> monitors = new ArrayList<>();

	public static final String DB1 = "db1";
	public static final String DB2 = "db2";
	public static final String UNKNOWN = "[unknown]";

	public void checkLocalRecords(long curT) {
		for (int i = 0; i < this.del_db1_records.size(); i++) {
			Record record = this.del_db1_records.get(i);
			boolean due = (curT >= record.dueTime);

			if (due) {
				if (record.isSAT()) {
					this.del_db1_records.remove(i);
					i--;
				}

				else {
					System.err.println("Property violated!");
					System.err.println(record);
					System.exit(2);
				}
			}

			else {return;}
		}

	}

	private void  update_del_db2(long time) {

		for (int i = 0; i < this.del_db1_records.size(); i++) {
			Record record = this.del_db1_records.get(i);

			if (time < record.dueTime) {
				for (int j = i; j < this.del_db1_records.size(); j++) {
					this.del_db1_records.get(j).delDataFromDB2 = true;
				}
				return;
			}
		}
	}

	private void  update_ins_db2(long time) {

		for (int i = 0; i < this.del_db1_records.size(); i++) {
			Record record = this.del_db1_records.get(i);

			if (time < record.dueTime) {
				for (int j = i; j < this.del_db1_records.size(); j++) {
					this.del_db1_records.get(j).alwaysNotInsertedToDB2 = false;
				}
				return;
			}
		}
	}

	WeakReference Ref_data = null;

	static final int Prop_1_transition_insert[] = {0, 1};;
	static final int Prop_1_transition_delete[] = {0, 1};;
	static final int Prop_1_transition_select[] = {0, 1};;
	static final int Prop_1_transition_update[] = {0, 1};;
	static final int Prop_1_transition_script_start[] = {0, 1};;
	static final int Prop_1_transition_script_end[] = {0, 1};;
	static final int Prop_1_transition_script_svn[] = {0, 1};;
	static final int Prop_1_transition_script_md5[] = {0, 1};;
	static final int Prop_1_transition_commit[] = {0, 1};;

	volatile boolean Prop_1_Category_fail = false;

	private final AtomicInteger pairValue;

	Del12Monitor() {
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

			if (UNKNOWN.equals(data)) {return true;}

			if (DB1.equals(db)) {
				this.ins_db1_time = time;
			} else if (DB2.equals(db)) {
				this.ins_db2_time = time;
				this.update_ins_db2(time);
			}

		}
		if(Ref_data == null){
			Ref_data = new WeakReference(data);
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_insert) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_delete(String user, String db, String p, String data, long time) {
		{
			check(time);

			if (UNKNOWN.equals(data)) {return true;}

			this.data = data;

			if (db.equals(DB1)) {

				this.del_db1_records.add(new Record(time));

				if (!monitors.contains(this))
				{
					monitors.add(this);
					this.firstDueTime = time + timeBound;
				}

			} else if (db.equals(DB2)) {
				this.del_db2_time = time;

				update_del_db2(time);
			}

		}
		if(Ref_data == null){
			Ref_data = new WeakReference(data);
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_delete) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_select(String user, String b, String c, String d, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{        check(time);}

		int nextstate = this.handleEvent(2, Prop_1_transition_select) ;
		this.Prop_1_Category_fail = nextstate == 1;

		return true;
	}

	final boolean Prop_1_event_update(String user, String b, String c, String d, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{        check(time);}

		int nextstate = this.handleEvent(3, Prop_1_transition_update) ;
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
			//delete
			return;
			case 2:
			//select
			return;
			case 3:
			//update
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

public final class Del12RuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager Del12MapManager;
	static {
		Del12MapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		Del12MapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock Del12_RVMLock = new ReentrantLock();
	static final Condition Del12_RVMLock_cond = Del12_RVMLock.newCondition();

	private static boolean Del12_activated = false;

	// Declarations for Indexing Trees
	private static Object Del12_data_Map_cachekey_data;
	private static Del12Monitor Del12_data_Map_cachevalue;
	private static final MapOfMonitor<Del12Monitor> Del12_data_Map = new MapOfMonitor<Del12Monitor>(0) ;
	private static final Del12Monitor_Set Del12__Map = new Del12Monitor_Set() ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += Del12_data_Map.cleanUpUnnecessaryMappings();
		return collected;
	}

	static {
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

	public static void actionsAtTheEnd() {
		Del12Monitor.check(Long.MAX_VALUE);
	}

	public static final void insertEvent(String user, String db, String p, String data, long time) {
		Del12_activated = true;
		while (!Del12_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_data = null;
		MapOfMonitor<Del12Monitor> matchedLastMap = null;
		Del12Monitor matchedEntry = null;
		boolean cachehit = false;
		if ((data == Del12_data_Map_cachekey_data) ) {
			matchedEntry = Del12_data_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_data = new CachedWeakReference(data) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<Del12Monitor> itmdMap = Del12_data_Map;
				matchedLastMap = itmdMap;
				Del12Monitor node_data = Del12_data_Map.getNodeEquivalent(wr_data) ;
				matchedEntry = node_data;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_data == null) ) {
				wr_data = new CachedWeakReference(data) ;
			}
			// D(X) main:4
			Del12Monitor created = new Del12Monitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_data, created) ;
			// D(X) defineNew:5 for <>
			{
				// InsertMonitor
				Del12Monitor_Set targetSet = Del12__Map;
				targetSet.add(created) ;
			}
		}
		// D(X) main:8--9
		final Del12Monitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_insert(user, db, p, data, time);
		if(matchedEntryfinalMonitor.Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			Del12_data_Map_cachekey_data = data;
			Del12_data_Map_cachevalue = matchedEntry;
		}

		Del12_RVMLock.unlock();
	}

	public static final void deleteEvent(String user, String db, String p, String data, long time) {
		Del12_activated = true;
		while (!Del12_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_data = null;
		MapOfMonitor<Del12Monitor> matchedLastMap = null;
		Del12Monitor matchedEntry = null;
		boolean cachehit = false;
		if ((data == Del12_data_Map_cachekey_data) ) {
			matchedEntry = Del12_data_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_data = new CachedWeakReference(data) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<Del12Monitor> itmdMap = Del12_data_Map;
				matchedLastMap = itmdMap;
				Del12Monitor node_data = Del12_data_Map.getNodeEquivalent(wr_data) ;
				matchedEntry = node_data;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_data == null) ) {
				wr_data = new CachedWeakReference(data) ;
			}
			// D(X) main:4
			Del12Monitor created = new Del12Monitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_data, created) ;
			// D(X) defineNew:5 for <>
			{
				// InsertMonitor
				Del12Monitor_Set targetSet = Del12__Map;
				targetSet.add(created) ;
			}
		}
		// D(X) main:8--9
		final Del12Monitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_delete(user, db, p, data, time);
		if(matchedEntryfinalMonitor.Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			Del12_data_Map_cachekey_data = data;
			Del12_data_Map_cachevalue = matchedEntry;
		}

		Del12_RVMLock.unlock();
	}

	public static final void selectEvent(String user, String b, String c, String d, long time) {
		while (!Del12_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Del12_activated) {
			Del12Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Del12__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_select(user, b, c, d, time);

			}

		}

		Del12_RVMLock.unlock();
	}

	public static final void updateEvent(String user, String b, String c, String d, long time) {
		while (!Del12_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Del12_activated) {
			Del12Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Del12__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_update(user, b, c, d, time);

			}

		}

		Del12_RVMLock.unlock();
	}

	public static final void script_startEvent(String user, long time) {
		while (!Del12_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Del12_activated) {
			Del12Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Del12__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_script_start(user, time);

			}

		}

		Del12_RVMLock.unlock();
	}

	public static final void script_endEvent(String user, long time) {
		while (!Del12_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Del12_activated) {
			Del12Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Del12__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_script_end(user, time);

			}

		}

		Del12_RVMLock.unlock();
	}

	public static final void script_svnEvent(String user, String b, String c, int d, int e, long time) {
		while (!Del12_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Del12_activated) {
			Del12Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Del12__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_script_svn(user, b, c, d, e, time);

			}

		}

		Del12_RVMLock.unlock();
	}

	public static final void script_md5Event(String user, String b, long time) {
		while (!Del12_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Del12_activated) {
			Del12Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Del12__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_script_md5(user, b, time);

			}

		}

		Del12_RVMLock.unlock();
	}

	public static final void commitEvent(String user, int b, long time) {
		while (!Del12_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (Del12_activated) {
			Del12Monitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = Del12__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_commit(user, b, time);

			}

		}

		Del12_RVMLock.unlock();
	}

}
