package mop;
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
import org.aspectj.lang.*;

final class UnsafeIteratorMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<UnsafeIteratorMonitor> {

	UnsafeIteratorMonitor_Set(){
		this.size = 0;
		this.elements = new UnsafeIteratorMonitor[4];
	}
	final void event_create(Collection c, Iterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			UnsafeIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final UnsafeIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_create(c, i);
				if(monitorfinalMonitor.UnsafeIteratorMonitor_Prop_1_Category_match) {
					monitorfinalMonitor.Prop_1_handler_match();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_updatesource(Collection c) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			UnsafeIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final UnsafeIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_updatesource(c);
				if(monitorfinalMonitor.UnsafeIteratorMonitor_Prop_1_Category_match) {
					monitorfinalMonitor.Prop_1_handler_match();
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
			UnsafeIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final UnsafeIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_next(i);
				if(monitorfinalMonitor.UnsafeIteratorMonitor_Prop_1_Category_match) {
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
final class UnsafeMapIteratorMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<UnsafeMapIteratorMonitor> {

	UnsafeMapIteratorMonitor_Set(){
		this.size = 0;
		this.elements = new UnsafeMapIteratorMonitor[4];
	}
	final void event_createColl(Map map, Collection c) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			UnsafeMapIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final UnsafeMapIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_createColl(map, c);
				if(monitorfinalMonitor.UnsafeMapIteratorMonitor_Prop_1_Category_match) {
					monitorfinalMonitor.Prop_1_handler_match();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_createIter(Collection c, Iterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			UnsafeMapIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final UnsafeMapIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_createIter(c, i);
				if(monitorfinalMonitor.UnsafeMapIteratorMonitor_Prop_1_Category_match) {
					monitorfinalMonitor.Prop_1_handler_match();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_useIter(Iterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			UnsafeMapIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final UnsafeMapIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_useIter(i);
				if(monitorfinalMonitor.UnsafeMapIteratorMonitor_Prop_1_Category_match) {
					monitorfinalMonitor.Prop_1_handler_match();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_updateMap(Map map) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			UnsafeMapIteratorMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final UnsafeMapIteratorMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_updateMap(map);
				if(monitorfinalMonitor.UnsafeMapIteratorMonitor_Prop_1_Category_match) {
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

interface IUnsafeIteratorMonitor extends IMonitor, IDisableHolder {
}

class UnsafeIteratorDisableHolder extends DisableHolder implements IUnsafeIteratorMonitor {
	UnsafeIteratorDisableHolder(long tau) {
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

class UnsafeIteratorMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, IUnsafeIteratorMonitor {
	protected Object clone() {
		try {
			UnsafeIteratorMonitor ret = (UnsafeIteratorMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	WeakReference Ref_c = null;
	WeakReference Ref_i = null;
	int Prop_1_state;
	static final int Prop_1_transition_create[] = {1, 4, 4, 4, 4};;
	static final int Prop_1_transition_updatesource[] = {4, 3, 4, 3, 4};;
	static final int Prop_1_transition_next[] = {4, 1, 4, 2, 4};;

	boolean UnsafeIteratorMonitor_Prop_1_Category_match = false;

	UnsafeIteratorMonitor(long tau) {
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

	final boolean Prop_1_event_create(Collection c, Iterator i) {
		{
		}
		if(Ref_c == null){
			Ref_c = new WeakReference(c);
		}
		if(Ref_i == null){
			Ref_i = new WeakReference(i);
		}
		RVM_lastevent = 0;

		Prop_1_state = Prop_1_transition_create[Prop_1_state];
		UnsafeIteratorMonitor_Prop_1_Category_match = Prop_1_state == 2;
		return true;
	}

	final boolean Prop_1_event_updatesource(Collection c) {
		Iterator i = null;
		if(Ref_i != null){
			i = (Iterator)Ref_i.get();
		}
		{
		}
		if(Ref_c == null){
			Ref_c = new WeakReference(c);
		}
		RVM_lastevent = 1;

		Prop_1_state = Prop_1_transition_updatesource[Prop_1_state];
		UnsafeIteratorMonitor_Prop_1_Category_match = Prop_1_state == 2;
		return true;
	}

	final boolean Prop_1_event_next(Iterator i) {
		Collection c = null;
		if(Ref_c != null){
			c = (Collection)Ref_c.get();
		}
		{
		}
		if(Ref_i == null){
			Ref_i = new WeakReference(i);
		}
		RVM_lastevent = 2;

		Prop_1_state = Prop_1_transition_next[Prop_1_state];
		UnsafeIteratorMonitor_Prop_1_Category_match = Prop_1_state == 2;
		return true;
	}

	final void Prop_1_handler_match (){
		{
			System.out.println("improper iterator usage");
		}

	}

	final void reset() {
		RVM_lastevent = -1;
		Prop_1_state = 0;
		UnsafeIteratorMonitor_Prop_1_Category_match = false;
	}

	// RVMRef_c was suppressed to reduce memory overhead
	// RVMRef_i was suppressed to reduce memory overhead

	//alive_parameters_0 = [Collection c, Iterator i]
	boolean alive_parameters_0 = true;
	//alive_parameters_1 = [Iterator i]
	boolean alive_parameters_1 = true;

	@Override
	protected final void terminateInternal(int idnum) {
		switch(idnum){
			case 0:
			alive_parameters_0 = false;
			break;
			case 1:
			alive_parameters_0 = false;
			alive_parameters_1 = false;
			break;
		}
		switch(RVM_lastevent) {
			case -1:
			return;
			case 0:
			//create
			//alive_c && alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//updatesource
			//alive_i
			if(!(alive_parameters_1)){
				RVM_terminated = true;
				return;
			}
			break;

			case 2:
			//next
			//alive_c && alive_i
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
interface IUnsafeMapIteratorMonitor extends IMonitor, IDisableHolder {
}

class UnsafeMapIteratorDisableHolder extends DisableHolder implements IUnsafeMapIteratorMonitor {
	UnsafeMapIteratorDisableHolder(long tau) {
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

class UnsafeMapIteratorMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, IUnsafeMapIteratorMonitor {
	protected Object clone() {
		try {
			UnsafeMapIteratorMonitor ret = (UnsafeMapIteratorMonitor) super.clone();
			ret.monitorInfo = (com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo)this.monitorInfo.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	WeakReference Ref_c = null;
	WeakReference Ref_i = null;
	WeakReference Ref_map = null;
	int Prop_1_state;
	static final int Prop_1_transition_createColl[] = {2, 5, 5, 5, 5, 5};;
	static final int Prop_1_transition_createIter[] = {5, 5, 3, 5, 5, 5};;
	static final int Prop_1_transition_useIter[] = {5, 5, 5, 3, 1, 5};;
	static final int Prop_1_transition_updateMap[] = {5, 5, 2, 4, 4, 5};;

	boolean UnsafeMapIteratorMonitor_Prop_1_Category_match = false;

	UnsafeMapIteratorMonitor(long tau, CachedWeakReference RVMRef_map, CachedWeakReference RVMRef_c, CachedWeakReference RVMRef_i) {
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

	final boolean Prop_1_event_createColl(Map map, Collection c) {
		Iterator i = null;
		if(Ref_i != null){
			i = (Iterator)Ref_i.get();
		}
		{
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
			UnsafeMapIteratorMonitor_Prop_1_Category_match = Prop_1_state == 1;
		}
		return true;
	}

	final boolean Prop_1_event_createIter(Collection c, Iterator i) {
		Map map = null;
		if(Ref_map != null){
			map = (Map)Ref_map.get();
		}
		{
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
			UnsafeMapIteratorMonitor_Prop_1_Category_match = Prop_1_state == 1;
		}
		return true;
	}

	final boolean Prop_1_event_useIter(Iterator i) {
		Map map = null;
		if(Ref_map != null){
			map = (Map)Ref_map.get();
		}
		Collection c = null;
		if(Ref_c != null){
			c = (Collection)Ref_c.get();
		}
		{
		}
		if(Ref_i == null){
			Ref_i = new WeakReference(i);
		}
		RVM_lastevent = 2;

		Prop_1_state = Prop_1_transition_useIter[Prop_1_state];
		if(this.monitorInfo.isFullParam){
			UnsafeMapIteratorMonitor_Prop_1_Category_match = Prop_1_state == 1;
		}
		return true;
	}

	final boolean Prop_1_event_updateMap(Map map) {
		Collection c = null;
		if(Ref_c != null){
			c = (Collection)Ref_c.get();
		}
		Iterator i = null;
		if(Ref_i != null){
			i = (Iterator)Ref_i.get();
		}
		{
		}
		if(Ref_map == null){
			Ref_map = new WeakReference(map);
		}
		RVM_lastevent = 3;

		Prop_1_state = Prop_1_transition_updateMap[Prop_1_state];
		if(this.monitorInfo.isFullParam){
			UnsafeMapIteratorMonitor_Prop_1_Category_match = Prop_1_state == 1;
		}
		return true;
	}

	final void Prop_1_handler_match (){
		{
			System.out.println("unsafe iterator usage!");
		}

	}

	final void reset() {
		RVM_lastevent = -1;
		Prop_1_state = 0;
		UnsafeMapIteratorMonitor_Prop_1_Category_match = false;
	}

	CachedWeakReference RVMRef_map;
	CachedWeakReference RVMRef_c;
	CachedWeakReference RVMRef_i;

	//alive_parameters_0 = [Map map, Collection c, Iterator i]
	boolean alive_parameters_0 = true;
	//alive_parameters_1 = [Map map, Iterator i]
	boolean alive_parameters_1 = true;
	//alive_parameters_2 = [Iterator i]
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

class JavaMOPAgent_1RuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager JavaMOPAgent_1MapManager;
	static {
		JavaMOPAgent_1MapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		JavaMOPAgent_1MapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock JavaMOPAgent_1_RVMLock = new ReentrantLock();
	static final Condition JavaMOPAgent_1_RVMLock_cond = JavaMOPAgent_1_RVMLock.newCondition();

	// Declarations for Timestamps
	private static long UnsafeMapIterator_timestamp = 1;
	private static long UnsafeIterator_timestamp = 1;

	private static boolean UnsafeIterator_activated = false;
	private static boolean UnsafeMapIterator_activated = false;

	// Declarations for Indexing Trees
	private static Object UnsafeIterator_c_Map_cachekey_c;
	private static Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> UnsafeIterator_c_Map_cachevalue;
	private static Object UnsafeIterator_c_i_Map_cachekey_c;
	private static Object UnsafeIterator_c_i_Map_cachekey_i;
	private static UnsafeIteratorMonitor UnsafeIterator_c_i_Map_cachevalue;
	private static Object UnsafeIterator_i_Map_cachekey_i;
	private static Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> UnsafeIterator_i_Map_cachevalue;
	private static final MapOfSetMonitor<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> UnsafeIterator_i_Map = new MapOfSetMonitor<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>(1) ;
	private static final MapOfAll<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> UnsafeIterator_c_i_Map = new MapOfAll<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>(0) ;

	private static Object UnsafeMapIterator_c_i_Map_cachekey_c;
	private static Object UnsafeMapIterator_c_i_Map_cachekey_i;
	private static Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_c_i_Map_cachevalue;
	private static Object UnsafeMapIterator_i_Map_cachekey_i;
	private static Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_i_Map_cachevalue;
	private static Object UnsafeMapIterator_map_Map_cachekey_map;
	private static Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_map_Map_cachevalue;
	private static Object UnsafeMapIterator_map_c_Map_cachekey_c;
	private static Object UnsafeMapIterator_map_c_Map_cachekey_map;
	private static Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_map_c_Map_cachevalue;
	private static Object UnsafeMapIterator_map_c_i_Map_cachekey_c;
	private static Object UnsafeMapIterator_map_c_i_Map_cachekey_i;
	private static Object UnsafeMapIterator_map_c_i_Map_cachekey_map;
	private static IUnsafeMapIteratorMonitor UnsafeMapIterator_map_c_i_Map_cachevalue;
	private static final MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_i_Map = new MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(2) ;
	private static final MapOfAll<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_map_c_i_Map = new MapOfAll<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(0) ;
	private static final MapOfMap<MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>> UnsafeMapIterator_c_i_Map = new MapOfMap<MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>>(1) ;
	private static Object UnsafeMapIterator_c__To__map_c_Map_cachekey_c;
	private static Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_c__To__map_c_Map_cachevalue;
	private static final MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_c__To__map_c_Map = new MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += UnsafeIterator_i_Map.cleanUpUnnecessaryMappings();
		collected += UnsafeIterator_c_i_Map.cleanUpUnnecessaryMappings();
		collected += UnsafeMapIterator_i_Map.cleanUpUnnecessaryMappings();
		collected += UnsafeMapIterator_map_c_i_Map.cleanUpUnnecessaryMappings();
		collected += UnsafeMapIterator_c_i_Map.cleanUpUnnecessaryMappings();
		collected += UnsafeMapIterator_c__To__map_c_Map.cleanUpUnnecessaryMappings();
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

	public static final void UnsafeIterator_createEvent(Collection c, Iterator i) {
		UnsafeIterator_activated = true;
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_c = null;
		CachedWeakReference wr_i = null;
		MapOfMonitor<UnsafeIteratorMonitor> matchedLastMap = null;
		UnsafeIteratorMonitor matchedEntry = null;
		boolean cachehit = false;
		if (((c == UnsafeIterator_c_i_Map_cachekey_c) && (i == UnsafeIterator_c_i_Map_cachekey_i) ) ) {
			matchedEntry = UnsafeIterator_c_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_c = new CachedWeakReference(c) ;
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> node_c = UnsafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
				if ((node_c == null) ) {
					node_c = new Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>() ;
					UnsafeIterator_c_i_Map.putNode(wr_c, node_c) ;
					node_c.setValue1(new MapOfMonitor<UnsafeIteratorMonitor>(1) ) ;
					node_c.setValue2(new UnsafeIteratorMonitor_Set() ) ;
				}
				MapOfMonitor<UnsafeIteratorMonitor> itmdMap = node_c.getValue1() ;
				matchedLastMap = itmdMap;
				UnsafeIteratorMonitor node_c_i = node_c.getValue1() .getNodeEquivalent(wr_i) ;
				matchedEntry = node_c_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_c == null) ) {
				wr_c = new CachedWeakReference(c) ;
			}
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			if ((matchedEntry == null) ) {
				// D(X) main:4
				UnsafeIteratorMonitor created = new UnsafeIteratorMonitor(UnsafeIterator_timestamp++) ;
				matchedEntry = created;
				matchedLastMap.putNode(wr_i, created) ;
				// D(X) defineNew:5 for <c>
				{
					// InsertMonitor
					Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> node_c = UnsafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
					if ((node_c == null) ) {
						node_c = new Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>() ;
						UnsafeIterator_c_i_Map.putNode(wr_c, node_c) ;
						node_c.setValue1(new MapOfMonitor<UnsafeIteratorMonitor>(1) ) ;
						node_c.setValue2(new UnsafeIteratorMonitor_Set() ) ;
					}
					UnsafeIteratorMonitor_Set targetSet = node_c.getValue2() ;
					targetSet.add(created) ;
				}
				// D(X) defineNew:5 for <i>
				{
					// InsertMonitor
					Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> node_i = UnsafeIterator_i_Map.getNodeEquivalent(wr_i) ;
					if ((node_i == null) ) {
						node_i = new Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>() ;
						UnsafeIterator_i_Map.putNode(wr_i, node_i) ;
						node_i.setValue1(new UnsafeIteratorMonitor_Set() ) ;
					}
					UnsafeIteratorMonitor_Set targetSet = node_i.getValue1() ;
					targetSet.add(created) ;
				}
			}
			// D(X) main:6
			matchedEntry.setDisable(UnsafeIterator_timestamp++) ;
		}
		// D(X) main:8--9
		final UnsafeIteratorMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_create(c, i);
		if(matchedEntryfinalMonitor.UnsafeIteratorMonitor_Prop_1_Category_match) {
			matchedEntryfinalMonitor.Prop_1_handler_match();
		}

		if ((cachehit == false) ) {
			UnsafeIterator_c_i_Map_cachekey_c = c;
			UnsafeIterator_c_i_Map_cachekey_i = i;
			UnsafeIterator_c_i_Map_cachevalue = matchedEntry;
		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

	public static final void UnsafeIterator_updatesourceEvent(Collection c) {
		UnsafeIterator_activated = true;
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_c = null;
		Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> matchedEntry = null;
		boolean cachehit = false;
		if ((c == UnsafeIterator_c_Map_cachekey_c) ) {
			matchedEntry = UnsafeIterator_c_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_c = new CachedWeakReference(c) ;
			{
				// FindOrCreateEntry
				Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> node_c = UnsafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
				if ((node_c == null) ) {
					node_c = new Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>() ;
					UnsafeIterator_c_i_Map.putNode(wr_c, node_c) ;
					node_c.setValue1(new MapOfMonitor<UnsafeIteratorMonitor>(1) ) ;
					node_c.setValue2(new UnsafeIteratorMonitor_Set() ) ;
				}
				matchedEntry = node_c;
			}
		}
		// D(X) main:1
		UnsafeIteratorMonitor matchedLeaf = matchedEntry.getValue3() ;
		if ((matchedLeaf == null) ) {
			if ((wr_c == null) ) {
				wr_c = new CachedWeakReference(c) ;
			}
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				UnsafeIteratorMonitor created = new UnsafeIteratorMonitor(UnsafeIterator_timestamp++) ;
				matchedEntry.setValue3(created) ;
				UnsafeIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			UnsafeIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
			disableUpdatedLeaf.setDisable(UnsafeIterator_timestamp++) ;
		}
		// D(X) main:8--9
		UnsafeIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
		stateTransitionedSet.event_updatesource(c);

		if ((cachehit == false) ) {
			UnsafeIterator_c_Map_cachekey_c = c;
			UnsafeIterator_c_Map_cachevalue = matchedEntry;
		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

	public static final void UnsafeIterator_nextEvent(Iterator i) {
		UnsafeIterator_activated = true;
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> matchedEntry = null;
		boolean cachehit = false;
		if ((i == UnsafeIterator_i_Map_cachekey_i) ) {
			matchedEntry = UnsafeIterator_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> node_i = UnsafeIterator_i_Map.getNodeEquivalent(wr_i) ;
				if ((node_i == null) ) {
					node_i = new Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>() ;
					UnsafeIterator_i_Map.putNode(wr_i, node_i) ;
					node_i.setValue1(new UnsafeIteratorMonitor_Set() ) ;
				}
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		UnsafeIteratorMonitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				UnsafeIteratorMonitor created = new UnsafeIteratorMonitor(UnsafeIterator_timestamp++) ;
				matchedEntry.setValue2(created) ;
				UnsafeIteratorMonitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			UnsafeIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(UnsafeIterator_timestamp++) ;
		}
		// D(X) main:8--9
		UnsafeIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_next(i);

		if ((cachehit == false) ) {
			UnsafeIterator_i_Map_cachekey_i = i;
			UnsafeIterator_i_Map_cachevalue = matchedEntry;
		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

	public static final void UnsafeMapIterator_createCollEvent(Map map, Collection c) {
		UnsafeMapIterator_activated = true;
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_c = null;
		CachedWeakReference wr_map = null;
		Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> matchedEntry = null;
		boolean cachehit = false;
		if (((c == UnsafeMapIterator_map_c_Map_cachekey_c) && (map == UnsafeMapIterator_map_c_Map_cachekey_map) ) ) {
			matchedEntry = UnsafeMapIterator_map_c_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_map = new CachedWeakReference(map) ;
			wr_c = new CachedWeakReference(c) ;
			{
				// FindOrCreateEntry
				Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
				if ((node_map == null) ) {
					node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
					UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
					node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
					node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
				}
				Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
				if ((node_map_c == null) ) {
					node_map_c = new Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
					node_map.getValue1() .putNode(wr_c, node_map_c) ;
					node_map_c.setValue1(new MapOfMonitor<IUnsafeMapIteratorMonitor>(2) ) ;
					node_map_c.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
				}
				matchedEntry = node_map_c;
			}
		}
		// D(X) main:1
		UnsafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue3() ;
		if ((matchedLeaf == null) ) {
			if ((wr_map == null) ) {
				wr_map = new CachedWeakReference(map) ;
			}
			if ((wr_c == null) ) {
				wr_c = new CachedWeakReference(c) ;
			}
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				UnsafeMapIteratorMonitor created = new UnsafeMapIteratorMonitor(UnsafeMapIterator_timestamp++, wr_map, wr_c, null) ;
				created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
				created.monitorInfo.isFullParam = false;

				matchedEntry.setValue3(created) ;
				UnsafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
				enclosingSet.add(created) ;
				// D(X) defineNew:5 for <map>
				{
					// InsertMonitor
					Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
					if ((node_map == null) ) {
						node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
						UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
						node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
						node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
					}
					UnsafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
					targetSet.add(created) ;
				}
				// D(X) defineNew:5 for <c-map, c>
				{
					// InsertMonitor
					Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c = UnsafeMapIterator_c__To__map_c_Map.getNodeEquivalent(wr_c) ;
					if ((node_c == null) ) {
						node_c = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
						UnsafeMapIterator_c__To__map_c_Map.putNode(wr_c, node_c) ;
						node_c.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
					}
					UnsafeMapIteratorMonitor_Set targetSet = node_c.getValue1() ;
					targetSet.add(created) ;
				}
			}
			// D(X) main:6
			UnsafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
			disableUpdatedLeaf.setDisable(UnsafeMapIterator_timestamp++) ;
		}
		// D(X) main:8--9
		UnsafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
		stateTransitionedSet.event_createColl(map, c);

		if ((cachehit == false) ) {
			UnsafeMapIterator_map_c_Map_cachekey_c = c;
			UnsafeMapIterator_map_c_Map_cachekey_map = map;
			UnsafeMapIterator_map_c_Map_cachevalue = matchedEntry;
		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

	public static final void UnsafeMapIterator_createIterEvent(Collection c, Iterator i) {
		UnsafeMapIterator_activated = true;
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_c = null;
		CachedWeakReference wr_i = null;
		Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> matchedEntry = null;
		boolean cachehit = false;
		if (((c == UnsafeMapIterator_c_i_Map_cachekey_c) && (i == UnsafeMapIterator_c_i_Map_cachekey_i) ) ) {
			matchedEntry = UnsafeMapIterator_c_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_c = new CachedWeakReference(c) ;
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c = UnsafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
				if ((node_c == null) ) {
					node_c = new MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ;
					UnsafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
				}
				Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
				if ((node_c_i == null) ) {
					node_c_i = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
					node_c.putNode(wr_i, node_c_i) ;
					node_c_i.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
				}
				matchedEntry = node_c_i;
			}
		}
		// D(X) main:1
		UnsafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((wr_c == null) ) {
				wr_c = new CachedWeakReference(c) ;
			}
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			{
				// D(X) createNewMonitorStates:4 when Dom(theta'') = <c>
				UnsafeMapIteratorMonitor_Set sourceSet = null;
				{
					// FindCode
					Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c = UnsafeMapIterator_c__To__map_c_Map.getNodeEquivalent(wr_c) ;
					if ((node_c != null) ) {
						UnsafeMapIteratorMonitor_Set itmdSet = node_c.getValue1() ;
						sourceSet = itmdSet;
					}
				}
				if ((sourceSet != null) ) {
					int numalive = 0;
					int setlen = sourceSet.getSize() ;
					for (int ielem = 0; (ielem < setlen) ;++ielem) {
						UnsafeMapIteratorMonitor sourceMonitor = sourceSet.get(ielem) ;
						if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_map.get() != null) ) ) {
							sourceSet.set(numalive++, sourceMonitor) ;
							CachedWeakReference wr_map = sourceMonitor.RVMRef_map;
							MapOfMonitor<IUnsafeMapIteratorMonitor> destLastMap = null;
							IUnsafeMapIteratorMonitor destLeaf = null;
							{
								// FindOrCreate
								Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
									UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
								}
								Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c == null) ) {
									node_map_c = new Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
									node_map.getValue1() .putNode(wr_c, node_map_c) ;
									node_map_c.setValue1(new MapOfMonitor<IUnsafeMapIteratorMonitor>(2) ) ;
									node_map_c.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
								}
								MapOfMonitor<IUnsafeMapIteratorMonitor> itmdMap = node_map_c.getValue1() ;
								destLastMap = itmdMap;
								IUnsafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
								destLeaf = node_map_c_i;
							}
							if (((destLeaf == null) || destLeaf instanceof UnsafeMapIteratorDisableHolder) ) {
								boolean definable = true;
								// D(X) defineTo:1--5 for <c, i>
								if (definable) {
									// FindCode
									MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c = UnsafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
									if ((node_c != null) ) {
										Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
										if ((node_c_i != null) ) {
											UnsafeMapIteratorMonitor itmdLeaf = node_c_i.getValue2() ;
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
									Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_i = UnsafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
									if ((node_i != null) ) {
										UnsafeMapIteratorMonitor itmdLeaf = node_i.getValue2() ;
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
									Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
									if ((node_map != null) ) {
										Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
										if ((node_map_c != null) ) {
											IUnsafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
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
									UnsafeMapIteratorMonitor created = (UnsafeMapIteratorMonitor)sourceMonitor.clone() ;
									created.RVMRef_i = wr_i;
									created.monitorInfo.isFullParam = true;

									destLastMap.putNode(wr_i, created) ;
									// D(X) defineTo:7 for <c, i>
									{
										// InsertMonitor
										MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c = UnsafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
										if ((node_c == null) ) {
											node_c = new MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ;
											UnsafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
										}
										Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
										if ((node_c_i == null) ) {
											node_c_i = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
											node_c.putNode(wr_i, node_c_i) ;
											node_c_i.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
										}
										UnsafeMapIteratorMonitor_Set targetSet = node_c_i.getValue1() ;
										targetSet.add(created) ;
									}
									// D(X) defineTo:7 for <i>
									{
										// InsertMonitor
										Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_i = UnsafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
										if ((node_i == null) ) {
											node_i = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
											UnsafeMapIterator_i_Map.putNode(wr_i, node_i) ;
											node_i.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
										}
										UnsafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
										targetSet.add(created) ;
									}
									// D(X) defineTo:7 for <map>
									{
										// InsertMonitor
										Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
										if ((node_map == null) ) {
											node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
											UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
											node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
											node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
										}
										UnsafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
										targetSet.add(created) ;
									}
									// D(X) defineTo:7 for <map, c>
									{
										// InsertMonitor
										Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
										if ((node_map == null) ) {
											node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
											UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
											node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
											node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
										}
										Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
										if ((node_map_c == null) ) {
											node_map_c = new Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
											node_map.getValue1() .putNode(wr_c, node_map_c) ;
											node_map_c.setValue1(new MapOfMonitor<IUnsafeMapIteratorMonitor>(2) ) ;
											node_map_c.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
										}
										UnsafeMapIteratorMonitor_Set targetSet = node_map_c.getValue2() ;
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
				UnsafeMapIteratorMonitor created = new UnsafeMapIteratorMonitor(UnsafeMapIterator_timestamp++, null, wr_c, wr_i) ;
				created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
				created.monitorInfo.isFullParam = false;

				matchedEntry.setValue2(created) ;
				UnsafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
				// D(X) defineNew:5 for <i>
				{
					// InsertMonitor
					Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_i = UnsafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
					if ((node_i == null) ) {
						node_i = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
						UnsafeMapIterator_i_Map.putNode(wr_i, node_i) ;
						node_i.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
					}
					UnsafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
					targetSet.add(created) ;
				}
			}
			// D(X) main:6
			UnsafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(UnsafeMapIterator_timestamp++) ;
		}
		// D(X) main:8--9
		UnsafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_createIter(c, i);

		if ((cachehit == false) ) {
			UnsafeMapIterator_c_i_Map_cachekey_c = c;
			UnsafeMapIterator_c_i_Map_cachekey_i = i;
			UnsafeMapIterator_c_i_Map_cachevalue = matchedEntry;
		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

	public static final void UnsafeMapIterator_useIterEvent(Iterator i) {
		UnsafeMapIterator_activated = true;
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> matchedEntry = null;
		boolean cachehit = false;
		if ((i == UnsafeMapIterator_i_Map_cachekey_i) ) {
			matchedEntry = UnsafeMapIterator_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_i = UnsafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
				if ((node_i == null) ) {
					node_i = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
					UnsafeMapIterator_i_Map.putNode(wr_i, node_i) ;
					node_i.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
				}
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		UnsafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				UnsafeMapIteratorMonitor created = new UnsafeMapIteratorMonitor(UnsafeMapIterator_timestamp++, null, null, wr_i) ;
				created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
				created.monitorInfo.isFullParam = false;

				matchedEntry.setValue2(created) ;
				UnsafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			UnsafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(UnsafeMapIterator_timestamp++) ;
		}
		// D(X) main:8--9
		UnsafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_useIter(i);

		if ((cachehit == false) ) {
			UnsafeMapIterator_i_Map_cachekey_i = i;
			UnsafeMapIterator_i_Map_cachevalue = matchedEntry;
		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

	public static final void UnsafeMapIterator_updateMapEvent(Map map) {
		UnsafeMapIterator_activated = true;
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_map = null;
		Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> matchedEntry = null;
		boolean cachehit = false;
		if ((map == UnsafeMapIterator_map_Map_cachekey_map) ) {
			matchedEntry = UnsafeMapIterator_map_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_map = new CachedWeakReference(map) ;
			{
				// FindOrCreateEntry
				Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
				if ((node_map == null) ) {
					node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
					UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
					node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
					node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
				}
				matchedEntry = node_map;
			}
		}
		// D(X) main:1
		UnsafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue3() ;
		if ((matchedLeaf == null) ) {
			if ((wr_map == null) ) {
				wr_map = new CachedWeakReference(map) ;
			}
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				UnsafeMapIteratorMonitor created = new UnsafeMapIteratorMonitor(UnsafeMapIterator_timestamp++, wr_map, null, null) ;
				created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
				created.monitorInfo.isFullParam = false;

				matchedEntry.setValue3(created) ;
				UnsafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			UnsafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
			disableUpdatedLeaf.setDisable(UnsafeMapIterator_timestamp++) ;
		}
		// D(X) main:8--9
		UnsafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
		stateTransitionedSet.event_updateMap(map);

		if ((cachehit == false) ) {
			UnsafeMapIterator_map_Map_cachekey_map = map;
			UnsafeMapIterator_map_Map_cachevalue = matchedEntry;
		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

}


public aspect JavaMOPAgent_1MonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public JavaMOPAgent_1MonitorAspect(){
	}

	// Declarations for the Lock
	static ReentrantLock JavaMOPAgent_1_MOPLock = new ReentrantLock();
	static Condition JavaMOPAgent_1_MOPLock_cond = JavaMOPAgent_1_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution();
	pointcut UnsafeIterator_next(Iterator i) : (call(* Iterator.next()) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : UnsafeIterator_next(i) {
		//UnsafeMapIterator_useIter
		JavaMOPAgent_1RuntimeMonitor.UnsafeMapIterator_useIterEvent(i);
		//UnsafeIterator_next
		JavaMOPAgent_1RuntimeMonitor.UnsafeIterator_nextEvent(i);
	}

	pointcut UnsafeIterator_create(Collection c) : (call(Iterator Collection+.iterator()) && target(c)) && MOP_CommonPointCut();
	after (Collection c) returning (Iterator i) : UnsafeIterator_create(c) {
		JavaMOPAgent_1RuntimeMonitor.UnsafeIterator_createEvent(c, i);
	}

	pointcut UnsafeIterator_updatesource(Collection c) : ((call(* Collection+.remove*(..)) || call(* Collection+.add*(..))) && target(c)) && MOP_CommonPointCut();
	after (Collection c) : UnsafeIterator_updatesource(c) {
		JavaMOPAgent_1RuntimeMonitor.UnsafeIterator_updatesourceEvent(c);
	}

	pointcut UnsafeMapIterator_createColl(Map map) : ((call(* Map.values()) || call(* Map.keySet())) && target(map)) && MOP_CommonPointCut();
	after (Map map) returning (Collection c) : UnsafeMapIterator_createColl(map) {
		JavaMOPAgent_1RuntimeMonitor.UnsafeMapIterator_createCollEvent(map, c);
	}

	pointcut UnsafeMapIterator_createIter(Collection c) : (call(* Collection.iterator()) && target(c)) && MOP_CommonPointCut();
	after (Collection c) returning (Iterator i) : UnsafeMapIterator_createIter(c) {
		JavaMOPAgent_1RuntimeMonitor.UnsafeMapIterator_createIterEvent(c, i);
	}

	pointcut UnsafeMapIterator_updateMap(Map map) : ((call(* Map.put*(..)) || call(* Map.putAll*(..)) || call(* Map.clear()) || call(* Map.remove*(..))) && target(map)) && MOP_CommonPointCut();
	after (Map map) : UnsafeMapIterator_updateMap(map) {
		JavaMOPAgent_1RuntimeMonitor.UnsafeMapIterator_updateMapEvent(map);
	}

}
