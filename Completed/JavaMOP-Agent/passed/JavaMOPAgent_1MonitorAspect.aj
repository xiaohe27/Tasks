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

final class FileCloseMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<FileCloseMonitor> {

	FileCloseMonitor_Set(){
		this.size = 0;
		this.elements = new FileCloseMonitor[4];
	}
	final void event_write(FileWriter f) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			FileCloseMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final FileCloseMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_write(f);
				if(monitorfinalMonitor.FileCloseMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_close(FileWriter f) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			FileCloseMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final FileCloseMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_close(f);
				if(monitorfinalMonitor.FileCloseMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_endProg() {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			FileCloseMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final FileCloseMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_endProg();
				if(monitorfinalMonitor.FileCloseMonitor_Prop_1_Category_fail) {
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
final class HasNextMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<HasNextMonitor> {

	HasNextMonitor_Set(){
		this.size = 0;
		this.elements = new HasNextMonitor[4];
	}
	final void event_create(Collection c, Iterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			HasNextMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final HasNextMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_create(c, i);
				if(monitorfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_hasnext(Iterator i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			HasNextMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final HasNextMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_hasnext(i);
				if(monitorfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
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
			HasNextMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final HasNextMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_next(i);
				if(monitorfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
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

class FileCloseMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			FileCloseMonitor ret = (FileCloseMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	FileWriter saved_fw;

	WeakReference Ref_f = null;

	static final int Prop_1_transition_write[] = {0, 3, 3, 3};;
	static final int Prop_1_transition_close[] = {1, 1, 3, 3};;
	static final int Prop_1_transition_endProg[] = {3, 2, 3, 3};;

	volatile boolean FileCloseMonitor_Prop_1_Category_fail = false;

	private final AtomicInteger pairValue;

	FileCloseMonitor() {
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

	final boolean Prop_1_event_write(FileWriter f) {
		{
			saved_fw = f;
		}
		if(Ref_f == null){
			Ref_f = new WeakReference(f);
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_write) ;
		this.FileCloseMonitor_Prop_1_Category_fail = nextstate == 3;

		return true;
	}

	final boolean Prop_1_event_close(FileWriter f) {
		{
		}
		if(Ref_f == null){
			Ref_f = new WeakReference(f);
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_close) ;
		this.FileCloseMonitor_Prop_1_Category_fail = nextstate == 3;

		return true;
	}

	final boolean Prop_1_event_endProg() {
		FileWriter f = null;
		if(Ref_f != null){
			f = (FileWriter)Ref_f.get();
		}
		{
			System.out.println("Program has ended.");
		}

		int nextstate = this.handleEvent(2, Prop_1_transition_endProg) ;
		this.FileCloseMonitor_Prop_1_Category_fail = nextstate == 3;

		return true;
	}

	final void Prop_1_handler_fail (){
		{
			System.err.println("You should close the file you wrote.");
			try {
				saved_fw.close();
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
			this.reset();
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		FileCloseMonitor_Prop_1_Category_fail = false;
	}

	// RVMRef_f was suppressed to reduce memory overhead

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
			//write
			return;
			case 1:
			//close
			return;
			case 2:
			//endProg
			return;
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

	static final int Prop_1_transition_create[] = {2, 3, 3, 3};;
	static final int Prop_1_transition_hasnext[] = {3, 1, 1, 3};;
	static final int Prop_1_transition_next[] = {3, 2, 3, 3};;

	volatile boolean HasNextMonitor_Prop_1_Category_fail = false;

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

	final boolean Prop_1_event_create(Collection c, Iterator i) {
		{
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_create) ;
		this.HasNextMonitor_Prop_1_Category_fail = nextstate == 3;

		return true;
	}

	final boolean Prop_1_event_hasnext(Iterator i) {
		{
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_hasnext) ;
		this.HasNextMonitor_Prop_1_Category_fail = nextstate == 3;

		return true;
	}

	final boolean Prop_1_event_next(Iterator i) {
		{
		}

		int nextstate = this.handleEvent(2, Prop_1_transition_next) ;
		this.HasNextMonitor_Prop_1_Category_fail = nextstate == 3;

		return true;
	}

	final void Prop_1_handler_fail (){
		{
			System.err.println("! hasNext() has not been called" + " before calling next() for an" + " iterator");
			this.reset();
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		HasNextMonitor_Prop_1_Category_fail = false;
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
			//create
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//hasnext
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

class JavaMOPAgent_1RuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager JavaMOPAgent_1MapManager;
	static {
		JavaMOPAgent_1MapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		JavaMOPAgent_1MapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock JavaMOPAgent_1_RVMLock = new ReentrantLock();
	static final Condition JavaMOPAgent_1_RVMLock_cond = JavaMOPAgent_1_RVMLock.newCondition();

	private static boolean FileClose_activated = false;
	private static boolean HasNext_activated = false;

	// Declarations for Indexing Trees
	private static Object FileClose_f_Map_cachekey_f;
	private static FileCloseMonitor FileClose_f_Map_cachevalue;
	private static final FileCloseMonitor_Set FileClose__Map = new FileCloseMonitor_Set() ;
	private static final MapOfMonitor<FileCloseMonitor> FileClose_f_Map = new MapOfMonitor<FileCloseMonitor>(0) ;

	private static Object HasNext_i_Map_cachekey_i;
	private static HasNextMonitor HasNext_i_Map_cachevalue;
	private static final MapOfMonitor<HasNextMonitor> HasNext_i_Map = new MapOfMonitor<HasNextMonitor>(0) ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += FileClose_f_Map.cleanUpUnnecessaryMappings();
		collected += HasNext_i_Map.cleanUpUnnecessaryMappings();
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

	public static final void FileClose_writeEvent(FileWriter f) {
		FileClose_activated = true;
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_f = null;
		MapOfMonitor<FileCloseMonitor> matchedLastMap = null;
		FileCloseMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((f == FileClose_f_Map_cachekey_f) ) {
			matchedEntry = FileClose_f_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_f = new CachedWeakReference(f) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<FileCloseMonitor> itmdMap = FileClose_f_Map;
				matchedLastMap = itmdMap;
				FileCloseMonitor node_f = FileClose_f_Map.getNodeEquivalent(wr_f) ;
				matchedEntry = node_f;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_f == null) ) {
				wr_f = new CachedWeakReference(f) ;
			}
			// D(X) main:4
			FileCloseMonitor created = new FileCloseMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_f, created) ;
			// D(X) defineNew:5 for <>
			{
				// InsertMonitor
				FileCloseMonitor_Set targetSet = FileClose__Map;
				targetSet.add(created) ;
			}
		}
		// D(X) main:8--9
		final FileCloseMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_write(f);
		if(matchedEntryfinalMonitor.FileCloseMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			FileClose_f_Map_cachekey_f = f;
			FileClose_f_Map_cachevalue = matchedEntry;
		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

	public static final void FileClose_closeEvent(FileWriter f) {
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (FileClose_activated) {
			FileCloseMonitor matchedEntry = null;
			boolean cachehit = false;
			if ((f == FileClose_f_Map_cachekey_f) ) {
				matchedEntry = FileClose_f_Map_cachevalue;
				cachehit = true;
			}
			else {
				// FindEntry
				FileCloseMonitor node_f = FileClose_f_Map.getNodeWithStrongRef(f) ;
				matchedEntry = node_f;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				final FileCloseMonitor matchedEntryfinalMonitor = matchedEntry;
				matchedEntry.Prop_1_event_close(f);
				if(matchedEntryfinalMonitor.FileCloseMonitor_Prop_1_Category_fail) {
					matchedEntryfinalMonitor.Prop_1_handler_fail();
				}

				if ((cachehit == false) ) {
					FileClose_f_Map_cachekey_f = f;
					FileClose_f_Map_cachevalue = matchedEntry;
				}
			}

		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

	public static final void FileClose_endProgEvent() {
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		if (FileClose_activated) {
			FileCloseMonitor_Set matchedEntry = null;
			{
				// FindEntry
				matchedEntry = FileClose__Map;
			}
			// D(X) main:8--9
			if ((matchedEntry != null) ) {
				matchedEntry.event_endProg();

			}

		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

	public static final void HasNext_createEvent(Collection c, Iterator i) {
		HasNext_activated = true;
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<HasNextMonitor> matchedLastMap = null;
		HasNextMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == HasNext_i_Map_cachekey_i) ) {
			matchedEntry = HasNext_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<HasNextMonitor> itmdMap = HasNext_i_Map;
				matchedLastMap = itmdMap;
				HasNextMonitor node_i = HasNext_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			HasNextMonitor created = new HasNextMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_create(c, i);
		if(matchedEntryfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			HasNext_i_Map_cachekey_i = i;
			HasNext_i_Map_cachevalue = matchedEntry;
		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

	public static final void HasNext_hasnextEvent(Iterator i) {
		HasNext_activated = true;
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<HasNextMonitor> matchedLastMap = null;
		HasNextMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == HasNext_i_Map_cachekey_i) ) {
			matchedEntry = HasNext_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<HasNextMonitor> itmdMap = HasNext_i_Map;
				matchedLastMap = itmdMap;
				HasNextMonitor node_i = HasNext_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			HasNextMonitor created = new HasNextMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_hasnext(i);
		if(matchedEntryfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			HasNext_i_Map_cachekey_i = i;
			HasNext_i_Map_cachevalue = matchedEntry;
		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

	public static final void HasNext_nextEvent(Iterator i) {
		HasNext_activated = true;
		while (!JavaMOPAgent_1_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		MapOfMonitor<HasNextMonitor> matchedLastMap = null;
		HasNextMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((i == HasNext_i_Map_cachekey_i) ) {
			matchedEntry = HasNext_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<HasNextMonitor> itmdMap = HasNext_i_Map;
				matchedLastMap = itmdMap;
				HasNextMonitor node_i = HasNext_i_Map.getNodeEquivalent(wr_i) ;
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			// D(X) main:4
			HasNextMonitor created = new HasNextMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_i, created) ;
		}
		// D(X) main:8--9
		final HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_next(i);
		if(matchedEntryfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			HasNext_i_Map_cachekey_i = i;
			HasNext_i_Map_cachevalue = matchedEntry;
		}

		JavaMOPAgent_1_RVMLock.unlock();
	}

}


public aspect JavaMOPAgent_1MonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public JavaMOPAgent_1MonitorAspect(){
		Runtime.getRuntime().addShutdownHook(new JavaMOPAgent_1_DummyHookThread());
	}

	// Declarations for the Lock
	static ReentrantLock JavaMOPAgent_1_MOPLock = new ReentrantLock();
	static Condition JavaMOPAgent_1_MOPLock_cond = JavaMOPAgent_1_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution();
	pointcut HasNext_next(Iterator i) : (call(* Iterator.next()) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : HasNext_next(i) {
		JavaMOPAgent_1RuntimeMonitor.HasNext_nextEvent(i);
	}

	pointcut FileClose_write(FileWriter f) : (call(* FileWriter+.write(..)) && target(f)) && MOP_CommonPointCut();
	before (FileWriter f) : FileClose_write(f) {
		JavaMOPAgent_1RuntimeMonitor.FileClose_writeEvent(f);
	}

	pointcut FileClose_close(FileWriter f) : (call(* FileWriter+.close(..)) && target(f)) && MOP_CommonPointCut();
	after (FileWriter f) : FileClose_close(f) {
		JavaMOPAgent_1RuntimeMonitor.FileClose_closeEvent(f);
	}

	pointcut HasNext_create(Collection c) : (call(Iterator Collection+.iterator()) && target(c)) && MOP_CommonPointCut();
	after (Collection c) returning (Iterator i) : HasNext_create(c) {
		JavaMOPAgent_1RuntimeMonitor.HasNext_createEvent(c, i);
	}

	pointcut HasNext_hasnext(Iterator i) : (call(* Iterator.hasNext()) && target(i)) && MOP_CommonPointCut();
	after (Iterator i) : HasNext_hasnext(i) {
		JavaMOPAgent_1RuntimeMonitor.HasNext_hasnextEvent(i);
	}

	class JavaMOPAgent_1_DummyHookThread extends Thread {
		public void run(){
			JavaMOPAgent_1RuntimeMonitor.FileClose_endProgEvent();
		}
	}
}
