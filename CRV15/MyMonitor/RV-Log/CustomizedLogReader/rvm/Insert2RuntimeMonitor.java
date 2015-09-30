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

interface IInsert2Monitor extends IMonitor, IDisableHolder {
}

class Insert2DisableHolder extends DisableHolder implements IInsert2Monitor {
	Insert2DisableHolder(long tau) {
		super(tau);
	}

	@Override
	public final boolean isTerminated() {
		return false;
	}

	@Override
	public int getLastEvent() {
		return -1;
	}

	@Override
	public int getState() {
		return -1;
	}

}

class Insert2Monitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, IInsert2Monitor {
	protected Object clone() {
		try {
			Insert2Monitor ret = (Insert2Monitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	WeakReference Ref_data = null;
	int Prop_1_state;
	static final int Prop_1_transition_insert[] = {0, 1};;
	static final int Prop_1_transition_insert2DB2[] = {0, 1};;
	static final int Prop_1_transition_insert2DB3[] = {0, 1};;
	static final int Prop_1_transition_select[] = {0, 1};;
	static final int Prop_1_transition_update[] = {0, 1};;
	static final int Prop_1_transition_delete[] = {0, 1};;
	static final int Prop_1_transition_script_start[] = {0, 1};;
	static final int Prop_1_transition_script_end[] = {0, 1};;
	static final int Prop_1_transition_script_svn[] = {0, 1};;
	static final int Prop_1_transition_script_md5[] = {0, 1};;
	static final int Prop_1_transition_commit[] = {0, 1};;

	boolean Prop_1_Category_fail = false;

	Insert2Monitor(long tau) {
		this.tau = tau;
		Prop_1_state = 0;

	}

	@Override
	public final int getState() {
		return Prop_1_state;
	}

	private final long tau;
	private long disable = -1;

	@Override
	public final long getTau() {
		return this.tau;
	}

	@Override
	public final long getDisable() {
		return this.disable;
	}

	@Override
	public final void setDisable(long value) {
		this.disable = value;
	}

	final boolean Prop_1_event_insert(String user, String db, String p, String data, long time) {
		{
			if (db != null && db.equals("db2"))
			{
				Insert2RuntimeMonitor.insert2DB2Event(data, time);
			}

			if (db != null && db.equals("db3"))
			{
				Insert2RuntimeMonitor.insert2DB3Event(data, time);
			}
		}
		if(Ref_data == null){
			Ref_data = new WeakReference(data);
		}
		RVM_lastevent = 0;

		Prop_1_state = Prop_1_transition_insert[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final boolean Prop_1_event_insert2DB2(String data, long time) {
		{}
		if(Ref_data == null){
			Ref_data = new WeakReference(data);
		}
		RVM_lastevent = 1;

		Prop_1_state = Prop_1_transition_insert2DB2[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final boolean Prop_1_event_insert2DB3(String data, long time) {
		{}
		if(Ref_data == null){
			Ref_data = new WeakReference(data);
		}
		RVM_lastevent = 2;

		Prop_1_state = Prop_1_transition_insert2DB3[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final boolean Prop_1_event_select(String user, String b, String c, String d, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{}
		RVM_lastevent = 3;

		Prop_1_state = Prop_1_transition_select[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final boolean Prop_1_event_update(String user, String b, String c, String d, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{}
		RVM_lastevent = 4;

		Prop_1_state = Prop_1_transition_update[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final boolean Prop_1_event_delete(String user, String b, String c, String d, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{}
		RVM_lastevent = 5;

		Prop_1_state = Prop_1_transition_delete[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final boolean Prop_1_event_script_start(String user, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{}
		RVM_lastevent = 6;

		Prop_1_state = Prop_1_transition_script_start[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final boolean Prop_1_event_script_end(String user, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{}
		RVM_lastevent = 7;

		Prop_1_state = Prop_1_transition_script_end[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final boolean Prop_1_event_script_svn(String user, String b, String c, int d, int e, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{}
		RVM_lastevent = 8;

		Prop_1_state = Prop_1_transition_script_svn[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final boolean Prop_1_event_script_md5(String user, String b, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{}
		RVM_lastevent = 9;

		Prop_1_state = Prop_1_transition_script_md5[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final boolean Prop_1_event_commit(String user, int b, long time) {
		String data = null;
		if(Ref_data != null){
			data = (String)Ref_data.get();
		}
		{}
		RVM_lastevent = 10;

		Prop_1_state = Prop_1_transition_commit[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final void Prop_1_handler_fail (){
		{System.err.println("The data is not propagated to db3 after inserting to db2.");}

	}

	final void reset() {
		RVM_lastevent = -1;
		Prop_1_state = 0;
		Prop_1_Category_fail = false;
	}

	// RVMRef_data was suppressed to reduce memory overhead

	@Override
	protected final void terminateInternal(int idnum) {
		switch(idnum){
			case 0:
			break;
		}
		switch(RVM_lastevent) {
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
			case 3:
			//select
			return;
			case 4:
			//update
			return;
			case 5:
			//delete
			return;
			case 6:
			//script_start
			return;
			case 7:
			//script_end
			return;
			case 8:
			//script_svn
			return;
			case 9:
			//script_md5
			return;
			case 10:
			//commit
			return;
		}
		return;
	}

	public static int getNumberOfEvents() {
		return 11;
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

	// Declarations for Timestamps
	private static long Insert2_timestamp = 1;

	private static boolean Insert2_activated = false;

	// Declarations for Indexing Trees
	private static Object Insert2_data_Map_cachekey_data;
	private static Insert2Monitor Insert2_data_Map_cachevalue;
	private static final MapOfMonitor<Insert2Monitor> Insert2_data_Map = new MapOfMonitor<Insert2Monitor>(0) ;
	private static final Tuple2<Insert2Monitor_Set, Insert2Monitor> Insert2__Map = new Tuple2<Insert2Monitor_Set, Insert2Monitor>(new Insert2Monitor_Set() , null) ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += Insert2_data_Map.cleanUpUnnecessaryMappings();
		return collected;
	}

	static {
		Constraint_future c117244645 = new Constraint_future();
		c117244645.addConstraint("insert2DB3", "[0, 60]");
		AbstractMonitor.putConstraint("insert2DB2", c117244645);
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

	public static final void insertEvent(String user, String db, String p, String data, long time) {
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
			{
				// D(X) createNewMonitorStates:4 when Dom(theta'') = <>
				Insert2Monitor sourceLeaf = null;
				{
					// FindCode
					Insert2Monitor itmdLeaf = Insert2__Map.getValue2() ;
					sourceLeaf = itmdLeaf;
				}
				if ((sourceLeaf != null) ) {
					boolean definable = true;
					// D(X) defineTo:1--5 for <data>
					if (definable) {
						// FindCode
						Insert2Monitor node_data = Insert2_data_Map.getNodeEquivalent(wr_data) ;
						if ((node_data != null) ) {
							if (((node_data.getDisable() > sourceLeaf.getTau() ) || ((node_data.getTau() > 0) && (node_data.getTau() < sourceLeaf.getTau() ) ) ) ) {
								definable = false;
							}
						}
					}
					if (definable) {
						// D(X) defineTo:6
						Insert2Monitor created = (Insert2Monitor)sourceLeaf.clone() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_data, created) ;
						// D(X) defineTo:7 for <>
						{
							// InsertMonitor
							Insert2Monitor_Set targetSet = Insert2__Map.getValue1() ;
							targetSet.add(created) ;
						}
					}
				}
			}
			if ((matchedEntry == null) ) {
				// D(X) main:4
				Insert2Monitor created = new Insert2Monitor(Insert2_timestamp++) ;
				matchedEntry = created;
				matchedLastMap.putNode(wr_data, created) ;
				// D(X) defineNew:5 for <>
				{
					// InsertMonitor
					Insert2Monitor_Set targetSet = Insert2__Map.getValue1() ;
					targetSet.add(created) ;
				}
			}
			// D(X) main:6
			matchedEntry.setDisable(Insert2_timestamp++) ;
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
			{
				// D(X) createNewMonitorStates:4 when Dom(theta'') = <>
				Insert2Monitor sourceLeaf = null;
				{
					// FindCode
					Insert2Monitor itmdLeaf = Insert2__Map.getValue2() ;
					sourceLeaf = itmdLeaf;
				}
				if ((sourceLeaf != null) ) {
					boolean definable = true;
					// D(X) defineTo:1--5 for <data>
					if (definable) {
						// FindCode
						Insert2Monitor node_data = Insert2_data_Map.getNodeEquivalent(wr_data) ;
						if ((node_data != null) ) {
							if (((node_data.getDisable() > sourceLeaf.getTau() ) || ((node_data.getTau() > 0) && (node_data.getTau() < sourceLeaf.getTau() ) ) ) ) {
								definable = false;
							}
						}
					}
					if (definable) {
						// D(X) defineTo:6
						Insert2Monitor created = (Insert2Monitor)sourceLeaf.clone() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_data, created) ;
						// D(X) defineTo:7 for <>
						{
							// InsertMonitor
							Insert2Monitor_Set targetSet = Insert2__Map.getValue1() ;
							targetSet.add(created) ;
						}
					}
				}
			}
			if ((matchedEntry == null) ) {
				// D(X) main:4
				Insert2Monitor created = new Insert2Monitor(Insert2_timestamp++) ;
				matchedEntry = created;
				matchedLastMap.putNode(wr_data, created) ;
				// D(X) defineNew:5 for <>
				{
					// InsertMonitor
					Insert2Monitor_Set targetSet = Insert2__Map.getValue1() ;
					targetSet.add(created) ;
				}
			}
			// D(X) main:6
			matchedEntry.setDisable(Insert2_timestamp++) ;
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
			{
				// D(X) createNewMonitorStates:4 when Dom(theta'') = <>
				Insert2Monitor sourceLeaf = null;
				{
					// FindCode
					Insert2Monitor itmdLeaf = Insert2__Map.getValue2() ;
					sourceLeaf = itmdLeaf;
				}
				if ((sourceLeaf != null) ) {
					boolean definable = true;
					// D(X) defineTo:1--5 for <data>
					if (definable) {
						// FindCode
						Insert2Monitor node_data = Insert2_data_Map.getNodeEquivalent(wr_data) ;
						if ((node_data != null) ) {
							if (((node_data.getDisable() > sourceLeaf.getTau() ) || ((node_data.getTau() > 0) && (node_data.getTau() < sourceLeaf.getTau() ) ) ) ) {
								definable = false;
							}
						}
					}
					if (definable) {
						// D(X) defineTo:6
						Insert2Monitor created = (Insert2Monitor)sourceLeaf.clone() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_data, created) ;
						// D(X) defineTo:7 for <>
						{
							// InsertMonitor
							Insert2Monitor_Set targetSet = Insert2__Map.getValue1() ;
							targetSet.add(created) ;
						}
					}
				}
			}
			if ((matchedEntry == null) ) {
				// D(X) main:4
				Insert2Monitor created = new Insert2Monitor(Insert2_timestamp++) ;
				matchedEntry = created;
				matchedLastMap.putNode(wr_data, created) ;
				// D(X) defineNew:5 for <>
				{
					// InsertMonitor
					Insert2Monitor_Set targetSet = Insert2__Map.getValue1() ;
					targetSet.add(created) ;
				}
			}
			// D(X) main:6
			matchedEntry.setDisable(Insert2_timestamp++) ;
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

	public static final void selectEvent(String user, String b, String c, String d, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		timeReminder.update("select", time);

		Tuple2<Insert2Monitor_Set, Insert2Monitor> matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = Insert2__Map;
		}
		// D(X) main:1
		Insert2Monitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				Insert2Monitor created = new Insert2Monitor(Insert2_timestamp++) ;
				matchedEntry.setValue2(created) ;
				Insert2Monitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			Insert2Monitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(Insert2_timestamp++) ;
		}
		// D(X) main:8--9
		Insert2Monitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_select(user, b, c, d, time);

		Insert2_RVMLock.unlock();
	}

	public static final void updateEvent(String user, String b, String c, String d, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		timeReminder.update("update", time);

		Tuple2<Insert2Monitor_Set, Insert2Monitor> matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = Insert2__Map;
		}
		// D(X) main:1
		Insert2Monitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				Insert2Monitor created = new Insert2Monitor(Insert2_timestamp++) ;
				matchedEntry.setValue2(created) ;
				Insert2Monitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			Insert2Monitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(Insert2_timestamp++) ;
		}
		// D(X) main:8--9
		Insert2Monitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_update(user, b, c, d, time);

		Insert2_RVMLock.unlock();
	}

	public static final void deleteEvent(String user, String b, String c, String d, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		timeReminder.update("delete", time);

		Tuple2<Insert2Monitor_Set, Insert2Monitor> matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = Insert2__Map;
		}
		// D(X) main:1
		Insert2Monitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				Insert2Monitor created = new Insert2Monitor(Insert2_timestamp++) ;
				matchedEntry.setValue2(created) ;
				Insert2Monitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			Insert2Monitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(Insert2_timestamp++) ;
		}
		// D(X) main:8--9
		Insert2Monitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_delete(user, b, c, d, time);

		Insert2_RVMLock.unlock();
	}

	public static final void script_startEvent(String user, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		timeReminder.update("script_start", time);

		Tuple2<Insert2Monitor_Set, Insert2Monitor> matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = Insert2__Map;
		}
		// D(X) main:1
		Insert2Monitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				Insert2Monitor created = new Insert2Monitor(Insert2_timestamp++) ;
				matchedEntry.setValue2(created) ;
				Insert2Monitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			Insert2Monitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(Insert2_timestamp++) ;
		}
		// D(X) main:8--9
		Insert2Monitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_script_start(user, time);

		Insert2_RVMLock.unlock();
	}

	public static final void script_endEvent(String user, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		timeReminder.update("script_end", time);

		Tuple2<Insert2Monitor_Set, Insert2Monitor> matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = Insert2__Map;
		}
		// D(X) main:1
		Insert2Monitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				Insert2Monitor created = new Insert2Monitor(Insert2_timestamp++) ;
				matchedEntry.setValue2(created) ;
				Insert2Monitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			Insert2Monitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(Insert2_timestamp++) ;
		}
		// D(X) main:8--9
		Insert2Monitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_script_end(user, time);

		Insert2_RVMLock.unlock();
	}

	public static final void script_svnEvent(String user, String b, String c, int d, int e, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		timeReminder.update("script_svn", time);

		Tuple2<Insert2Monitor_Set, Insert2Monitor> matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = Insert2__Map;
		}
		// D(X) main:1
		Insert2Monitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				Insert2Monitor created = new Insert2Monitor(Insert2_timestamp++) ;
				matchedEntry.setValue2(created) ;
				Insert2Monitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			Insert2Monitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(Insert2_timestamp++) ;
		}
		// D(X) main:8--9
		Insert2Monitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_script_svn(user, b, c, d, e, time);

		Insert2_RVMLock.unlock();
	}

	public static final void script_md5Event(String user, String b, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		timeReminder.update("script_md5", time);

		Tuple2<Insert2Monitor_Set, Insert2Monitor> matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = Insert2__Map;
		}
		// D(X) main:1
		Insert2Monitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				Insert2Monitor created = new Insert2Monitor(Insert2_timestamp++) ;
				matchedEntry.setValue2(created) ;
				Insert2Monitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			Insert2Monitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(Insert2_timestamp++) ;
		}
		// D(X) main:8--9
		Insert2Monitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_script_md5(user, b, time);

		Insert2_RVMLock.unlock();
	}

	public static final void commitEvent(String user, int b, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		timeReminder.update("commit", time);

		Tuple2<Insert2Monitor_Set, Insert2Monitor> matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = Insert2__Map;
		}
		// D(X) main:1
		Insert2Monitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				Insert2Monitor created = new Insert2Monitor(Insert2_timestamp++) ;
				matchedEntry.setValue2(created) ;
				Insert2Monitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			Insert2Monitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(Insert2_timestamp++) ;
		}
		// D(X) main:8--9
		Insert2Monitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_commit(user, b, time);

		Insert2_RVMLock.unlock();
	}

}
