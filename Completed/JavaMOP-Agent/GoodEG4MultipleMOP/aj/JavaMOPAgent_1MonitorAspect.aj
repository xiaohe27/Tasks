package mop;import java.io.*;
import java.util.*;
import java.security.*;
import java.util.concurrent.*;
import java.util.concurrent.locks.*;

import java.lang.ref.*;
import org.aspectj.lang.*;

public aspect JavaMOPAgent_1MonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public JavaMOPAgent_1MonitorAspect(){
		Runtime.getRuntime().addShutdownHook(new JavaMOPAgent_1_DummyHookThread());
	}

	// Declarations for the Lock
	static ReentrantLock JavaMOPAgent_1_MOPLock = new ReentrantLock();
	static Condition JavaMOPAgent_1_MOPLock_cond = JavaMOPAgent_1_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution();
	pointcut SafeSyncCollection_accessIter(Iterator iter) : (call(* Iterator.*(..)) && target(iter)) && MOP_CommonPointCut();
	before (Iterator iter) : SafeSyncCollection_accessIter(iter) {
		//SafeSyncMap_accessIter
		JavaMOPAgent_1RuntimeMonitor.SafeSyncMap_accessIterEvent(iter);
		//SafeSyncCollection_accessIter
		JavaMOPAgent_1RuntimeMonitor.SafeSyncCollection_accessIterEvent(iter);
	}

	pointcut SafeEnum_next(Enumeration e) : (call(* Enumeration+.nextElement()) && target(e)) && MOP_CommonPointCut();
	before (Enumeration e) : SafeEnum_next(e) {
		JavaMOPAgent_1RuntimeMonitor.SafeEnum_nextEvent(e);
	}

	pointcut MsgDigest_digest(MessageDigest P) : (call(* MessageDigest.digest()) && target(P)) && MOP_CommonPointCut();
	before (MessageDigest P) : MsgDigest_digest(P) {
		JavaMOPAgent_1RuntimeMonitor.MsgDigest_digestEvent(P);
	}

	pointcut MsgDigest_reset(MessageDigest P) : (call(* MessageDigest.reset()) && target(P)) && MOP_CommonPointCut();
	before (MessageDigest P) : MsgDigest_reset(P) {
		JavaMOPAgent_1RuntimeMonitor.MsgDigest_resetEvent(P);
	}

	pointcut SafeHashSet_unsafe_contains(HashSet t, Object o) : (call(* Collection+.contains(Object)) && target(t) && args(o)) && MOP_CommonPointCut();
	before (HashSet t, Object o) : SafeHashSet_unsafe_contains(t, o) {
		JavaMOPAgent_1RuntimeMonitor.SafeHashSet_unsafe_containsEvent(t, o);
	}

	pointcut HasNext_next(Iterator i) : (call(* Iterator.next()) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : HasNext_next(i) {
		//UnsafeMapIterator_useIter
		JavaMOPAgent_1RuntimeMonitor.UnsafeMapIterator_useIterEvent(i);
		//SafeMapIterator_useIter
		JavaMOPAgent_1RuntimeMonitor.SafeMapIterator_useIterEvent(i);
		//HasNext_next
		JavaMOPAgent_1RuntimeMonitor.HasNext_nextEvent(i);
	}

	pointcut FileClose_write(FileWriter f) : (call(* FileWriter+.write(..)) && target(f)) && MOP_CommonPointCut();
	before (FileWriter f) : FileClose_write(f) {
		JavaMOPAgent_1RuntimeMonitor.FileClose_writeEvent(f);
	}

	pointcut FileClose_close(FileWriter f) : (call(* FileWriter+.close(..)) && target(f)) && MOP_CommonPointCut();
	after (FileWriter f) : FileClose_close(f) {
		JavaMOPAgent_1RuntimeMonitor.FileClose_closeEvent(f);
	}

	pointcut HasNext_create(Collection c) : (call(Iterator Collection+.iterator()) && target(c)) && MOP_CommonPointCut();
	after (Collection c) returning (Iterator i) : HasNext_create(c) {
		JavaMOPAgent_1RuntimeMonitor.HasNext_createEvent(c, i);
	}

	pointcut HasNext_hasnext(Iterator i) : (call(* Iterator.hasNext()) && target(i)) && MOP_CommonPointCut();
	after (Iterator i) : HasNext_hasnext(i) {
		JavaMOPAgent_1RuntimeMonitor.HasNext_hasnextEvent(i);
	}

	pointcut SafeHashSet_add(HashSet t, Object o) : (call(* Collection+.add(Object)) && target(t) && args(o)) && MOP_CommonPointCut();
	after (HashSet t, Object o) : SafeHashSet_add(t, o) {
		JavaMOPAgent_1RuntimeMonitor.SafeHashSet_addEvent(t, o);
	}

	pointcut SafeHashSet_remove(HashSet t, Object o) : (call(* Collection+.remove(Object)) && target(t) && args(o)) && MOP_CommonPointCut();
	after (HashSet t, Object o) : SafeHashSet_remove(t, o) {
		JavaMOPAgent_1RuntimeMonitor.SafeHashSet_removeEvent(t, o);
	}

	pointcut MsgDigest_getInstance(MessageDigest P) : (call(* MessageDigest.getInstance()) && target(P)) && MOP_CommonPointCut();
	after (MessageDigest P) : MsgDigest_getInstance(P) {
		JavaMOPAgent_1RuntimeMonitor.MsgDigest_getInstanceEvent(P);
	}

	pointcut MsgDigest_update(MessageDigest P) : (call(* MessageDigest.update()) && target(P)) && MOP_CommonPointCut();
	after (MessageDigest P) : MsgDigest_update(P) {
		JavaMOPAgent_1RuntimeMonitor.MsgDigest_updateEvent(P);
	}

	pointcut SafeEnum_create(Vector v) : (call(Enumeration Vector+.elements()) && target(v)) && MOP_CommonPointCut();
	after (Vector v) returning (Enumeration e) : SafeEnum_create(v) {
		JavaMOPAgent_1RuntimeMonitor.SafeEnum_createEvent(v, e);
	}

	pointcut SafeEnum_updatesource(Vector v) : ((call(* Vector+.remove*(..)) || call(* Vector+.add*(..)) || call(* Vector+.clear(..)) || call(* Vector+.insertElementAt(..)) || call(* Vector+.set*(..)) || call(* Vector+.retainAll(..))) && target(v)) && MOP_CommonPointCut();
	after (Vector v) : SafeEnum_updatesource(v) {
		JavaMOPAgent_1RuntimeMonitor.SafeEnum_updatesourceEvent(v);
	}

	pointcut SafeMapIterator_createColl(Map map) : ((call(* Map.values()) || call(* Map.keySet())) && target(map)) && MOP_CommonPointCut();
	after (Map map) returning (Collection c) : SafeMapIterator_createColl(map) {
		//SafeMapIterator_createColl
		JavaMOPAgent_1RuntimeMonitor.SafeMapIterator_createCollEvent(map, c);
		//UnsafeMapIterator_createColl
		JavaMOPAgent_1RuntimeMonitor.UnsafeMapIterator_createCollEvent(map, c);
	}

	pointcut SafeMapIterator_createIter(Collection c) : (call(* Collection.iterator()) && target(c)) && MOP_CommonPointCut();
	after (Collection c) returning (Iterator i) : SafeMapIterator_createIter(c) {
		//SafeMapIterator_createIter
		JavaMOPAgent_1RuntimeMonitor.SafeMapIterator_createIterEvent(c, i);
		//UnsafeMapIterator_createIter
		JavaMOPAgent_1RuntimeMonitor.UnsafeMapIterator_createIterEvent(c, i);
	}

	pointcut SafeMapIterator_updateMap(Map map) : ((call(* Map.put*(..)) || call(* Map.putAll*(..)) || call(* Map.clear()) || call(* Map.remove*(..))) && target(map)) && MOP_CommonPointCut();
	after (Map map) : SafeMapIterator_updateMap(map) {
		//SafeMapIterator_updateMap
		JavaMOPAgent_1RuntimeMonitor.SafeMapIterator_updateMapEvent(map);
		//UnsafeMapIterator_updateMap
		JavaMOPAgent_1RuntimeMonitor.UnsafeMapIterator_updateMapEvent(map);
	}

	pointcut SafeSyncCollection_sync() : (call(* Collections.synchr*(..))) && MOP_CommonPointCut();
	after () returning (Object c) : SafeSyncCollection_sync() {
		JavaMOPAgent_1RuntimeMonitor.SafeSyncCollection_syncEvent(c);
	}

	pointcut SafeSyncCollection_syncCreateIter(Object c) : (call(* Collection+.iterator()) && target(c) && if(Thread.holdsLock(c))) && MOP_CommonPointCut();
	after (Object c) returning (Iterator iter) : SafeSyncCollection_syncCreateIter(c) {
		JavaMOPAgent_1RuntimeMonitor.SafeSyncCollection_syncCreateIterEvent(c, iter);
	}

	pointcut SafeSyncCollection_asyncCreateIter(Object c) : (call(* Collection+.iterator()) && target(c) && if(!Thread.holdsLock(c))) && MOP_CommonPointCut();
	after (Object c) returning (Iterator iter) : SafeSyncCollection_asyncCreateIter(c) {
		JavaMOPAgent_1RuntimeMonitor.SafeSyncCollection_asyncCreateIterEvent(c, iter);
	}

	pointcut SafeSyncMap_sync() : (call(* Collections.synchr*(..))) && MOP_CommonPointCut();
	after () returning (Map syncMap) : SafeSyncMap_sync() {
		JavaMOPAgent_1RuntimeMonitor.SafeSyncMap_syncEvent(syncMap);
	}

	pointcut SafeSyncMap_createSet(Map syncMap) : (call(* Map+.keySet()) && target(syncMap)) && MOP_CommonPointCut();
	after (Map syncMap) returning (Set mapSet) : SafeSyncMap_createSet(syncMap) {
		JavaMOPAgent_1RuntimeMonitor.SafeSyncMap_createSetEvent(syncMap, mapSet);
	}

	pointcut SafeSyncMap_syncCreateIter(Set mapSet) : (call(* Collection+.iterator()) && target(mapSet)) && MOP_CommonPointCut();
	after (Set mapSet) returning (Iterator iter) : SafeSyncMap_syncCreateIter(mapSet) {
		//SafeSyncMap_syncCreateIter
		JavaMOPAgent_1RuntimeMonitor.SafeSyncMap_syncCreateIterEvent(mapSet, iter);
		//SafeSyncMap_asyncCreateIter
		JavaMOPAgent_1RuntimeMonitor.SafeSyncMap_asyncCreateIterEvent(mapSet, iter);
	}

	class JavaMOPAgent_1_DummyHookThread extends Thread {
		public void run(){
			JavaMOPAgent_1RuntimeMonitor.FileClose_endProgEvent();
		}
	}
}
