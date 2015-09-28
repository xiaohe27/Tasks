package mop;
import java.util.*;
import java.lang.*;
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

final class SortedSet_ComparableRawMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<SortedSet_ComparableRawMonitor> {

	SortedSet_ComparableRawMonitor_Set(){
		this.size = 0;
		this.elements = new SortedSet_ComparableRawMonitor[4];
	}
	final void event_add(SortedSet s, Object e) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			SortedSet_ComparableRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_add(s, e);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_addall(SortedSet s, Collection c) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			SortedSet_ComparableRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_addall(s, c);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
}

class SortedSet_ComparableRawMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			SortedSet_ComparableRawMonitor ret = (SortedSet_ComparableRawMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	@Override
	public final int getState() {
		return -1;
	}

	final boolean event_add(SortedSet s, Object e) {
		RVM_lastevent = 0;
		{
			if (s.comparator() == null && !(e instanceof Comparable)) {
				RVMLogging.out.println(Level.CRITICAL, "Specification SortedSet_Comparable has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/SortedSet_Comparable.html");
				RVMLogging.out.println(Level.CRITICAL, "A non-comparable object is being inserted into a SortedSet object.");
			}
		}
		return true;
	}

	final boolean event_addall(SortedSet s, Collection c) {
		RVM_lastevent = 1;
		{
			for (Object elem : c) {
				if (s.comparator() == null && !(elem instanceof Comparable)) {
					RVMLogging.out.println(Level.CRITICAL, "Specification SortedSet_Comparable has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/SortedSet_Comparable.html");
					RVMLogging.out.println(Level.CRITICAL, "A non-comparable object is being inserted into a SortedSet object.");
				}
			}
		}
		return true;
	}

	final void reset() {
		RVM_lastevent = -1;
	}

	// RVMRef_s was suppressed to reduce memory overhead

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
			//add
			return;
			case 1:
			//addall
			return;
		}
		return;
	}

}

public final class SortedSet_ComparableRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager SortedSet_ComparableMapManager;
	static {
		SortedSet_ComparableMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		SortedSet_ComparableMapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock SortedSet_Comparable_RVMLock = new ReentrantLock();
	static final Condition SortedSet_Comparable_RVMLock_cond = SortedSet_Comparable_RVMLock.newCondition();

	private static boolean SortedSet_Comparable_activated = false;

	// Declarations for Indexing Trees
	private static Object SortedSet_Comparable_s_Map_cachekey_s;
	private static SortedSet_ComparableRawMonitor SortedSet_Comparable_s_Map_cachevalue;
	private static final MapOfMonitor<SortedSet_ComparableRawMonitor> SortedSet_Comparable_s_Map = new MapOfMonitor<SortedSet_ComparableRawMonitor>(0) ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += SortedSet_Comparable_s_Map.cleanUpUnnecessaryMappings();
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

	public static final void addEvent(SortedSet s, Object e) {
		SortedSet_Comparable_activated = true;
		while (!SortedSet_Comparable_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_s = null;
		MapOfMonitor<SortedSet_ComparableRawMonitor> matchedLastMap = null;
		SortedSet_ComparableRawMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((s == SortedSet_Comparable_s_Map_cachekey_s) ) {
			matchedEntry = SortedSet_Comparable_s_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_s = new CachedWeakReference(s) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<SortedSet_ComparableRawMonitor> itmdMap = SortedSet_Comparable_s_Map;
				matchedLastMap = itmdMap;
				SortedSet_ComparableRawMonitor node_s = SortedSet_Comparable_s_Map.getNodeEquivalent(wr_s) ;
				matchedEntry = node_s;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_s == null) ) {
				wr_s = new CachedWeakReference(s) ;
			}
			// D(X) main:4
			SortedSet_ComparableRawMonitor created = new SortedSet_ComparableRawMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_s, created) ;
		}
		// D(X) main:8--9
		matchedEntry.event_add(s, e);

		if ((cachehit == false) ) {
			SortedSet_Comparable_s_Map_cachekey_s = s;
			SortedSet_Comparable_s_Map_cachevalue = matchedEntry;
		}

		SortedSet_Comparable_RVMLock.unlock();
	}

	public static final void addallEvent(SortedSet s, Collection c) {
		SortedSet_Comparable_activated = true;
		while (!SortedSet_Comparable_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_s = null;
		MapOfMonitor<SortedSet_ComparableRawMonitor> matchedLastMap = null;
		SortedSet_ComparableRawMonitor matchedEntry = null;
		boolean cachehit = false;
		if ((s == SortedSet_Comparable_s_Map_cachekey_s) ) {
			matchedEntry = SortedSet_Comparable_s_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_s = new CachedWeakReference(s) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<SortedSet_ComparableRawMonitor> itmdMap = SortedSet_Comparable_s_Map;
				matchedLastMap = itmdMap;
				SortedSet_ComparableRawMonitor node_s = SortedSet_Comparable_s_Map.getNodeEquivalent(wr_s) ;
				matchedEntry = node_s;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_s == null) ) {
				wr_s = new CachedWeakReference(s) ;
			}
			// D(X) main:4
			SortedSet_ComparableRawMonitor created = new SortedSet_ComparableRawMonitor() ;
			matchedEntry = created;
			matchedLastMap.putNode(wr_s, created) ;
		}
		// D(X) main:8--9
		matchedEntry.event_addall(s, c);

		if ((cachehit == false) ) {
			SortedSet_Comparable_s_Map_cachekey_s = s;
			SortedSet_Comparable_s_Map_cachevalue = matchedEntry;
		}

		SortedSet_Comparable_RVMLock.unlock();
	}

}
