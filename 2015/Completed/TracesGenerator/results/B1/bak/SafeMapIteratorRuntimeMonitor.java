package mop;
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

final class SafeMapIteratorMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<SafeMapIteratorMonitor> {

	SafeMapIteratorMonitor_Set(){
		this.size = 0;
		this.elements = new SafeMapIteratorMonitor[4];
	}
	final void event_createColl(String map, String c) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			SafeMapIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final SafeMapIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_createColl(map, c);
				if(monitorfinalMonitor.Prop_1_Category_match) {
					monitorfinalMonitor.Prop_1_handler_match();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_createIter(String c, String i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			SafeMapIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final SafeMapIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_createIter(c, i);
				if(monitorfinalMonitor.Prop_1_Category_match) {
					monitorfinalMonitor.Prop_1_handler_match();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_useIter(String i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			SafeMapIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final SafeMapIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_useIter(i);
				if(monitorfinalMonitor.Prop_1_Category_match) {
					monitorfinalMonitor.Prop_1_handler_match();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_updateMap(String map) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			SafeMapIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final SafeMapIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_updateMap(map);
				if(monitorfinalMonitor.Prop_1_Category_match) {
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

interface ISafeMapIteratorMonitor extends IMonitor, IDisableHolder {
}

class SafeMapIteratorDisableHolder extends DisableHolder implements ISafeMapIteratorMonitor {
	SafeMapIteratorDisableHolder(long tau) {
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

class SafeMapIteratorMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, ISafeMapIteratorMonitor {
	protected Object clone() {
		try {
			SafeMapIteratorMonitor ret = (SafeMapIteratorMonitor) super.clone();
			ret.monitorInfo = (com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo)this.monitorInfo.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	private String map;
	private String c;
	private String i;

	WeakReference Ref_c = null;
	WeakReference Ref_i = null;
	WeakReference Ref_map = null;
	int Prop_1_state;
	static final int Prop_1_transition_createColl[] = {1, 5, 5, 5, 5, 5};;
	static final int Prop_1_transition_createIter[] = {5, 3, 5, 5, 5, 5};;
	static final int Prop_1_transition_useIter[] = {5, 5, 5, 3, 2, 5};;
	static final int Prop_1_transition_updateMap[] = {5, 1, 5, 4, 4, 5};;

	boolean Prop_1_Category_match = false;

	SafeMapIteratorMonitor(long tau, CachedWeakReference RVMRef_map, CachedWeakReference RVMRef_c, CachedWeakReference RVMRef_i) {
		this.tau = tau;
		Prop_1_state = 0;

		this.RVMRef_map = RVMRef_map;
		this.RVMRef_c = RVMRef_c;
		this.RVMRef_i = RVMRef_i;
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

	final boolean Prop_1_event_createColl(String map, String c) {
		String i = null;
		if(Ref_i != null){
			i = (String)Ref_i.get();
		}
		{
			this.map = map;
			this.c = c;
		}
		if(Ref_c == null){
			Ref_c = new WeakReference(c);
		}
		if(Ref_map == null){
			Ref_map = new WeakReference(map);
		}
		RVM_lastevent = 0;

		Prop_1_state = Prop_1_transition_createColl[Prop_1_state];
		if(this.monitorInfo.isFullParam){
			Prop_1_Category_match = Prop_1_state == 2;
		}
		return true;
	}

	final boolean Prop_1_event_createIter(String c, String i) {
		String map = null;
		if(Ref_map != null){
			map = (String)Ref_map.get();
		}
		{
			this.c = c;
			this.i = i;
		}
		if(Ref_c == null){
			Ref_c = new WeakReference(c);
		}
		if(Ref_i == null){
			Ref_i = new WeakReference(i);
		}
		RVM_lastevent = 1;

		Prop_1_state = Prop_1_transition_createIter[Prop_1_state];
		if(this.monitorInfo.isFullParam){
			Prop_1_Category_match = Prop_1_state == 2;
		}
		return true;
	}

	final boolean Prop_1_event_useIter(String i) {
		String map = null;
		if(Ref_map != null){
			map = (String)Ref_map.get();
		}
		String c = null;
		if(Ref_c != null){
			c = (String)Ref_c.get();
		}
		{
			this.i = i;
		}
		if(Ref_i == null){
			Ref_i = new WeakReference(i);
		}
		RVM_lastevent = 2;

		Prop_1_state = Prop_1_transition_useIter[Prop_1_state];
		if(this.monitorInfo.isFullParam){
			Prop_1_Category_match = Prop_1_state == 2;
		}
		return true;
	}

	final boolean Prop_1_event_updateMap(String map) {
		String c = null;
		if(Ref_c != null){
			c = (String)Ref_c.get();
		}
		String i = null;
		if(Ref_i != null){
			i = (String)Ref_i.get();
		}
		{
			this.map = map;
		}
		if(Ref_map == null){
			Ref_map = new WeakReference(map);
		}
		RVM_lastevent = 3;

		Prop_1_state = Prop_1_transition_updateMap[Prop_1_state];
		if(this.monitorInfo.isFullParam){
			Prop_1_Category_match = Prop_1_state == 2;
		}
		return true;
	}

	final void Prop_1_handler_match (){
		{
			System.err.println("update map during iteration!\t(map:" + map
			+ ", collection:" + c + ", iterator:" + i + ")");

		}

	}

	final void reset() {
		RVM_lastevent = -1;
		Prop_1_state = 0;
		Prop_1_Category_match = false;
	}

	CachedWeakReference RVMRef_map;
	CachedWeakReference RVMRef_c;
	CachedWeakReference RVMRef_i;

	//alive_parameters_0 = [String map, String c, String i]
	boolean alive_parameters_0 = true;
	//alive_parameters_1 = [String map, String i]
	boolean alive_parameters_1 = true;
	//alive_parameters_2 = [String i]
	boolean alive_parameters_2 = true;

	@Override
	protected final void terminateInternal(int idnum) {
		switch(idnum){
			case 0:
			alive_parameters_0 = false;
			alive_parameters_1 = false;
			break;
			case 1:
			alive_parameters_0 = false;
			break;
			case 2:
			alive_parameters_0 = false;
			alive_parameters_1 = false;
			alive_parameters_2 = false;
			break;
		}
		switch(RVM_lastevent) {
			case -1:
			return;
			case 0:
			//createColl
			//alive_map && alive_c && alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//createIter
			//alive_map && alive_i
			if(!(alive_parameters_1)){
				RVM_terminated = true;
				return;
			}
			break;

			case 2:
			//useIter
			//alive_map && alive_i
			if(!(alive_parameters_1)){
				RVM_terminated = true;
				return;
			}
			break;

			case 3:
			//updateMap
			//alive_i
			if(!(alive_parameters_2)){
				RVM_terminated = true;
				return;
			}
			break;

		}
		return;
	}

	com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo monitorInfo;
	public static int getNumberOfEvents() {
		return 4;
	}

	public static int getNumberOfStates() {
		return 6;
	}

}

public final class SafeMapIteratorRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager SafeMapIteratorMapManager;
	static {
		SafeMapIteratorMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		SafeMapIteratorMapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock SafeMapIterator_RVMLock = new ReentrantLock();
	static final Condition SafeMapIterator_RVMLock_cond = SafeMapIterator_RVMLock.newCondition();

	// Declarations for Timestamps
	private static long SafeMapIterator_timestamp = 1;

	private static boolean SafeMapIterator_activated = false;

	// Declarations for Indexing Trees
	private static Object SafeMapIterator_c_i_Map_cachekey_c;
	private static Object SafeMapIterator_c_i_Map_cachekey_i;
	private static Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_c_i_Map_cachevalue;
	private static Object SafeMapIterator_i_Map_cachekey_i;
	private static Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_i_Map_cachevalue;
	private static Object SafeMapIterator_map_Map_cachekey_map;
	private static Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_map_Map_cachevalue;
	private static Object SafeMapIterator_map_c_Map_cachekey_c;
	private static Object SafeMapIterator_map_c_Map_cachekey_map;
	private static Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_map_c_Map_cachevalue;
	private static Object SafeMapIterator_map_c_i_Map_cachekey_c;
	private static Object SafeMapIterator_map_c_i_Map_cachekey_i;
	private static Object SafeMapIterator_map_c_i_Map_cachekey_map;
	private static ISafeMapIteratorMonitor SafeMapIterator_map_c_i_Map_cachevalue;
	private static final MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_i_Map = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(2) ;
	private static final MapOfAll<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_map_c_i_Map = new MapOfAll<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(0) ;
	private static final MapOfMap<MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>> SafeMapIterator_c_i_Map = new MapOfMap<MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>>(1) ;
	private static Object SafeMapIterator_c__To__map_c_Map_cachekey_c;
	private static Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_c__To__map_c_Map_cachevalue;
	private static final MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_c__To__map_c_Map = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += SafeMapIterator_i_Map.cleanUpUnnecessaryMappings();
		collected += SafeMapIterator_map_c_i_Map.cleanUpUnnecessaryMappings();
		collected += SafeMapIterator_c_i_Map.cleanUpUnnecessaryMappings();
		collected += SafeMapIterator_c__To__map_c_Map.cleanUpUnnecessaryMappings();
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

	public static final void createCollEvent(String map, String c) {
		SafeMapIterator_activated = true;
		while (!SafeMapIterator_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_c = null;
		CachedWeakReference wr_map = null;
		Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> matchedEntry = null;
		boolean cachehit = false;
		if (((c == SafeMapIterator_map_c_Map_cachekey_c) && (map == SafeMapIterator_map_c_Map_cachekey_map) ) ) {
			matchedEntry = SafeMapIterator_map_c_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_map = new CachedWeakReference(map) ;
			wr_c = new CachedWeakReference(c) ;
			{
				// FindOrCreateEntry
				Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
				if ((node_map == null) ) {
					node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
					SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
					node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
					node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
				}
				Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
				if ((node_map_c == null) ) {
					node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
					node_map.getValue1() .putNode(wr_c, node_map_c) ;
					node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
					node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
				}
				matchedEntry = node_map_c;
			}
		}
		// D(X) main:1
		SafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue3() ;
		if ((matchedLeaf == null) ) {
			if ((wr_map == null) ) {
				wr_map = new CachedWeakReference(map) ;
			}
			if ((wr_c == null) ) {
				wr_c = new CachedWeakReference(c) ;
			}
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				SafeMapIteratorMonitor created = new SafeMapIteratorMonitor(SafeMapIterator_timestamp++, wr_map, wr_c, null) ;
				created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
				created.monitorInfo.isFullParam = false;

				matchedEntry.setValue3(created) ;
				SafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
				enclosingSet.add(created) ;
				// D(X) defineNew:5 for <map>
				{
					// InsertMonitor
					Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
					if ((node_map == null) ) {
						node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
						SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
						node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
						node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
					}
					SafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
					targetSet.add(created) ;
				}
				// D(X) defineNew:5 for <c-map, c>
				{
					// InsertMonitor
					Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c__To__map_c_Map.getNodeEquivalent(wr_c) ;
					if ((node_c == null) ) {
						node_c = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
						SafeMapIterator_c__To__map_c_Map.putNode(wr_c, node_c) ;
						node_c.setValue1(new SafeMapIteratorMonitor_Set() ) ;
					}
					SafeMapIteratorMonitor_Set targetSet = node_c.getValue1() ;
					targetSet.add(created) ;
				}
			}
			// D(X) main:6
			SafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
			disableUpdatedLeaf.setDisable(SafeMapIterator_timestamp++) ;
		}
		// D(X) main:8--9
		SafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
		stateTransitionedSet.event_createColl(map, c);

		if ((cachehit == false) ) {
			SafeMapIterator_map_c_Map_cachekey_c = c;
			SafeMapIterator_map_c_Map_cachekey_map = map;
			SafeMapIterator_map_c_Map_cachevalue = matchedEntry;
		}

		SafeMapIterator_RVMLock.unlock();
	}

	public static final void createIterEvent(String c, String i) {
		SafeMapIterator_activated = true;
		while (!SafeMapIterator_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_c = null;
		CachedWeakReference wr_i = null;
		Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> matchedEntry = null;
		boolean cachehit = false;
		if (((c == SafeMapIterator_c_i_Map_cachekey_c) && (i == SafeMapIterator_c_i_Map_cachekey_i) ) ) {
			matchedEntry = SafeMapIterator_c_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_c = new CachedWeakReference(c) ;
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
				if ((node_c == null) ) {
					node_c = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ;
					SafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
				}
				Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
				if ((node_c_i == null) ) {
					node_c_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
					node_c.putNode(wr_i, node_c_i) ;
					node_c_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
				}
				matchedEntry = node_c_i;
			}
		}
		// D(X) main:1
		SafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((wr_c == null) ) {
				wr_c = new CachedWeakReference(c) ;
			}
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			{
				// D(X) createNewMonitorStates:4 when Dom(theta'') = <c>
				SafeMapIteratorMonitor_Set sourceSet = null;
				{
					// FindCode
					Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c__To__map_c_Map.getNodeEquivalent(wr_c) ;
					if ((node_c != null) ) {
						SafeMapIteratorMonitor_Set itmdSet = node_c.getValue1() ;
						sourceSet = itmdSet;
					}
				}
				if ((sourceSet != null) ) {
					int numalive = 0;
					int setlen = sourceSet.getSize() ;
					for (int ielem = 0; (ielem < setlen) ;++ielem) {
						SafeMapIteratorMonitor sourceMonitor = sourceSet.get(ielem) ;
						if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_map.get() != null) ) ) {
							sourceSet.set(numalive++, sourceMonitor) ;
							CachedWeakReference wr_map = sourceMonitor.RVMRef_map;
							MapOfMonitor<ISafeMapIteratorMonitor> destLastMap = null;
							ISafeMapIteratorMonitor destLeaf = null;
							{
								// FindOrCreate
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c == null) ) {
									node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									node_map.getValue1() .putNode(wr_c, node_map_c) ;
									node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
									node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								MapOfMonitor<ISafeMapIteratorMonitor> itmdMap = node_map_c.getValue1() ;
								destLastMap = itmdMap;
								ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
								destLeaf = node_map_c_i;
							}
							if (((destLeaf == null) || destLeaf instanceof SafeMapIteratorDisableHolder) ) {
								boolean definable = true;
								// D(X) defineTo:1--5 for <c, i>
								if (definable) {
									// FindCode
									MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
									if ((node_c != null) ) {
										Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
										if ((node_c_i != null) ) {
											SafeMapIteratorMonitor itmdLeaf = node_c_i.getValue2() ;
											if ((itmdLeaf != null) ) {
												if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
													definable = false;
												}
											}
										}
									}
								}
								// D(X) defineTo:1--5 for <i>
								if (definable) {
									// FindCode
									Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
									if ((node_i != null) ) {
										SafeMapIteratorMonitor itmdLeaf = node_i.getValue2() ;
										if ((itmdLeaf != null) ) {
											if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
												definable = false;
											}
										}
									}
								}
								// D(X) defineTo:1--5 for <map, c, i>
								if (definable) {
									// FindCode
									Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
									if ((node_map != null) ) {
										Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
										if ((node_map_c != null) ) {
											ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
											if ((node_map_c_i != null) ) {
												if (((node_map_c_i.getDisable() > sourceMonitor.getTau() ) || ((node_map_c_i.getTau() > 0) && (node_map_c_i.getTau() < sourceMonitor.getTau() ) ) ) ) {
													definable = false;
												}
											}
										}
									}
								}
								if (definable) {
									// D(X) defineTo:6
									SafeMapIteratorMonitor created = (SafeMapIteratorMonitor)sourceMonitor.clone() ;
									created.RVMRef_i = wr_i;
									created.monitorInfo.isFullParam = true;

									destLastMap.putNode(wr_i, created) ;
									// D(X) defineTo:7 for <c, i>
									{
										// InsertMonitor
										MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
										if ((node_c == null) ) {
											node_c = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ;
											SafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
										}
										Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
										if ((node_c_i == null) ) {
											node_c_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
											node_c.putNode(wr_i, node_c_i) ;
											node_c_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
										}
										SafeMapIteratorMonitor_Set targetSet = node_c_i.getValue1() ;
										targetSet.add(created) ;
									}
									// D(X) defineTo:7 for <i>
									{
										// InsertMonitor
										Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
										if ((node_i == null) ) {
											node_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
											SafeMapIterator_i_Map.putNode(wr_i, node_i) ;
											node_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
										}
										SafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
										targetSet.add(created) ;
									}
									// D(X) defineTo:7 for <map>
									{
										// InsertMonitor
										Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
										if ((node_map == null) ) {
											node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
											SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
											node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
											node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
										}
										SafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
										targetSet.add(created) ;
									}
									// D(X) defineTo:7 for <map, c>
									{
										// InsertMonitor
										Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
										if ((node_map == null) ) {
											node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
											SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
											node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
											node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
										}
										Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
										if ((node_map_c == null) ) {
											node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
											node_map.getValue1() .putNode(wr_c, node_map_c) ;
											node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
											node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
										}
										SafeMapIteratorMonitor_Set targetSet = node_map_c.getValue2() ;
										targetSet.add(created) ;
									}
								}
							}
						}
					}
					sourceSet.eraseRange(numalive) ;
				}
			}
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				SafeMapIteratorMonitor created = new SafeMapIteratorMonitor(SafeMapIterator_timestamp++, null, wr_c, wr_i) ;
				created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
				created.monitorInfo.isFullParam = false;

				matchedEntry.setValue2(created) ;
				SafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
				// D(X) defineNew:5 for <i>
				{
					// InsertMonitor
					Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
					if ((node_i == null) ) {
						node_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
						SafeMapIterator_i_Map.putNode(wr_i, node_i) ;
						node_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
					}
					SafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
					targetSet.add(created) ;
				}
			}
			// D(X) main:6
			SafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(SafeMapIterator_timestamp++) ;
		}
		// D(X) main:8--9
		SafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_createIter(c, i);

		if ((cachehit == false) ) {
			SafeMapIterator_c_i_Map_cachekey_c = c;
			SafeMapIterator_c_i_Map_cachekey_i = i;
			SafeMapIterator_c_i_Map_cachevalue = matchedEntry;
		}

		SafeMapIterator_RVMLock.unlock();
	}

	public static final void useIterEvent(String i) {
		SafeMapIterator_activated = true;
		while (!SafeMapIterator_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> matchedEntry = null;
		boolean cachehit = false;
		if ((i == SafeMapIterator_i_Map_cachekey_i) ) {
			matchedEntry = SafeMapIterator_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
				if ((node_i == null) ) {
					node_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
					SafeMapIterator_i_Map.putNode(wr_i, node_i) ;
					node_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
				}
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		SafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				SafeMapIteratorMonitor created = new SafeMapIteratorMonitor(SafeMapIterator_timestamp++, null, null, wr_i) ;
				created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
				created.monitorInfo.isFullParam = false;

				matchedEntry.setValue2(created) ;
				SafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			SafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(SafeMapIterator_timestamp++) ;
		}
		// D(X) main:8--9
		SafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_useIter(i);

		if ((cachehit == false) ) {
			SafeMapIterator_i_Map_cachekey_i = i;
			SafeMapIterator_i_Map_cachevalue = matchedEntry;
		}

		SafeMapIterator_RVMLock.unlock();
	}

	public static final void updateMapEvent(String map) {
		SafeMapIterator_activated = true;
		while (!SafeMapIterator_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_map = null;
		Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> matchedEntry = null;
		boolean cachehit = false;
		if ((map == SafeMapIterator_map_Map_cachekey_map) ) {
			matchedEntry = SafeMapIterator_map_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_map = new CachedWeakReference(map) ;
			{
				// FindOrCreateEntry
				Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
				if ((node_map == null) ) {
					node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
					SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
					node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
					node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
				}
				matchedEntry = node_map;
			}
		}
		// D(X) main:1
		SafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue3() ;
		if ((matchedLeaf == null) ) {
			if ((wr_map == null) ) {
				wr_map = new CachedWeakReference(map) ;
			}
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				SafeMapIteratorMonitor created = new SafeMapIteratorMonitor(SafeMapIterator_timestamp++, wr_map, null, null) ;
				created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
				created.monitorInfo.isFullParam = false;

				matchedEntry.setValue3(created) ;
				SafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			SafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
			disableUpdatedLeaf.setDisable(SafeMapIterator_timestamp++) ;
		}
		// D(X) main:8--9
		SafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
		stateTransitionedSet.event_updateMap(map);

		if ((cachehit == false) ) {
			SafeMapIterator_map_Map_cachekey_map = map;
			SafeMapIterator_map_Map_cachevalue = matchedEntry;
		}

		SafeMapIterator_RVMLock.unlock();
	}

}
