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

final class T3B1Monitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<T3B1Monitor> {

	T3B1Monitor_Set(){
		this.size = 0;
		this.elements = new T3B1Monitor[4];
	}
	final void event_c(long ts) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			T3B1Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final T3B1Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_c(ts);
				if(monitorfinalMonitor.Prop_1_Category_violation) {
					monitorfinalMonitor.Prop_1_handler_violation();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_d(long ts) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			T3B1Monitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final T3B1Monitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_d(ts);
				if(monitorfinalMonitor.Prop_1_Category_violation) {
					monitorfinalMonitor.Prop_1_handler_violation();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
}

class T3B1Monitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			T3B1Monitor ret = (T3B1Monitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	private long time_c;

	static final int Prop_1_transition_c[] = {1, 1, 3, 3};;
	static final int Prop_1_transition_d[] = {2, 1, 3, 3};;

	volatile boolean Prop_1_Category_violation = false;

	private final AtomicInteger pairValue;

	T3B1Monitor() {
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

	final boolean Prop_1_event_c(long ts) {
		{time_c = ts;}

		int nextstate = this.handleEvent(0, Prop_1_transition_c) ;
		this.Prop_1_Category_violation = nextstate == 2;

		return true;
	}

	final boolean Prop_1_event_d(long ts) {
		{
			if (ts - time_c < 100) {
				System.err.println("the distance between the first event c and the first event d is less than 100 time units");
				System.exit(0);
			}
		}

		int nextstate = this.handleEvent(1, Prop_1_transition_d) ;
		this.Prop_1_Category_violation = nextstate == 2;

		return true;
	}

	final void Prop_1_handler_violation (){
		{
			System.err.println("no event c occurs before the first event d");
			System.exit(0);
		}

	}

	final void reset() {
		this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

		Prop_1_Category_violation = false;
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
			//c
			return;
			case 1:
			//d
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

public final class T3B1RuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager T3B1MapManager;
	static {
		T3B1MapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		T3B1MapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock T3B1_RVMLock = new ReentrantLock();
	static final Condition T3B1_RVMLock_cond = T3B1_RVMLock.newCondition();

	private static boolean T3B1_activated = false;

	// Declarations for Indexing Trees
	private static final T3B1Monitor T3B1__Map = new T3B1Monitor() ;

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

	public static final void cEvent(long ts) {
		T3B1_activated = true;
		while (!T3B1_RVMLock.tryLock()) {
			Thread.yield();
		}

		T3B1Monitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = T3B1__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			T3B1Monitor created = new T3B1Monitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		final T3B1Monitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_c(ts);
		if(matchedEntryfinalMonitor.Prop_1_Category_violation) {
			matchedEntryfinalMonitor.Prop_1_handler_violation();
		}

		T3B1_RVMLock.unlock();
	}

	public static final void dEvent(long ts) {
		T3B1_activated = true;
		while (!T3B1_RVMLock.tryLock()) {
			Thread.yield();
		}

		T3B1Monitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = T3B1__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			T3B1Monitor created = new T3B1Monitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		final T3B1Monitor matchedEntryfinalMonitor = matchedEntry;
		matchedEntry.Prop_1_event_d(ts);
		if(matchedEntryfinalMonitor.Prop_1_Category_violation) {
			matchedEntryfinalMonitor.Prop_1_handler_violation();
		}

		T3B1_RVMLock.unlock();
	}

}
