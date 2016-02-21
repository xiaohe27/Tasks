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
				if(monitorfinalMonitor.Prop_1_Category_s2) {
					monitorfinalMonitor.Prop_1_handler_s2();
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
				if(monitorfinalMonitor.Prop_1_Category_s2) {
					monitorfinalMonitor.Prop_1_handler_s2();
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_c(String s) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			ABeforeBMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final ABeforeBMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_c(s);
				if(monitorfinalMonitor.Prop_1_Category_fail) {
					monitorfinalMonitor.Prop_1_handler_fail();
				}
				if(monitorfinalMonitor.Prop_1_Category_s2) {
					monitorfinalMonitor.Prop_1_handler_s2();
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

	WeakReference Ref_s = null;
	WeakReference Ref_i = null;
	int Prop_1_state;
	static final int Prop_1_transition_a[] = {3, 4, 4, 4, 4};;
	static final int Prop_1_transition_b[] = {2, 2, 4, 0, 4};;
	static final int Prop_1_transition_c[] = {1, 4, 4, 0, 4};;

	boolean Prop_1_Category_fail = false;
	boolean Prop_1_Category_s2 = false;

	ABeforeBMonitor(long tau, CachedWeakReference RVMRef_s, CachedWeakReference RVMRef_i) {
		this.tau = tau;
		Prop_1_state = 0;

		this.RVMRef_s = RVMRef_s;
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

	final boolean Prop_1_event_a(String s, Integer i) {
		{}
		if(Ref_s == null){
			Ref_s = new WeakReference(s);
		}
		if(Ref_i == null){
			Ref_i = new WeakReference(i);
		}
		RVM_lastevent = 0;

		Prop_1_state = Prop_1_transition_a[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 4;
		Prop_1_Category_s2 = Prop_1_state == 2;
		return true;
	}

	final boolean Prop_1_event_b(Integer i) {
		String s = null;
		if(Ref_s != null){
			s = (String)Ref_s.get();
		}
		{}
		if(Ref_i == null){
			Ref_i = new WeakReference(i);
		}
		RVM_lastevent = 1;

		Prop_1_state = Prop_1_transition_b[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 4;
		Prop_1_Category_s2 = Prop_1_state == 2;
		return true;
	}

	final boolean Prop_1_event_c(String s) {
		Integer i = null;
		if(Ref_i != null){
			i = (Integer)Ref_i.get();
		}
		{}
		if(Ref_s == null){
			Ref_s = new WeakReference(s);
		}
		RVM_lastevent = 2;

		Prop_1_state = Prop_1_transition_c[Prop_1_state];
		Prop_1_Category_fail = Prop_1_state == 4;
		Prop_1_Category_s2 = Prop_1_state == 2;
		return true;
	}

	final void Prop_1_handler_fail (){
		{
			System.err.println("Fail!");
		}

	}

	final void Prop_1_handler_s2 (){
		{
			System.out.println("pattern ");
		}

	}

	final void reset() {
		RVM_lastevent = -1;
		Prop_1_state = 0;
		Prop_1_Category_fail = false;
		Prop_1_Category_s2 = false;
	}

	CachedWeakReference RVMRef_s;
	CachedWeakReference RVMRef_i;

	//alive_parameters_0 = [String s]
	boolean alive_parameters_0 = true;
	//alive_parameters_1 = [Integer i]
	boolean alive_parameters_1 = true;

	@Override
	protected final void terminateInternal(int idnum) {
		switch(idnum){
			case 0:
			alive_parameters_0 = false;
			break;
			case 1:
			alive_parameters_1 = false;
			break;
		}
		switch(RVM_lastevent) {
			case -1:
			return;
			case 0:
			//a
			//alive_s || alive_i
			if(!(alive_parameters_0 || alive_parameters_1)){
				RVM_terminated = true;
				return;
			}
			break;

			case 1:
			//b
			//alive_s || alive_i
			if(!(alive_parameters_0 || alive_parameters_1)){
				RVM_terminated = true;
				return;
			}
			break;

			case 2:
			//c
			//alive_s || alive_i
			if(!(alive_parameters_0 || alive_parameters_1)){
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
	private static Object ABeforeB_s_Map_cachekey_s;
	private static Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> ABeforeB_s_Map_cachevalue;
	private static Object ABeforeB_s_i_Map_cachekey_i;
	private static Object ABeforeB_s_i_Map_cachekey_s;
	private static ABeforeBMonitor ABeforeB_s_i_Map_cachevalue;
	private static final MapOfSetMonitor<ABeforeBMonitor_Set, ABeforeBMonitor> ABeforeB_i_Map = new MapOfSetMonitor<ABeforeBMonitor_Set, ABeforeBMonitor>(1) ;
	private static final MapOfAll<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> ABeforeB_s_i_Map = new MapOfAll<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor>(0) ;
	private static final Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor> ABeforeB___To__s_Map = new Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor>(new ABeforeBMonitor_Set() , null) ;
	private static final Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor> ABeforeB___To__i_Map = new Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor>(new ABeforeBMonitor_Set() , null) ;

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
				Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
				if ((node_s == null) ) {
					node_s = new Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor>() ;
					ABeforeB_s_i_Map.putNode(wr_s, node_s) ;
					node_s.setValue1(new MapOfMonitor<ABeforeBMonitor>(1) ) ;
					node_s.setValue2(new ABeforeBMonitor_Set() ) ;
				}
				MapOfMonitor<ABeforeBMonitor> itmdMap = node_s.getValue1() ;
				matchedLastMap = itmdMap;
				ABeforeBMonitor node_s_i = node_s.getValue1() .getNodeEquivalent(wr_i) ;
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
					// D(X) defineTo:1--5 for <s>
					if (definable) {
						// FindCode
						Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
						if ((node_s != null) ) {
							ABeforeBMonitor itmdLeaf = node_s.getValue3() ;
							if ((itmdLeaf != null) ) {
								if (((itmdLeaf.getDisable() > sourceLeaf.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceLeaf.getTau() ) ) ) ) {
									definable = false;
								}
							}
						}
					}
					// D(X) defineTo:1--5 for <s, i>
					if (definable) {
						// FindCode
						Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
						if ((node_s != null) ) {
							ABeforeBMonitor node_s_i = node_s.getValue1() .getNodeEquivalent(wr_i) ;
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
						created.RVMRef_s = wr_s;
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
						// D(X) defineTo:7 for <s>
						{
							// InsertMonitor
							Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
							if ((node_s == null) ) {
								node_s = new Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor>() ;
								ABeforeB_s_i_Map.putNode(wr_s, node_s) ;
								node_s.setValue1(new MapOfMonitor<ABeforeBMonitor>(1) ) ;
								node_s.setValue2(new ABeforeBMonitor_Set() ) ;
							}
							ABeforeBMonitor_Set targetSet = node_s.getValue2() ;
							targetSet.add(created) ;
						}
					}
				}
			}
			{
				// D(X) createNewMonitorStates:4 when Dom(theta'') = <s>
				ABeforeBMonitor sourceLeaf = null;
				{
					// FindCode
					Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
					if ((node_s != null) ) {
						ABeforeBMonitor itmdLeaf = node_s.getValue3() ;
						sourceLeaf = itmdLeaf;
					}
				}
				if ((sourceLeaf != null) ) {
					boolean definable = true;
					// D(X) defineTo:1--5 for <i>
					if (definable) {
						// FindCode
						Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor> node_i = ABeforeB_i_Map.getNodeEquivalent(wr_i) ;
						if ((node_i != null) ) {
							ABeforeBMonitor itmdLeaf = node_i.getValue2() ;
							if ((itmdLeaf != null) ) {
								if (((itmdLeaf.getDisable() > sourceLeaf.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceLeaf.getTau() ) ) ) ) {
									definable = false;
								}
							}
						}
					}
					// D(X) defineTo:1--5 for <s, i>
					if (definable) {
						// FindCode
						Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
						if ((node_s != null) ) {
							ABeforeBMonitor node_s_i = node_s.getValue1() .getNodeEquivalent(wr_i) ;
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
						created.RVMRef_i = wr_i;
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
						// D(X) defineTo:7 for <s>
						{
							// InsertMonitor
							Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
							if ((node_s == null) ) {
								node_s = new Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor>() ;
								ABeforeB_s_i_Map.putNode(wr_s, node_s) ;
								node_s.setValue1(new MapOfMonitor<ABeforeBMonitor>(1) ) ;
								node_s.setValue2(new ABeforeBMonitor_Set() ) ;
							}
							ABeforeBMonitor_Set targetSet = node_s.getValue2() ;
							targetSet.add(created) ;
						}
					}
				}
			}
			if ((matchedEntry == null) ) {
				// D(X) main:4
				ABeforeBMonitor created = new ABeforeBMonitor(ABeforeB_timestamp++, wr_s, wr_i) ;
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
				// D(X) defineNew:5 for <s>
				{
					// InsertMonitor
					Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
					if ((node_s == null) ) {
						node_s = new Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor>() ;
						ABeforeB_s_i_Map.putNode(wr_s, node_s) ;
						node_s.setValue1(new MapOfMonitor<ABeforeBMonitor>(1) ) ;
						node_s.setValue2(new ABeforeBMonitor_Set() ) ;
					}
					ABeforeBMonitor_Set targetSet = node_s.getValue2() ;
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
		if(matchedEntryfinalMonitor.Prop_1_Category_s2) {
			matchedEntryfinalMonitor.Prop_1_handler_s2();
		}

		if ((cachehit == false) ) {
			ABeforeB_s_i_Map_cachekey_i = i;
			ABeforeB_s_i_Map_cachekey_s = s;
			ABeforeB_s_i_Map_cachevalue = matchedEntry;
		}

		ABeforeB_RVMLock.unlock();
	}

	public static final void bEvent(Integer i) {
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
			{
				// D(X) createNewMonitorStates:4 when Dom(theta'') = <>
				ABeforeBMonitor_Set sourceSet = null;
				{
					// FindCode
					ABeforeBMonitor_Set itmdSet = ABeforeB___To__s_Map.getValue1() ;
					sourceSet = itmdSet;
				}
				if ((sourceSet != null) ) {
					int numalive = 0;
					int setlen = sourceSet.getSize() ;
					for (int ielem = 0; (ielem < setlen) ;++ielem) {
						ABeforeBMonitor sourceMonitor = sourceSet.get(ielem) ;
						if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_s.get() != null) ) ) {
							sourceSet.set(numalive++, sourceMonitor) ;
							CachedWeakReference wr_s = sourceMonitor.RVMRef_s;
							MapOfMonitor<ABeforeBMonitor> destLastMap = null;
							ABeforeBMonitor destLeaf = null;
							{
								// FindOrCreate
								Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
								if ((node_s == null) ) {
									node_s = new Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor>() ;
									ABeforeB_s_i_Map.putNode(wr_s, node_s) ;
									node_s.setValue1(new MapOfMonitor<ABeforeBMonitor>(1) ) ;
									node_s.setValue2(new ABeforeBMonitor_Set() ) ;
								}
								MapOfMonitor<ABeforeBMonitor> itmdMap = node_s.getValue1() ;
								destLastMap = itmdMap;
								ABeforeBMonitor node_s_i = node_s.getValue1() .getNodeEquivalent(wr_i) ;
								destLeaf = node_s_i;
							}
							if ((destLeaf == null) ) {
								boolean definable = true;
								// D(X) defineTo:1--5 for <i>
								if (definable) {
									// FindCode
									Tuple2<ABeforeBMonitor_Set, ABeforeBMonitor> node_i = ABeforeB_i_Map.getNodeEquivalent(wr_i) ;
									if ((node_i != null) ) {
										ABeforeBMonitor itmdLeaf = node_i.getValue2() ;
										if ((itmdLeaf != null) ) {
											if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
												definable = false;
											}
										}
									}
								}
								// D(X) defineTo:1--5 for <s, i>
								if (definable) {
									// FindCode
									Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
									if ((node_s != null) ) {
										ABeforeBMonitor node_s_i = node_s.getValue1() .getNodeEquivalent(wr_i) ;
										if ((node_s_i != null) ) {
											if (((node_s_i.getDisable() > sourceMonitor.getTau() ) || ((node_s_i.getTau() > 0) && (node_s_i.getTau() < sourceMonitor.getTau() ) ) ) ) {
												definable = false;
											}
										}
									}
								}
								if (definable) {
									// D(X) defineTo:6
									ABeforeBMonitor created = (ABeforeBMonitor)sourceMonitor.clone() ;
									created.RVMRef_i = wr_i;
									destLastMap.putNode(wr_i, created) ;
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
									// D(X) defineTo:7 for <s>
									{
										// InsertMonitor
										Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
										if ((node_s == null) ) {
											node_s = new Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor>() ;
											ABeforeB_s_i_Map.putNode(wr_s, node_s) ;
											node_s.setValue1(new MapOfMonitor<ABeforeBMonitor>(1) ) ;
											node_s.setValue2(new ABeforeBMonitor_Set() ) ;
										}
										ABeforeBMonitor_Set targetSet = node_s.getValue2() ;
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
				ABeforeBMonitor created = new ABeforeBMonitor(ABeforeB_timestamp++, null, wr_i) ;
				matchedEntry.setValue2(created) ;
				ABeforeBMonitor_Set enclosingSet = matchedEntry.getValue1() ;
				enclosingSet.add(created) ;
				// D(X) defineNew:5 for <-i>
				{
					// InsertMonitor
					ABeforeBMonitor_Set targetSet = ABeforeB___To__i_Map.getValue1() ;
					targetSet.add(created) ;
				}
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

	public static final void cEvent(String s) {
		ABeforeB_activated = true;
		while (!ABeforeB_RVMLock.tryLock()) {
			Thread.yield();
		}

		CachedWeakReference wr_s = null;
		Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> matchedEntry = null;
		boolean cachehit = false;
		if ((s == ABeforeB_s_Map_cachekey_s) ) {
			matchedEntry = ABeforeB_s_Map_cachevalue;
			cachehit = true;
		}
		else {
			wr_s = new CachedWeakReference(s) ;
			{
				// FindOrCreateEntry
				Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
				if ((node_s == null) ) {
					node_s = new Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor>() ;
					ABeforeB_s_i_Map.putNode(wr_s, node_s) ;
					node_s.setValue1(new MapOfMonitor<ABeforeBMonitor>(1) ) ;
					node_s.setValue2(new ABeforeBMonitor_Set() ) ;
				}
				matchedEntry = node_s;
			}
		}
		// D(X) main:1
		ABeforeBMonitor matchedLeaf = matchedEntry.getValue3() ;
		if ((matchedLeaf == null) ) {
			if ((wr_s == null) ) {
				wr_s = new CachedWeakReference(s) ;
			}
			{
				// D(X) createNewMonitorStates:4 when Dom(theta'') = <>
				ABeforeBMonitor_Set sourceSet = null;
				{
					// FindCode
					ABeforeBMonitor_Set itmdSet = ABeforeB___To__i_Map.getValue1() ;
					sourceSet = itmdSet;
				}
				if ((sourceSet != null) ) {
					int numalive = 0;
					int setlen = sourceSet.getSize() ;
					for (int ielem = 0; (ielem < setlen) ;++ielem) {
						ABeforeBMonitor sourceMonitor = sourceSet.get(ielem) ;
						if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_i.get() != null) ) ) {
							sourceSet.set(numalive++, sourceMonitor) ;
							CachedWeakReference wr_i = sourceMonitor.RVMRef_i;
							MapOfMonitor<ABeforeBMonitor> destLastMap = null;
							ABeforeBMonitor destLeaf = null;
							{
								// FindOrCreate
								Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
								if ((node_s == null) ) {
									node_s = new Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor>() ;
									ABeforeB_s_i_Map.putNode(wr_s, node_s) ;
									node_s.setValue1(new MapOfMonitor<ABeforeBMonitor>(1) ) ;
									node_s.setValue2(new ABeforeBMonitor_Set() ) ;
								}
								MapOfMonitor<ABeforeBMonitor> itmdMap = node_s.getValue1() ;
								destLastMap = itmdMap;
								ABeforeBMonitor node_s_i = node_s.getValue1() .getNodeEquivalent(wr_i) ;
								destLeaf = node_s_i;
							}
							if ((destLeaf == null) ) {
								boolean definable = true;
								// D(X) defineTo:1--5 for <s>
								if (definable) {
									// FindCode
									Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
									if ((node_s != null) ) {
										ABeforeBMonitor itmdLeaf = node_s.getValue3() ;
										if ((itmdLeaf != null) ) {
											if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
												definable = false;
											}
										}
									}
								}
								// D(X) defineTo:1--5 for <s, i>
								if (definable) {
									// FindCode
									Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
									if ((node_s != null) ) {
										ABeforeBMonitor node_s_i = node_s.getValue1() .getNodeEquivalent(wr_i) ;
										if ((node_s_i != null) ) {
											if (((node_s_i.getDisable() > sourceMonitor.getTau() ) || ((node_s_i.getTau() > 0) && (node_s_i.getTau() < sourceMonitor.getTau() ) ) ) ) {
												definable = false;
											}
										}
									}
								}
								if (definable) {
									// D(X) defineTo:6
									ABeforeBMonitor created = (ABeforeBMonitor)sourceMonitor.clone() ;
									created.RVMRef_s = wr_s;
									destLastMap.putNode(wr_i, created) ;
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
									// D(X) defineTo:7 for <s>
									{
										// InsertMonitor
										Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor> node_s = ABeforeB_s_i_Map.getNodeEquivalent(wr_s) ;
										if ((node_s == null) ) {
											node_s = new Tuple3<MapOfMonitor<ABeforeBMonitor>, ABeforeBMonitor_Set, ABeforeBMonitor>() ;
											ABeforeB_s_i_Map.putNode(wr_s, node_s) ;
											node_s.setValue1(new MapOfMonitor<ABeforeBMonitor>(1) ) ;
											node_s.setValue2(new ABeforeBMonitor_Set() ) ;
										}
										ABeforeBMonitor_Set targetSet = node_s.getValue2() ;
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
				ABeforeBMonitor created = new ABeforeBMonitor(ABeforeB_timestamp++, wr_s, null) ;
				matchedEntry.setValue3(created) ;
				ABeforeBMonitor_Set enclosingSet = matchedEntry.getValue2() ;
				enclosingSet.add(created) ;
				// D(X) defineNew:5 for <-s>
				{
					// InsertMonitor
					ABeforeBMonitor_Set targetSet = ABeforeB___To__s_Map.getValue1() ;
					targetSet.add(created) ;
				}
			}
			// D(X) main:6
			ABeforeBMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
			disableUpdatedLeaf.setDisable(ABeforeB_timestamp++) ;
		}
		// D(X) main:8--9
		ABeforeBMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
		stateTransitionedSet.event_c(s);

		if ((cachehit == false) ) {
			ABeforeB_s_Map_cachekey_s = s;
			ABeforeB_s_Map_cachevalue = matchedEntry;
		}

		ABeforeB_RVMLock.unlock();
	}

}
