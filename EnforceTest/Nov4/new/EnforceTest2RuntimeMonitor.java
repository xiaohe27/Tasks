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

final class EnforceTest2EnforcementMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<EnforceTest2EnforcementMonitor> {

	EnforceTest2EnforcementMonitor_Set(){
		this.size = 0;
		this.elements = new EnforceTest2EnforcementMonitor[4];
	}
	final void event_oneBegin() {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			EnforceTest2EnforcementMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				try {
					do {
						EnforceTest2EnforcementMonitor clonedMonitor = (EnforceTest2EnforcementMonitor)monitor.clone();
						boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_oneBegin();
						if (!cloned_monitor_condition_satisfied) {
							break;
						}
						if (!clonedMonitor.Prop_1_Category_nonfail) {
							EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.await();
						}
						else {
							break;
						}
					} while (true);

				} catch (Exception e) {
					e.printStackTrace();
				}
				final EnforceTest2EnforcementMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_oneBegin();
				EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.signalAll();
				if(monitorfinalMonitor.Prop_1_Category_nonfail) {
					monitorfinalMonitor.Prop_1_handler_nonfail();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_oneEnd() {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			EnforceTest2EnforcementMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				try {
					do {
						EnforceTest2EnforcementMonitor clonedMonitor = (EnforceTest2EnforcementMonitor)monitor.clone();
						boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_oneEnd();
						if (!cloned_monitor_condition_satisfied) {
							break;
						}
						if (!clonedMonitor.Prop_1_Category_nonfail) {
							EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.await();
						}
						else {
							break;
						}
					} while (true);

				} catch (Exception e) {
					e.printStackTrace();
				}
				final EnforceTest2EnforcementMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_oneEnd();
				EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.signalAll();
				if(monitorfinalMonitor.Prop_1_Category_nonfail) {
					monitorfinalMonitor.Prop_1_handler_nonfail();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_twoBegin() {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			EnforceTest2EnforcementMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				try {
					do {
						EnforceTest2EnforcementMonitor clonedMonitor = (EnforceTest2EnforcementMonitor)monitor.clone();
						boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_twoBegin();
						if (!cloned_monitor_condition_satisfied) {
							break;
						}
						if (!clonedMonitor.Prop_1_Category_nonfail) {
							EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.await();
						}
						else {
							break;
						}
					} while (true);

				} catch (Exception e) {
					e.printStackTrace();
				}
				final EnforceTest2EnforcementMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_twoBegin();
				EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.signalAll();
				if(monitorfinalMonitor.Prop_1_Category_nonfail) {
					monitorfinalMonitor.Prop_1_handler_nonfail();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_twoEnd() {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			EnforceTest2EnforcementMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				try {
					do {
						EnforceTest2EnforcementMonitor clonedMonitor = (EnforceTest2EnforcementMonitor)monitor.clone();
						boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_twoEnd();
						if (!cloned_monitor_condition_satisfied) {
							break;
						}
						if (!clonedMonitor.Prop_1_Category_nonfail) {
							EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.await();
						}
						else {
							break;
						}
					} while (true);

				} catch (Exception e) {
					e.printStackTrace();
				}
				final EnforceTest2EnforcementMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_twoEnd();
				EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.signalAll();
				if(monitorfinalMonitor.Prop_1_Category_nonfail) {
					monitorfinalMonitor.Prop_1_handler_nonfail();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
}

class EnforceTest2EnforcementMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			EnforceTest2EnforcementMonitor ret = (EnforceTest2EnforcementMonitor) super.clone();
			ret.pairValue = new AtomicInteger(pairValue.get());
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	static final int Prop_1_transition_oneBegin[] = {5, 5, 5, 4, 5, 5};;
	static final int Prop_1_transition_oneEnd[] = {5, 5, 5, 5, 2, 5};;
	static final int Prop_1_transition_twoBegin[] = {1, 5, 5, 5, 5, 5};;
	static final int Prop_1_transition_twoEnd[] = {5, 3, 5, 5, 5, 5};;

	volatile boolean Prop_1_Category_nonfail = false;

	private AtomicInteger pairValue;

	EnforceTest2EnforcementMonitor() {
		this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;

	}

	@Override public final int getState() {
		return this.getState(this.pairValue.get() ) ;
	}
	@Override public final int getLastEvent() {
		return this.getLastEvent(this.pairValue.get() ) ;
	}
	private final int getState(int pairValue) {
		return (pairValue & 7) ;
	}
	private final int getLastEvent(int pairValue) {
		return (pairValue >> 3) ;
	}
	private final int calculatePairValue(int lastEvent, int state) {
		return (((lastEvent + 1) << 3) | state) ;
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

	final boolean Prop_1_event_oneBegin() {
		{
			if ( ! (Thread.currentThread().getName().equals("T1")) ) {
				return false;
			}
			{
			}
		}

		int nextstate = this.handleEvent(0, Prop_1_transition_oneBegin) ;
		this.Prop_1_Category_nonfail = nextstate != 5;

		return true;
	}

	final boolean Prop_1_event_oneEnd() {
		{
			if ( ! (Thread.currentThread().getName().equals("T1")) ) {
				return false;
			}
			{
				System.out.println("1 end");
			}
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_oneEnd) ;
		this.Prop_1_Category_nonfail = nextstate != 5;

		return true;
	}

	final boolean Prop_1_event_twoBegin() {
		{
			if ( ! (Thread.currentThread().getName().equals("T2")) ) {
				return false;
			}
			{
			}
		}

		int nextstate = this.handleEvent(2, Prop_1_transition_twoBegin) ;
		this.Prop_1_Category_nonfail = nextstate != 5;

		return true;
	}

	final boolean Prop_1_event_twoEnd() {
		{
			if ( ! (Thread.currentThread().getName().equals("T2")) ) {
				return false;
			}
			{
				System.out.println("2 end");
			}
		}

		int nextstate = this.handleEvent(3, Prop_1_transition_twoEnd) ;
		this.Prop_1_Category_nonfail = nextstate != 5;

		return true;
	}

	final void Prop_1_handler_nonfail (){
		{
			System.out.println("success!");
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		Prop_1_Category_nonfail = false;
	}

	static public class EnforceTest2EnforcementMonitorDeadlockCallback implements com.runtimeverification.rvmonitor.java.rt.RVMCallBack {
		public void apply() {
			{
				System.out.println("deadlock!");
			}
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
			//oneBegin
			return;
			case 1:
			//oneEnd
			return;
			case 2:
			//twoBegin
			return;
			case 3:
			//twoEnd
			return;
		}
		return;
	}

	public static int getNumberOfEvents() {
		return 4;
	}

	public static int getNumberOfStates() {
		return 6;
	}

}

public final class EnforceTest2RuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager EnforceTest2MapManager;
	static {
		Runtime.getRuntime().addShutdownHook( (new EnforceTest2RuntimeMonitor()).new EnforceTest2_DummyHookThread());
		EnforceTest2MapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		EnforceTest2MapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock EnforceTest2_RVMLock = new ReentrantLock();
	static final Condition EnforceTest2_RVMLock_cond = EnforceTest2_RVMLock.newCondition();

	private static boolean EnforceTest2_activated = false;

	// Declarations for Indexing Trees
	private static final EnforceTest2EnforcementMonitor EnforceTest2__Map = new EnforceTest2EnforcementMonitor() ;

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
	}

	public static final void oneBeginEvent() {
		EnforceTest2_activated = true;
		while (!EnforceTest2_RVMLock.tryLock()) {
			Thread.yield();
		}

		EnforceTest2EnforcementMonitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = EnforceTest2__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			EnforceTest2EnforcementMonitor created = new EnforceTest2EnforcementMonitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		try {
			do {
				EnforceTest2EnforcementMonitor clonedMonitor = (EnforceTest2EnforcementMonitor)matchedEntry.clone();
				boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_oneBegin();
				if (!cloned_monitor_condition_satisfied) {
					break;
				}
				if (!clonedMonitor.Prop_1_Category_nonfail) {
					EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.await();
				}
				else {
					break;
				}
			} while (true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		final EnforceTest2EnforcementMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_oneBegin();
		EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.signalAll();
		if(matchedEntryfinalMonitor.Prop_1_Category_nonfail) {
			matchedEntryfinalMonitor.Prop_1_handler_nonfail();
		}

		EnforceTest2_RVMLock.unlock();
	}

	public static final void oneEndEvent() {
		EnforceTest2_activated = true;
		while (!EnforceTest2_RVMLock.tryLock()) {
			Thread.yield();
		}

		EnforceTest2EnforcementMonitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = EnforceTest2__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			EnforceTest2EnforcementMonitor created = new EnforceTest2EnforcementMonitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		try {
			do {
				EnforceTest2EnforcementMonitor clonedMonitor = (EnforceTest2EnforcementMonitor)matchedEntry.clone();
				boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_oneEnd();
				if (!cloned_monitor_condition_satisfied) {
					break;
				}
				if (!clonedMonitor.Prop_1_Category_nonfail) {
					EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.await();
				}
				else {
					break;
				}
			} while (true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		final EnforceTest2EnforcementMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_oneEnd();
		EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.signalAll();
		if(matchedEntryfinalMonitor.Prop_1_Category_nonfail) {
			matchedEntryfinalMonitor.Prop_1_handler_nonfail();
		}

		EnforceTest2_RVMLock.unlock();
	}

	public static final void twoBeginEvent() {
		EnforceTest2_activated = true;
		while (!EnforceTest2_RVMLock.tryLock()) {
			Thread.yield();
		}

		EnforceTest2EnforcementMonitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = EnforceTest2__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			EnforceTest2EnforcementMonitor created = new EnforceTest2EnforcementMonitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		try {
			do {
				EnforceTest2EnforcementMonitor clonedMonitor = (EnforceTest2EnforcementMonitor)matchedEntry.clone();
				boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_twoBegin();
				if (!cloned_monitor_condition_satisfied) {
					break;
				}
				if (!clonedMonitor.Prop_1_Category_nonfail) {
					EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.await();
				}
				else {
					break;
				}
			} while (true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		final EnforceTest2EnforcementMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_twoBegin();
		EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.signalAll();
		if(matchedEntryfinalMonitor.Prop_1_Category_nonfail) {
			matchedEntryfinalMonitor.Prop_1_handler_nonfail();
		}

		EnforceTest2_RVMLock.unlock();
	}

	public static final void twoEndEvent() {
		EnforceTest2_activated = true;
		while (!EnforceTest2_RVMLock.tryLock()) {
			Thread.yield();
		}

		EnforceTest2EnforcementMonitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = EnforceTest2__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			EnforceTest2EnforcementMonitor created = new EnforceTest2EnforcementMonitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		try {
			do {
				EnforceTest2EnforcementMonitor clonedMonitor = (EnforceTest2EnforcementMonitor)matchedEntry.clone();
				boolean cloned_monitor_condition_satisfied = clonedMonitor.Prop_1_event_twoEnd();
				if (!cloned_monitor_condition_satisfied) {
					break;
				}
				if (!clonedMonitor.Prop_1_Category_nonfail) {
					EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.await();
				}
				else {
					break;
				}
			} while (true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		final EnforceTest2EnforcementMonitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_twoEnd();
		EnforceTest2RuntimeMonitor.EnforceTest2_RVMLock_cond.signalAll();
		if(matchedEntryfinalMonitor.Prop_1_Category_nonfail) {
			matchedEntryfinalMonitor.Prop_1_handler_nonfail();
		}

		EnforceTest2_RVMLock.unlock();
	}

	static HashSet<Thread> EnforceTest2_ThreadMonitor_ThreadSet = new HashSet<Thread>();

	public static void startDeadlockDetection() {
		while (!EnforceTest2_RVMLock.tryLock()) {
			Thread.yield();
		}
		EnforceTest2_ThreadMonitor_ThreadSet.add(Thread.currentThread());
		if (!com.runtimeverification.rvmonitor.java.rt.RVMDeadlockDetector.startedDeadlockDetection) {
			com.runtimeverification.rvmonitor.java.rt.RVMDeadlockDetector.startDeadlockDetectionThread(EnforceTest2_ThreadMonitor_ThreadSet, EnforceTest2_RVMLock, new EnforceTest2EnforcementMonitor.EnforceTest2EnforcementMonitorDeadlockCallback());
			com.runtimeverification.rvmonitor.java.rt.RVMDeadlockDetector.startedDeadlockDetection = true;
		}
		EnforceTest2_RVMLock_cond.signalAll();
		EnforceTest2_RVMLock.unlock();
	}

	class EnforceTest2_DummyHookThread extends Thread {
		public void run(){
		}
	}
}
