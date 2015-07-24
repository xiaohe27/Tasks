package mop;
import java.io.*;
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

final class File_LengthOnDirectoryRawMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<File_LengthOnDirectoryRawMonitor> {

	File_LengthOnDirectoryRawMonitor_Set(){
		this.size = 0;
		this.elements = new File_LengthOnDirectoryRawMonitor[4];
	}
	final void event_bad_length(File f) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			File_LengthOnDirectoryRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_bad_length(f);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
}

class File_LengthOnDirectoryRawMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected static long File_LengthOnDirectory_Monitor_num = 0;
	protected static long File_LengthOnDirectory_CollectedMonitor_num = 0;
	protected static long File_LengthOnDirectory_TerminatedMonitor_num = 0;
	protected static long File_LengthOnDirectory_bad_length_num = 0;

	public static long getTotalMonitorCount() {
		return File_LengthOnDirectory_Monitor_num;
	}
	public static long getCollectedMonitorCount() {
		return File_LengthOnDirectory_CollectedMonitor_num;
	}
	public static long getTerminatedMonitorCount() {
		return File_LengthOnDirectory_TerminatedMonitor_num;
	}
	public static Map<String, Long> getEventCounters() {
		HashMap<String, Long> eventCounters = new HashMap<String, Long>();
		eventCounters.put("bad_length", File_LengthOnDirectory_bad_length_num);
		return eventCounters;
	}
	public static Map<String, Long> getCategoryCounters() {
		HashMap<String, Long> categoryCounters = new HashMap<String, Long>();
		return categoryCounters;
	}

	protected Object clone() {
		File_LengthOnDirectory_Monitor_num++;
		try {
			File_LengthOnDirectoryRawMonitor ret = (File_LengthOnDirectoryRawMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	public File_LengthOnDirectoryRawMonitor() {
		File_LengthOnDirectory_Monitor_num++;
		}@Override
		public final int getState() {
			return -1;
		}

		final boolean event_bad_length(File f) {
			RVM_lastevent = 0;
			{
				if ( ! (f.isDirectory()) ) {
					return false;
				}
				{
					RVMLogging.out.println(Level.CRITICAL, "Specification File_LengthOnDirectory has been violated on line " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/File_LengthOnDirectory.html");
					RVMLogging.out.println(Level.CRITICAL, "length() was invoked on a File instance that represents a directory.");
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
				//bad_length
				return;
			}
			return;
		}

		protected void finalize() throws Throwable {
			try {
				File_LengthOnDirectory_CollectedMonitor_num++;
			} finally {
				super.finalize();
			}
		}

	}

	public final class File_LengthOnDirectoryRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
		private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager File_LengthOnDirectoryMapManager;
		static {
			File_LengthOnDirectoryMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
			File_LengthOnDirectoryMapManager.start();
		}

		// Declarations for the Lock
		static final ReentrantLock File_LengthOnDirectory_RVMLock = new ReentrantLock();
		static final Condition File_LengthOnDirectory_RVMLock_cond = File_LengthOnDirectory_RVMLock.newCondition();

		private static boolean File_LengthOnDirectory_activated = false;

		// Declarations for Indexing Trees
		private static final File_LengthOnDirectoryRawMonitor File_LengthOnDirectory__Map = new File_LengthOnDirectoryRawMonitor() ;

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

		public static final void bad_lengthEvent(File f) {
			File_LengthOnDirectory_activated = true;
			while (!File_LengthOnDirectory_RVMLock.tryLock()) {
				Thread.yield();
			}

			File_LengthOnDirectoryRawMonitor.File_LengthOnDirectory_bad_length_num++;

			File_LengthOnDirectoryRawMonitor matchedEntry = null;
			{
				// FindOrCreateEntry
				matchedEntry = File_LengthOnDirectory__Map;
			}
			// D(X) main:1
			if ((matchedEntry == null) ) {
				// D(X) main:4
				File_LengthOnDirectoryRawMonitor created = new File_LengthOnDirectoryRawMonitor() ;
				matchedEntry = created;
			}
			// D(X) main:8--9
			matchedEntry.event_bad_length(f);

			File_LengthOnDirectory_RVMLock.unlock();
		}

	}
