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
	pointcut SafeFileWriter_write(FilePath filepath) : (target(filepath) && call(* FilePath.getOutputPath())) && MOP_CommonPointCut();
	before (FilePath filepath) : SafeFileWriter_write(filepath) {
		SafeWriteRuntimeMonitor.writeEvent(filepath);
	}

}
