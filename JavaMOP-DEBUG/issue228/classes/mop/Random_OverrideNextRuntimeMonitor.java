package mop;
import java.util.*;
import java.lang.reflect.*;
import org.aspectj.lang.Signature;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging;
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

final class Random_OverrideNextRawMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<Random_OverrideNextRawMonitor> {

	Random_OverrideNextRawMonitor_Set(){
		this.size = 0;
		this.elements = new Random_OverrideNextRawMonitor[4];
	}
	final void event_staticinit(org.aspectj.lang.Signature staticsig) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Random_OverrideNextRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_staticinit(staticsig);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
}

class Random_OverrideNextRawMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			Random_OverrideNextRawMonitor ret = (Random_OverrideNextRawMonitor) super.clone();
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

	final boolean event_staticinit(org.aspectj.lang.Signature staticsig) {
		RVM_lastevent = 0;
		{
			Signature initsig = staticsig;
			Class klass = initsig.getDeclaringType();
			if (klass != null) {
				try {
					Method nextmethod = klass.getDeclaredMethod("next", int.class);
				} catch (NoSuchMethodException e) {
					RVMLogging.out.println(RVMLogging.Level.CRITICAL, "Specification Random_OverrideNext has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/Random_OverrideNext.html");
					RVMLogging.out.println(RVMLogging.Level.CRITICAL, klass.getName() + " does not override int next(int bits).");
				}
			}
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
			//staticinit
			return;
		}
		return;
	}

}

public final class Random_OverrideNextRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager Random_OverrideNextMapManager;
	static {
		Random_OverrideNextMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		Random_OverrideNextMapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock Random_OverrideNext_RVMLock = new ReentrantLock();
	static final Condition Random_OverrideNext_RVMLock_cond = Random_OverrideNext_RVMLock.newCondition();

	private static boolean Random_OverrideNext_activated = false;

	// Declarations for Indexing Trees
	private static final Random_OverrideNextRawMonitor Random_OverrideNext__Map = new Random_OverrideNextRawMonitor() ;

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

	public static final void staticinitEvent(org.aspectj.lang.Signature staticsig) {
		Random_OverrideNext_activated = true;
		while (!Random_OverrideNext_RVMLock.tryLock()) {
			Thread.yield();
		}

		Random_OverrideNextRawMonitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = Random_OverrideNext__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			Random_OverrideNextRawMonitor created = new Random_OverrideNextRawMonitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		matchedEntry.event_staticinit(staticsig);

		Random_OverrideNext_RVMLock.unlock();
	}

}
