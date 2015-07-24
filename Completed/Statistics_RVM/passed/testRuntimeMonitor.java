package mop;
import java.io.*;
import java.lang.reflect.*;
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

final class Serializable_NoArgConstructorRawMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<Serializable_NoArgConstructorRawMonitor> {

	Serializable_NoArgConstructorRawMonitor_Set(){
		this.size = 0;
		this.elements = new Serializable_NoArgConstructorRawMonitor[4];
	}
	final void event_staticinit(org.aspectj.lang.Signature staticsig) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			Serializable_NoArgConstructorRawMonitor monitor = this.elements[i];
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

class Serializable_NoArgConstructorRawMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected static long Serializable_NoArgConstructor_Monitor_num = 0;
	protected static long Serializable_NoArgConstructor_CollectedMonitor_num = 0;
	protected static long Serializable_NoArgConstructor_TerminatedMonitor_num = 0;
	protected static long Serializable_NoArgConstructor_staticinit_num = 0;

	public static long getTotalMonitorCount() {
		return Serializable_NoArgConstructor_Monitor_num;
	}
	public static long getCollectedMonitorCount() {
		return Serializable_NoArgConstructor_CollectedMonitor_num;
	}
	public static long getTerminatedMonitorCount() {
		return Serializable_NoArgConstructor_TerminatedMonitor_num;
	}
	public static Map<String, Long> getEventCounters() {
		HashMap<String, Long> eventCounters = new HashMap<String, Long>();
		eventCounters.put("staticinit", Serializable_NoArgConstructor_staticinit_num);
		return eventCounters;
	}
	public static Map<String, Long> getCategoryCounters() {
		HashMap<String, Long> categoryCounters = new HashMap<String, Long>();
		return categoryCounters;
	}

	protected Object clone() {
		Serializable_NoArgConstructor_Monitor_num++;
		try {
			Serializable_NoArgConstructorRawMonitor ret = (Serializable_NoArgConstructorRawMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	private String getPackageName(Class cl) {
		String s = cl.getName();
		int i = s.lastIndexOf('[');
		if (i >= 0) s = s.substring(i + 2);
		i = s.lastIndexOf('.');
		return (i >= 0) ? s.substring(0, i) : "";
	}

	public Serializable_NoArgConstructorRawMonitor() {
		Serializable_NoArgConstructor_Monitor_num++;
		}@Override
		public final int getState() {
			return -1;
		}

		final boolean event_staticinit(org.aspectj.lang.Signature staticsig) {
			RVM_lastevent = 0;
			{
				org.aspectj.lang.Signature initsig = staticsig;
				Class klass = initsig.getDeclaringType();
				if (klass != null) {
					Class nonserialzable = klass;
					while (Serializable.class.isAssignableFrom(nonserialzable)) {
						nonserialzable = nonserialzable.getSuperclass();
						if (nonserialzable == null) break;
					}
					if (nonserialzable != null) {
						boolean samepackage = klass.getClassLoader() == nonserialzable.getClassLoader() && getPackageName(klass).equals(getPackageName(nonserialzable));
						boolean inaccessible = true;
						try {
							Constructor ctor = nonserialzable.getDeclaredConstructor((Class[]) null);
							int mod = ctor.getModifiers();
							inaccessible = (mod & Modifier.PRIVATE) != 0 || ((mod & (Modifier.PUBLIC | Modifier.PROTECTED)) == 0 && !samepackage);
						} catch (NoSuchMethodException e) {
						}
						if (inaccessible) {
							RVMLogging.out.println(Level.CRITICAL, "Specification Serializable_NoArgConstructor has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/Serializable_NoArgConstructor.html");
							RVMLogging.out.println(Level.CRITICAL, "The superclass of " + klass.getName() + " does not have an accessible no-arg constructor.");
						}
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

		protected void finalize() throws Throwable {
			try {
				Serializable_NoArgConstructor_CollectedMonitor_num++;
			} finally {
				super.finalize();
			}
		}

	}

	public final class testRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
		private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager testMapManager;
		static {
			testMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
			testMapManager.start();
		}

		// Declarations for the Lock
		static final ReentrantLock test_RVMLock = new ReentrantLock();
		static final Condition test_RVMLock_cond = test_RVMLock.newCondition();

		private static boolean Serializable_NoArgConstructor_activated = false;

		// Declarations for Indexing Trees
		private static final Serializable_NoArgConstructorRawMonitor Serializable_NoArgConstructor__Map = new Serializable_NoArgConstructorRawMonitor() ;

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
			Serializable_NoArgConstructor_activated = true;
			while (!test_RVMLock.tryLock()) {
				Thread.yield();
			}

			Serializable_NoArgConstructorRawMonitor.Serializable_NoArgConstructor_staticinit_num++;

			Serializable_NoArgConstructorRawMonitor matchedEntry = null;
			{
				// FindOrCreateEntry
				matchedEntry = Serializable_NoArgConstructor__Map;
			}
			// D(X) main:1
			if ((matchedEntry == null) ) {
				// D(X) main:4
				Serializable_NoArgConstructorRawMonitor created = new Serializable_NoArgConstructorRawMonitor() ;
				matchedEntry = created;
			}
			// D(X) main:8--9
			matchedEntry.event_staticinit(staticsig);

			test_RVMLock.unlock();
		}

	}
