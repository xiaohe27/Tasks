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

final class ABeforeBMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<ABeforeBMonitor> {

	ABeforeBMonitor_Set(){
		this.size = 0;
		this.elements = new ABeforeBMonitor[4];
	}
	final void event_a(String s, Integer i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ABeforeBMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ABeforeBMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_a(s, i);
				if(monitorfinalMonitor.Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_b(Integer i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ABeforeBMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ABeforeBMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_b(i);
				if(monitorfinalMonitor.Prop_1_Category_fail) {
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

interface IABeforeBMonitor extends IMonitor, IDisableHolder {
}

class ABeforeBDisableHolder extends DisableHolder implements IABeforeBMonitor {
	ABeforeBDisableHolder(long tau) {
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

class ABeforeBMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, IABeforeBMonitor {
	protected Object clone() {
		try {
			ABeforeBMonitor ret = (ABeforeBMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	//event a(String s) {}

	//event b(Integer i) {}

	WeakReference Ref_s = null;
	int Prop_1_state;
	static final int Prop_1_transition_a[] = {2, 3, 2, 3};;
	static final int Prop_1_transition_b[] = {1, 3, 2, 3};;

	boolean Prop_1_Category_fail = false;

	ABeforeBMonitor(long tau) {
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

	final boolean Prop_1_event_a(String s, Integer i) {
		{}
		if(Ref_s == null){
			Ref_s = new WeakReference(s);
		}
		RVM_lastevent = 0;

		Prop_1_state = Prop_1_transition_a[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 3;
		return true;
	}

	final boolean Prop_1_event_b(Integer i) {
		String s = null;
		if(Ref_s != null){
			s = (String)Ref_s.get();
		}
		{}
		RVM_lastevent = 1;

		Prop_1_state = Prop_1_transition_b[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 3;
		return true;
	}

	final void Prop_1_handler_fail (){
		{
			System.out.println("a should happen before b");
		}

	}

	final void reset() {
		RVM_lastevent = -1;
		Prop_1_state = 0;
		Prop_1_Category_fail = false;
	}

	// RVMRef_s was suppressed to reduce memory overhead
	// RVMRef_i was suppressed to reduce memory overhead

	//alive_parameters_0 = [Integer i]
	boolean alive_parameters_0 = true;

	@Override
	protected final void terminateInternal(int idnum) {
		switch(idnum){
			case 0:
			break;
			case 1:
			alive_parameters_0 = false;
			break;
		}
		switch(RVM_lastevent) {
			case -1:
			return;
			case 0:
			//a
			//alive_i
			if(!(alive_parameters_0)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//b
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
		return 2;
	}

	public static int getNumberOfStates() {
		return 4;
	}

}

public final class ABeforeBRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager ABeforeBMapManager;
	static {
		ABeforeBMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		ABeforeBMapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock ABeforeB_RVMLock = new ReentrantLock();
	static final Condition ABeforeB_RVMLock_cond = ABeforeB_RVMLock.newCondition();

	// Declarations for Timestamps
	private static long ABeforeB_timestamp = 1;

	private static boolean ABeforeB_activated = false;

	// Declarations for Indexing Trees
	private static Object ABeforeB_i_Map_cachekey_i;
	private static Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor> ABeforeB_i_Map_cachevalue;
	private static Object ABeforeB_s_i_Map_cachekey_i;
	private static Object ABeforeB_s_i_Map_cachekey_s;
	private static ABeforeBMonitor ABeforeB_s_i_Map_cachevalue;
	private static final MapOfSetMonitor<ABeforeBMonitor_Set, ABeforeBMonitor> ABeforeB_i_Map = new MapOfSetMonitor<ABeforeBMonitor_Set, ABeforeBMonitor>(1) ;
	private static final MapOfMap<MapOfMonitor<ABeforeBMonitor>> ABeforeB_s_i_Map = new MapOfMap<MapOfMonitor<ABeforeBMonitor>>(0) ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		collected += ABeforeB_i_Map.cleanUpUnnecessaryMappings();
		collected += ABeforeB_s_i_Map.cleanUpUnnecessaryMappings();
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

	public static final void aEvent(String s, Integer i) {
System.out.println("a occurs str:" + s +", " + i);
		ABeforeB_activated = true;
		while (!ABeforeB_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_s = null;
		CachedWeakReference wr_i = null;
		MapOfMonitor<ABeforeBMonitor> matchedLastMap = null;
		ABeforeBMonitor matchedEntry = null;
		boolean cachehit = false;
		if (((i == ABeforeB_s_i_Map_cachekey_i) && (s == ABeforeB_s_i_Map_cachekey_s) ) ) {
			matchedEntry = ABeforeB_s_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_s = new CachedWeakReference(s) ;
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				MapOfMonitor<ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
				if ((node_s == null) ) {
					node_s = new MapOfMonitor<ABeforeBMonitor>(1) ;
					ABeforeB_s_i_Map.putNode(wr_s, node_s) ;
				}
				matchedLastMap = node_s;
				ABeforeBMonitor node_s_i = node_s.getNodeEquivalent(wr_i) ;
				matchedEntry = node_s_i;
			}
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			if ((wr_s == null) ) {
				wr_s = new CachedWeakReference(s) ;
			}
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			{
				// D(X) createNewMonitorStates:4 when Dom(theta'') = <i>
				ABeforeBMonitor sourceLeaf = null;
				{
					// FindCode
					Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor> node_i = ABeforeB_i_Map.getNodeEquivalent(wr_i) ;
					if ((node_i != null) ) {
						ABeforeBMonitor itmdLeaf = node_i.getValue2() ;
						sourceLeaf = itmdLeaf;
					}
				}
				if ((sourceLeaf != null) ) {
					boolean definable = true;
					// D(X) defineTo:1--5 for <s, i>
					if (definable) {
						// FindCode
						MapOfMonitor<ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
						if ((node_s != null) ) {
							ABeforeBMonitor node_s_i = node_s.getNodeEquivalent(wr_i) ;
							if ((node_s_i != null) ) {
								if (((node_s_i.getDisable() > sourceLeaf.getTau() ) || ((node_s_i.getTau() > 0) && (node_s_i.getTau() < sourceLeaf.getTau() ) ) ) ) {
									definable = false;
								}
							}
						}
					}
					if (definable) {
						// D(X) defineTo:6
						ABeforeBMonitor created = (ABeforeBMonitor)sourceLeaf.clone() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_i, created) ;
						// D(X) defineTo:7 for <i>
						{
							// InsertMonitor
							Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor> node_i = ABeforeB_i_Map.getNodeEquivalent(wr_i) ;
							if ((node_i == null) ) {
								node_i = new Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor>() ;
								ABeforeB_i_Map.putNode(wr_i, node_i) ;
								node_i.setValue1(new ABeforeBMonitor_Set() ) ;
							}
							ABeforeBMonitor_Set targetSet = node_i.getValue1() ;
							targetSet.add(created) ;
						}
					}
				}
			}
			if ((matchedEntry == null) ) {
				// D(X) main:4
				ABeforeBMonitor created = new ABeforeBMonitor(ABeforeB_timestamp++) ;

System.out.println("event a created. str:" + s +", " + i);

				matchedEntry = created;
				matchedLastMap.putNode(wr_i, created) ;
				// D(X) defineNew:5 for <i>
				{
					// InsertMonitor
					Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor> node_i = ABeforeB_i_Map.getNodeEquivalent(wr_i) ;
					if ((node_i == null) ) {
						node_i = new Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor>() ;
						ABeforeB_i_Map.putNode(wr_i, node_i) ;
						node_i.setValue1(new ABeforeBMonitor_Set() ) ;
					}
					ABeforeBMonitor_Set targetSet = node_i.getValue1() ;
					targetSet.add(created) ;
				}
			}
			// D(X) main:6
			matchedEntry.setDisable(ABeforeB_timestamp++) ;
		}
		// D(X) main:8--9
		final ABeforeBMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_a(s, i);
		if(matchedEntryfinalMonitor.Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		if ((cachehit == false) ) {
			ABeforeB_s_i_Map_cachekey_i = i;
			ABeforeB_s_i_Map_cachekey_s = s;
			ABeforeB_s_i_Map_cachevalue = matchedEntry;
		}

		ABeforeB_RVMLock.unlock();
	}

	public static final void bEvent(Integer i) {
System.out.println("b occurs " + i);
		ABeforeB_activated = true;
		while (!ABeforeB_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_i = null;
		Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor> matchedEntry = null;
		boolean cachehit = false;
		if ((i == ABeforeB_i_Map_cachekey_i) ) {
			matchedEntry = ABeforeB_i_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_i = new CachedWeakReference(i) ;
			{
				// FindOrCreateEntry
				Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor> node_i = ABeforeB_i_Map.getNodeEquivalent(wr_i) ;
				if ((node_i == null) ) {
					node_i = new Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor>() ;
					ABeforeB_i_Map.putNode(wr_i, node_i) ;
					node_i.setValue1(new ABeforeBMonitor_Set() ) ;
				}
				matchedEntry = node_i;
			}
		}
		// D(X) main:1
		ABeforeBMonitor matchedLeaf = matchedEntry.getValue2() ;
		if ((matchedLeaf == null) ) {
			if ((wr_i == null) ) {
				wr_i = new CachedWeakReference(i) ;
			}
			if ((matchedLeaf == null) ) {
				// D(X) main:4
				ABeforeBMonitor created = new ABeforeBMonitor(ABeforeB_timestamp++) ;
System.out.println("monitor with index b created " + i);
				matchedEntry.setValue2(created) ;
				ABeforeBMonitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
			}
			// D(X) main:6
			ABeforeBMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
			disableUpdatedLeaf.setDisable(ABeforeB_timestamp++) ;
		}
		// D(X) main:8--9
		ABeforeBMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
		stateTransitionedSet.event_b(i);

		if ((cachehit == false) ) {
			ABeforeB_i_Map_cachekey_i = i;
			ABeforeB_i_Map_cachevalue = matchedEntry;
		}

		ABeforeB_RVMLock.unlock();
	}

}
