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

	static LinkedList<Insert2Monitor> monitorList = new LinkedList<>();

	static void check(long time){
		int size=monitorList.size();

		while(!monitorList.isEmpty()){
			Insert2Monitor monitor = monitorList.getFirst();
			if(monitor.deadline>time)
			return;

			if(monitor.ok)
			monitorList.removeFirst();

			else{
				System.out.println("@" + (monitor.deadline - 60) + " : " + monitor.dat);
				System.err.println("expected data '" + monitor.dat + "' is not inserted into db3 before time " + monitor.deadline);
				System.exit(1);
			}
		}
	}

	private boolean ok;

	private long deadline;
	private String dat;

	CachedWeakReference Ref_data = null;
	int Prop_1_state;
	static final int Prop_1_transition_insert[] = {0, 1};;
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
			Ref_data = new CachedWeakReference(data);
		}
		RVM_lastevent = 0;

		Prop_1_state = Prop_1_transition_insert[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 1;
		return true;
	}

	final void Prop_1_handler_fail (){
		{System.err.println("...");}

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

	// Declarations for Timestamps
	private static long Insert2_timestamp = 1;

	private static boolean Insert2_activated = false;

	// Declarations for Indexing Trees
	private static Object Insert2_data_Map_cachekey_data;
	private static Insert2Monitor Insert2_data_Map_cachevalue;
	private static final Tuple2<Insert2Monitor_Set, Insert2Monitor> Insert2__Map = new Tuple2<Insert2Monitor_Set, Insert2Monitor>(new Insert2Monitor_Set() , null) ;
	private static final MapOfMonitor<Insert2Monitor> Insert2_data_Map = new MapOfMonitor<Insert2Monitor>(0) ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += Insert2_data_Map.cleanUpUnnecessaryMappings();
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

	public static final void insertEvent(String user, String db, String p, String data, long time) {
		Insert2_activated = true;
		while (!Insert2_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_data = null;
		MapOfMonitor<Insert2Monitor> matchedLastMap = null;
		Insert2Monitor matchedEntry = null;
		boolean cachehit = false;
		if ((data .equals( Insert2_data_Map_cachekey_data) ) ) {
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

	public static final void selectEvent(String user, String b, String c, String d, long time) {
Insert2Monitor.check(time);
	}

	public static final void updateEvent(String user, String b, String c, String d, long time) {
		Insert2Monitor.check(time);
	}

	public static final void deleteEvent(String user, String b, String c, String d, long time) {
	Insert2Monitor.check(time);
	}

	public static final void script_startEvent(String user, long time) {
	Insert2Monitor.check(time);
	}

	public static final void script_endEvent(String user, long time) {
	Insert2Monitor.check(time);
	}

	public static final void script_svnEvent(String user, String b, String c, int d, int e, long time) {
Insert2Monitor.check(time);
	}

	public static final void script_md5Event(String user, String b, long time) {
Insert2Monitor.check(time);
	}

	public static final void commitEvent(String user, int b, long time) {
		Insert2Monitor.check(time);
	}

public static void actionsAtTheEnd() {
Insert2Monitor.check(Long.MAX_VALUE);
}
}
