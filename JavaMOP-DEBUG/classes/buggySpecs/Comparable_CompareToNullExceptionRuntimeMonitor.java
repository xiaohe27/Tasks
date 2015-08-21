package mop;
import java.io.*;
import java.lang.*;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging.Level;
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

final class Comparable_CompareToNullExceptionRawMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<Comparable_CompareToNullExceptionRawMonitor> {

	Comparable_CompareToNullExceptionRawMonitor_Set(){
		this.size = 0;
		this.elements = new Comparable_CompareToNullExceptionRawMonitor[4];
	}
	final void event_badexception(Object o, Exception e) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			Comparable_CompareToNullExceptionRawMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_badexception(o, e);
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
	final void event_badcompare(Object o, int i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			Comparable_CompareToNullExceptionRawMonitor monitor = this.elements[i_1];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_badcompare(o, i);
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elements[i_1] = null;
		}
		size = numAlive;
	}
}

class Comparable_CompareToNullExceptionRawMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			Comparable_CompareToNullExceptionRawMonitor ret = (Comparable_CompareToNullExceptionRawMonitor) super.clone();
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

	final boolean event_badexception(Object o, Exception e) {
		RVM_lastevent = 0;
		{
			if ( ! (!(e instanceof NullPointerException)) ) {
				return false;
			}
			{
				RVMLogging.out.println(Level.CRITICAL, "Specification Comparable_CompareToNullException has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/Comparable_CompareToNullException.html");
				RVMLogging.out.println(Level.CRITICAL, "NullPointerException should be thrown when an object is compared to null");
			}
		}
		return true;
	}

	final boolean event_badcompare(Object o, int i) {
		RVM_lastevent = 1;
		{
			RVMLogging.out.println(Level.CRITICAL, "Specification Comparable_CompareToNullException has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/Comparable_CompareToNullException.html");
			RVMLogging.out.println(Level.CRITICAL, "NullPointerException should be thrown when an object is compared to null");
		}
		return true;
	}

	final void reset() {
		RVM_lastevent = -1;
	}

	@Override
	protected final void terminateInternal(int idnum) {
		switch(idnum){
		}
		switch(RVM_lastevent) {
			case -1:
			return;
			case 0:
			//badexception
			return;
			case 1:
			//badcompare
			return;
		}
		return;
	}

}

public final class Comparable_CompareToNullExceptionRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager Comparable_CompareToNullExceptionMapManager;
	static {
		Comparable_CompareToNullExceptionMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		Comparable_CompareToNullExceptionMapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock Comparable_CompareToNullException_RVMLock = new ReentrantLock();
	static final Condition Comparable_CompareToNullException_RVMLock_cond = Comparable_CompareToNullException_RVMLock.newCondition();

	private static boolean Comparable_CompareToNullException_activated = false;

	// Declarations for Indexing Trees
	private static final Comparable_CompareToNullExceptionRawMonitor Comparable_CompareToNullException__Map = new Comparable_CompareToNullExceptionRawMonitor() ;

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

	public static final void badexceptionEvent(Object o, Exception e) {
		Comparable_CompareToNullException_activated = true;
		while (!Comparable_CompareToNullException_RVMLock.tryLock()) {
			Thread.yield();
		}

		Comparable_CompareToNullExceptionRawMonitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = Comparable_CompareToNullException__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			Comparable_CompareToNullExceptionRawMonitor created = new Comparable_CompareToNullExceptionRawMonitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		matchedEntry.event_badexception(o, e);

		Comparable_CompareToNullException_RVMLock.unlock();
	}

	public static final void badcompareEvent(Object o, int i) {
		Comparable_CompareToNullException_activated = true;
		while (!Comparable_CompareToNullException_RVMLock.tryLock()) {
			Thread.yield();
		}

		Comparable_CompareToNullExceptionRawMonitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = Comparable_CompareToNullException__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			Comparable_CompareToNullExceptionRawMonitor created = new Comparable_CompareToNullExceptionRawMonitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		matchedEntry.event_badcompare(o, i);

		Comparable_CompareToNullException_RVMLock.unlock();
	}

}
