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

final class myEnforceEnforcementMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<myEnforceEnforcementMonitor> {

	myEnforceEnforcementMonitor_Set(){
		this.size = 0;
		this.elements = new myEnforceEnforcementMonitor[4];
	}
	final void event_one() {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			myEnforceEnforcementMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				try {
					do {
						myEnforceEnforcementMonitor clonedMonitor = (myEnforceEnforcementMonitor)monitor.clone();
						boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_one();
						if (!cloned_monitor_condition_satisfied) {
							break;
						}
						if (!clonedMonitor.Prop_1_Category_fail) {
							myEnforceRuntimeMonitor.myEnforce_RVMLock_cond.await();
						}
						else {
							break;
						}
					} while (true);

				} catch (Exception e) {
					e.printStackTrace();
				}
				final myEnforceEnforcementMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_one();
				myEnforceRuntimeMonitor.myEnforce_RVMLock_cond.signalAll();
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
	final void event_two() {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			myEnforceEnforcementMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				try {
					do {
						myEnforceEnforcementMonitor clonedMonitor = (myEnforceEnforcementMonitor)monitor.clone();
						boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_two();
						if (!cloned_monitor_condition_satisfied) {
							break;
						}
						if (!clonedMonitor.Prop_1_Category_fail) {
							myEnforceRuntimeMonitor.myEnforce_RVMLock_cond.await();
						}
						else {
							break;
						}
					} while (true);

				} catch (Exception e) {
					e.printStackTrace();
				}
				final myEnforceEnforcementMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_two();
				myEnforceRuntimeMonitor.myEnforce_RVMLock_cond.signalAll();
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

class myEnforceEnforcementMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			myEnforceEnforcementMonitor ret = (myEnforceEnforcementMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	static final int Prop_1_transition_one[] = {2, 3, 3, 3};;
	static final int Prop_1_transition_two[] = {3, 3, 1, 3};;

	volatile boolean Prop_1_Category_fail = false;

	private final AtomicInteger pairValue;

	myEnforceEnforcementMonitor() {
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

	final boolean Prop_1_event_one() {
		{
			if ( ! (Thread.currentThread().getName().equals("Thread-1")) ) {
				return false;
			}
			{
				System.out.println("one");
			}
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_one) ;
		this.Prop_1_Category_fail = nextstate == 3;

		return true;
	}

	final boolean Prop_1_event_two() {
		{
			if ( ! (Thread.currentThread().getName().equals("Thread-2")) ) {
				return false;
			}
			{
				System.out.println("two");
			}
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_two) ;
		this.Prop_1_Category_fail = nextstate == 3;

		return true;
	}

	final void Prop_1_handler_fail (){
		{
			System.out.println("failed");
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		Prop_1_Category_fail = false;
	}

	static public class myEnforceEnforcementMonitorDeadlockCallback implements com.runtimeverification.rvmonitor.java.rt.RVMCallBack {
		public void apply() {

		}
	}

	@Override
	protected final void terminateInternal(int idnum) {
		int lastEvent = this.getLastEvent();

		switch(idnum){
		}
		switch(lastEvent) {
			case -1:
			return;
			case 0:
			//one
			return;
			case 1:
			//two
			return;
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

public final class myEnforceRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager myEnforceMapManager;
	static {
		Runtime.getRuntime().addShutdownHook( (new myEnforceRuntimeMonitor()).new myEnforce_DummyHookThread());
		myEnforceMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		myEnforceMapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock myEnforce_RVMLock = new ReentrantLock();
	static final Condition myEnforce_RVMLock_cond = myEnforce_RVMLock.newCondition();

	private static boolean myEnforce_activated = false;

	// Declarations for Indexing Trees
	private static final myEnforceEnforcementMonitor myEnforce__Map = new myEnforceEnforcementMonitor() ;

	public static int cleanUp() {
		int collected = 0;
		// indexing trees
		return collected;
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

	public static final void oneEvent() {
		myEnforce_activated = true;
		while (!myEnforce_RVMLock.tryLock()) {
			Thread.yield();
		}

		myEnforceEnforcementMonitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = myEnforce__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			myEnforceEnforcementMonitor created = new myEnforceEnforcementMonitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		try {
			do {
				myEnforceEnforcementMonitor clonedMonitor = (myEnforceEnforcementMonitor)matchedEntry.clone();
				boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_one();
				if (!cloned_monitor_condition_satisfied) {
					break;
				}
				if (!clonedMonitor.Prop_1_Category_fail) {
					myEnforceRuntimeMonitor.myEnforce_RVMLock_cond.await();
				}
				else {
					break;
				}
			} while (true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		final myEnforceEnforcementMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_one();
		myEnforceRuntimeMonitor.myEnforce_RVMLock_cond.signalAll();
		if(matchedEntryfinalMonitor.Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		myEnforce_RVMLock.unlock();
	}

	public static final void twoEvent() {
		myEnforce_activated = true;
		while (!myEnforce_RVMLock.tryLock()) {
			Thread.yield();
		}

		myEnforceEnforcementMonitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = myEnforce__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			myEnforceEnforcementMonitor created = new myEnforceEnforcementMonitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		try {
			do {
				myEnforceEnforcementMonitor clonedMonitor = (myEnforceEnforcementMonitor)matchedEntry.clone();
				boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_two();
				if (!cloned_monitor_condition_satisfied) {
					break;
				}
				if (!clonedMonitor.Prop_1_Category_fail) {
					myEnforceRuntimeMonitor.myEnforce_RVMLock_cond.await();
				}
				else {
					break;
				}
			} while (true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		final myEnforceEnforcementMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_two();
		myEnforceRuntimeMonitor.myEnforce_RVMLock_cond.signalAll();
		if(matchedEntryfinalMonitor.Prop_1_Category_fail) {
			matchedEntryfinalMonitor.Prop_1_handler_fail();
		}

		myEnforce_RVMLock.unlock();
	}

	static HashSet<Thread> myEnforce_ThreadMonitor_ThreadSet = new HashSet<Thread>();

	public static void startDeadlockDetection() {
		while (!myEnforce_RVMLock.tryLock()) {
			Thread.yield();
		}
		myEnforce_ThreadMonitor_ThreadSet.add(Thread.currentThread());
		myEnforce_RVMLock_cond.signalAll();
		myEnforce_RVMLock.unlock();
	}

	class myEnforce_DummyHookThread extends Thread {
		public void run(){
		}
	}
}
