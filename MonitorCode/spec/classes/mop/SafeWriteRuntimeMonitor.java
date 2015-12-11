package mop;
import java.io.IOException;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import test.FilePath;
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

final class SafeFileWriterRawMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<SafeFileWriterRawMonitor> {

	SafeFileWriterRawMonitor_Set(){
		this.size = 0;
		this.elements = new SafeFileWriterRawMonitor[4];
	}
	final void event_write(FilePath filepath) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			SafeFileWriterRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_write(filepath);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
}

class SafeFileWriterRawMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected Object clone() {
		try {
			SafeFileWriterRawMonitor ret = (SafeFileWriterRawMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	static Path tmpPath = Paths.get("temp.txt");

	static Path originalPath = null;

	@Override
	public final int getState() {
		return -1;
	}

	final boolean event_write(FilePath filepath) {
		RVM_lastevent = 0;
		{
			if (originalPath != null && originalPath.toFile().exists()) {
				filepath.setOutputPath(originalPath);
			}
			Path path = filepath.getOutputPath();
			if (path.toFile().exists()) {
				System.out.println("Write to path " + path);
			} else {
				System.out.println("No output file available, use tmp instead");
				if (originalPath == null) originalPath = path;
				File tmpFile = tmpPath.toFile();
				try {
					tmpFile.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				}
				filepath.setOutputPath(tmpFile.toPath());
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
			//write
			return;
		}
		return;
	}

}

public final class SafeWriteRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager SafeWriteMapManager;
	static {
		SafeWriteMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
		SafeWriteMapManager.start();
	}

	// Declarations for the Lock
	static final ReentrantLock SafeWrite_RVMLock = new ReentrantLock();
	static final Condition SafeWrite_RVMLock_cond = SafeWrite_RVMLock.newCondition();

	private static boolean SafeFileWriter_activated = false;

	// Declarations for Indexing Trees
	private static final SafeFileWriterRawMonitor SafeFileWriter__Map = new SafeFileWriterRawMonitor() ;

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

	public static final void writeEvent(FilePath filepath) {
		SafeFileWriter_activated = true;
		while (!SafeWrite_RVMLock.tryLock()) {
			Thread.yield();
		}

		SafeFileWriterRawMonitor matchedEntry = null;
		{
			// FindOrCreateEntry
			matchedEntry = SafeFileWriter__Map;
		}
		// D(X) main:1
		if ((matchedEntry == null) ) {
			// D(X) main:4
			SafeFileWriterRawMonitor created = new SafeFileWriterRawMonitor() ;
			matchedEntry = created;
		}
		// D(X) main:8--9
		matchedEntry.event_write(filepath);

		SafeWrite_RVMLock.unlock();
	}

}
