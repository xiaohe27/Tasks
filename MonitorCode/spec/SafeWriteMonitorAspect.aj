package mop;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.concurrent.*;
import java.util.concurrent.locks.*;
import java.util.*;

import java.lang.ref.*;
import org.aspectj.lang.*;

aspect BaseAspect {
	pointcut notwithin() :
	!within(sun..*) &&
	!within(java..*) &&
	!within(javax..*) &&
	!within(com.sun..*) &&
	!within(org.dacapo.harness..*) &&
	!within(org.apache.commons..*) &&
	!within(org.apache.geronimo..*) &&
	!within(net.sf.cglib..*) &&
	!within(mop..*) &&
	!within(javamoprt..*) &&
	!within(rvmonitorrt..*) &&
	!within(com.runtimeverification..*);
}

public aspect SafeWriteMonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public SafeWriteMonitorAspect(){
	}

	// Declarations for the Lock
	static ReentrantLock SafeWrite_MOPLock = new ReentrantLock();
	static Condition SafeWrite_MOPLock_cond = SafeWrite_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution() && BaseAspect.notwithin();
	pointcut SafeFileWriter_write(Files files, Path path, byte[] contents, StandardOpenOption openOption) : (call(* Files.write(Path, byte[], StandardOpenOption))) && MOP_CommonPointCut();
	before (Files files, Path path, byte[] contents, StandardOpenOption openOption) : SafeFileWriter_write(files, path, contents, openOption) {
		SafeWriteRuntimeMonitor.writeEvent(files, path, contents, openOption);
	}

}
