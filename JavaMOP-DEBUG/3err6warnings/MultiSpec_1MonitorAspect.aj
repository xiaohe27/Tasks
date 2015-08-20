package mop;
import java.io.*;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging.Level;
import java.util.*;
import java.lang.reflect.*;
import java.lang.*;
import java.util.concurrent.*;
import org.aspectj.lang.Signature;
import java.nio.channels.*;
import java.net.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.*;
import javax.swing.*;
import java.awt.EventQueue;
import java.security.*;
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

public aspect MultiSpec_1MonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public MultiSpec_1MonitorAspect(){
		Runtime.getRuntime().addShutdownHook(new MultiSpec_1_DummyHookThread());
	}

	// Declarations for the Lock
	static ReentrantLock MultiSpec_1_MOPLock = new ReentrantLock();
	static Condition MultiSpec_1_MOPLock_cond = MultiSpec_1_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution() && BaseAspect.notwithin();

	
	pointcut StrictMath_ContendedRandom_onethread_use() : (call(* StrictMath.random(..))) && MOP_CommonPointCut();
	before () : StrictMath_ContendedRandom_onethread_use() {
		Thread t = Thread.currentThread();
		//StrictMath_ContendedRandom_otherthread_use
		MultiSpec_1RuntimeMonitor.StrictMath_ContendedRandom_otherthread_useEvent(t);
		//StrictMath_ContendedRandom_onethread_use
		MultiSpec_1RuntimeMonitor.StrictMath_ContendedRandom_onethread_useEvent(t);
	}

	pointcut Byte_BadParsingArgs_bad_arg2(String s) : (call(* Byte.parseByte(String)) && args(s)) && MOP_CommonPointCut();
	before (String s) : Byte_BadParsingArgs_bad_arg2(s) {
		MultiSpec_1RuntimeMonitor.Byte_BadParsingArgs_bad_arg2Event(s);
	}

	pointcut Byte_BadParsingArgs_bad_arg(String s, int radix) : (call(* Byte.parseByte(String, int)) && args(s, radix)) && MOP_CommonPointCut();
	before (String s, int radix) : Byte_BadParsingArgs_bad_arg(s, radix) {
		MultiSpec_1RuntimeMonitor.Byte_BadParsingArgs_bad_argEvent(s, radix);
	}

	pointcut Short_BadParsingArgs_bad_arg2(String s) : (call(* Short.parseShort(String)) && args(s)) && MOP_CommonPointCut();
	before (String s) : Short_BadParsingArgs_bad_arg2(s) {
		MultiSpec_1RuntimeMonitor.Short_BadParsingArgs_bad_arg2Event(s);
	}

	pointcut Short_BadParsingArgs_bad_arg(String s, int radix) : (call(* Short.parseShort(String, int)) && args(s, radix)) && MOP_CommonPointCut();
	before (String s, int radix) : Short_BadParsingArgs_bad_arg(s, radix) {
		MultiSpec_1RuntimeMonitor.Short_BadParsingArgs_bad_argEvent(s, radix);
	}

	pointcut Throwable_InitCauseOnce_initCause(Throwable t) : (call(* Throwable+.initCause(..)) && target(t)) && MOP_CommonPointCut();
	before (Throwable t) : Throwable_InitCauseOnce_initCause(t) {
		MultiSpec_1RuntimeMonitor.Throwable_InitCauseOnce_initCauseEvent(t);
	}

	pointcut CharSequence_NotInSet_set_addall(Collection c) : (call(* Set+.addAll(Collection)) && args(c)) && MOP_CommonPointCut();
	before (Collection c) : CharSequence_NotInSet_set_addall(c) {
		MultiSpec_1RuntimeMonitor.CharSequence_NotInSet_set_addallEvent(c);
	}

	pointcut CharSequence_NotInSet_set_add() : (call(* Set+.add(..)) && args(CharSequence) && !args(String) && !args(CharBuffer)) && MOP_CommonPointCut();
	before () : CharSequence_NotInSet_set_add() {
		MultiSpec_1RuntimeMonitor.CharSequence_NotInSet_set_addEvent();
	}

	pointcut Appendable_ThreadSafe_safe_append(Appendable a) : (call(* Appendable+.append(..)) && target(a) && !target(StringBuffer)) && MOP_CommonPointCut();
	before (Appendable a) : Appendable_ThreadSafe_safe_append(a) {
		Thread t = Thread.currentThread();
		//Appendable_ThreadSafe_unsafe_append
		MultiSpec_1RuntimeMonitor.Appendable_ThreadSafe_unsafe_appendEvent(a, t);
		//Appendable_ThreadSafe_safe_append
		MultiSpec_1RuntimeMonitor.Appendable_ThreadSafe_safe_appendEvent(a, t);
	}

	pointcut Math_ContendedRandom_onethread_use() : (call(* Math.random(..))) && MOP_CommonPointCut();
	before () : Math_ContendedRandom_onethread_use() {
		Thread t = Thread.currentThread();
		//Math_ContendedRandom_otherthread_use
		MultiSpec_1RuntimeMonitor.Math_ContendedRandom_otherthread_useEvent(t);
		//Math_ContendedRandom_onethread_use
		MultiSpec_1RuntimeMonitor.Math_ContendedRandom_onethread_useEvent(t);
	}

	pointcut ProcessBuilder_ThreadSafe_safe_oper(ProcessBuilder p) : (call(* ProcessBuilder.*(..)) && target(p)) && MOP_CommonPointCut();
	before (ProcessBuilder p) : ProcessBuilder_ThreadSafe_safe_oper(p) {
		Thread t = Thread.currentThread();
		//ProcessBuilder_ThreadSafe_unsafe_oper
		MultiSpec_1RuntimeMonitor.ProcessBuilder_ThreadSafe_unsafe_operEvent(p, t);
		//ProcessBuilder_ThreadSafe_safe_oper
		MultiSpec_1RuntimeMonitor.ProcessBuilder_ThreadSafe_safe_operEvent(p, t);
	}

	pointcut Thread_StartOnce_start(Thread t) : (call(* Thread+.start()) && target(t)) && MOP_CommonPointCut();
	before (Thread t) : Thread_StartOnce_start(t) {
		MultiSpec_1RuntimeMonitor.Thread_StartOnce_startEvent(t);
	}

	pointcut Byte_BadDecodeArg_decode(Byte b, String nm) : (call(* Byte.decode(String)) && target(b) && args(nm)) && MOP_CommonPointCut();
	before (Byte b, String nm) : Byte_BadDecodeArg_decode(b, nm) {
		MultiSpec_1RuntimeMonitor.Byte_BadDecodeArg_decodeEvent(b, nm);
	}

	pointcut Thread_SetDaemonBeforeStart_setDaemon(Thread t) : (call(* Thread+.setDaemon(..)) && target(t)) && MOP_CommonPointCut();
	before (Thread t) : Thread_SetDaemonBeforeStart_setDaemon(t) {
		MultiSpec_1RuntimeMonitor.Thread_SetDaemonBeforeStart_setDaemonEvent(t);
	}

	pointcut Comparable_CompareToNull_nullcompare(Object o) : (call(* Comparable+.compareTo(..)) && args(o) && if(o == null)) && MOP_CommonPointCut();
	before (Object o) : Comparable_CompareToNull_nullcompare(o) {
		MultiSpec_1RuntimeMonitor.Comparable_CompareToNull_nullcompareEvent(o);
	}

	pointcut ClassLoader_UnsafeClassDefinition_defineClass(String name) : (call(* ClassLoader+.defineClass(String, ..)) && args(name, ..)) && MOP_CommonPointCut();
	before (String name) : ClassLoader_UnsafeClassDefinition_defineClass(name) {
		MultiSpec_1RuntimeMonitor.ClassLoader_UnsafeClassDefinition_defineClassEvent(name);
	}

	pointcut Object_MonitorOwner_bad_wait(Object o) : (call(* Object+.wait(..)) && target(o) && if(!Thread.holdsLock(o))) && MOP_CommonPointCut();
	before (Object o) : Object_MonitorOwner_bad_wait(o) {
		MultiSpec_1RuntimeMonitor.Object_MonitorOwner_bad_waitEvent(o);
	}

	pointcut Object_MonitorOwner_bad_notify(Object o) : ((call(* Object+.notify(..)) || call(* Object+.notifyAll(..))) && target(o) && if(!Thread.holdsLock(o))) && MOP_CommonPointCut();
	before (Object o) : Object_MonitorOwner_bad_notify(o) {
		MultiSpec_1RuntimeMonitor.Object_MonitorOwner_bad_notifyEvent(o);
	}

	pointcut System_WrongKeyOrValue_nullQuery(Map map, Object o) : ((call(* Map.containsKey(..)) || call(* Map.containsValue(..)) || call(* Map.get(..)) || call(* Map.remove(..))) && target(map) && args(o)) && MOP_CommonPointCut();
	before (Map map, Object o) : System_WrongKeyOrValue_nullQuery(map, o) {
		//ProcessBuilder_NullKeyOrValue_nullQuery
		MultiSpec_1RuntimeMonitor.ProcessBuilder_NullKeyOrValue_nullQueryEvent(map, o);
		//System_WrongKeyOrValue_notStringQuery
		MultiSpec_1RuntimeMonitor.System_WrongKeyOrValue_notStringQueryEvent(map, o);
		//System_WrongKeyOrValue_nullQuery
		MultiSpec_1RuntimeMonitor.System_WrongKeyOrValue_nullQueryEvent(map, o);
	}

	pointcut System_WrongKeyOrValue_nullPut_4(Map map, Map map2) : (call(* Map.putAll(Map)) && args(map2) && target(map)) && MOP_CommonPointCut();
	before (Map map, Map map2) : System_WrongKeyOrValue_nullPut_4(map, map2) {
		//ProcessBuilder_NullKeyOrValue_nullPut_8
		MultiSpec_1RuntimeMonitor.ProcessBuilder_NullKeyOrValue_nullPutEvent(map, map2);
		//System_WrongKeyOrValue_nullPut_4
		MultiSpec_1RuntimeMonitor.System_WrongKeyOrValue_nullPutEvent(map, map2);
	}

	pointcut System_WrongKeyOrValue_nullPut_3(Map map, Object key, Object value) : (call(* Map.put(..)) && args(key, value) && target(map)) && MOP_CommonPointCut();
	before (Map map, Object key, Object value) : System_WrongKeyOrValue_nullPut_3(map, key, value) {
		//ProcessBuilder_NullKeyOrValue_nullPut_7
		MultiSpec_1RuntimeMonitor.ProcessBuilder_NullKeyOrValue_nullPutEvent(map, key, value);
		//System_WrongKeyOrValue_nullPut_3
		MultiSpec_1RuntimeMonitor.System_WrongKeyOrValue_nullPutEvent(map, key, value);
	}

	pointcut Enum_NoOrdinal_ordinal() : (call(* Enum+.ordinal())) && MOP_CommonPointCut();
	before () : Enum_NoOrdinal_ordinal() {
		MultiSpec_1RuntimeMonitor.Enum_NoOrdinal_ordinalEvent();
	}

	pointcut CharSequence_NotInMap_map_putall(Map map, Map m) : (call(* Map+.putAll(Map)) && args(m) && target(map)) && MOP_CommonPointCut();
	before (Map map, Map m) : CharSequence_NotInMap_map_putall(map, m) {
		MultiSpec_1RuntimeMonitor.CharSequence_NotInMap_map_putallEvent(map, m);
	}

	pointcut CharSequence_NotInMap_map_put(Map map) : (call(* Map+.put(..)) && target(map) && args(CharSequence, ..) && !args(String, ..) && !args(CharBuffer, ..)) && MOP_CommonPointCut();
	before (Map map) : CharSequence_NotInMap_map_put(map) {
		MultiSpec_1RuntimeMonitor.CharSequence_NotInMap_map_putEvent(map);
	}

	pointcut Character_ValidateChar_toCodePoint(char high, char low) : (call(* Character.toCodePoint(char, char)) && args(high, low)) && MOP_CommonPointCut();
	before (char high, char low) : Character_ValidateChar_toCodePoint(high, low) {
		MultiSpec_1RuntimeMonitor.Character_ValidateChar_toCodePointEvent(high, low);
	}

	pointcut Character_ValidateChar_charCount(int codePoint) : (call(* Character.charCount(int)) && args(codePoint)) && MOP_CommonPointCut();
	before (int codePoint) : Character_ValidateChar_charCount(codePoint) {
		MultiSpec_1RuntimeMonitor.Character_ValidateChar_charCountEvent(codePoint);
	}

	pointcut System_NullArrayCopy_null_arraycopy(Object src, int srcPos, Object dest, int destPos, int length) : (call(* System.arraycopy(Object, int, Object, int, int)) && args(src, srcPos, dest, destPos, length)) && MOP_CommonPointCut();
	before (Object src, int srcPos, Object dest, int destPos, int length) : System_NullArrayCopy_null_arraycopy(src, srcPos, dest, destPos, length) {
		MultiSpec_1RuntimeMonitor.System_NullArrayCopy_null_arraycopyEvent(src, srcPos, dest, destPos, length);
	}

	pointcut StringBuffer_SingleThreadUsage_use(StringBuffer s) : (call(* StringBuffer.*(..)) && target(s)) && MOP_CommonPointCut();
	before (StringBuffer s) : StringBuffer_SingleThreadUsage_use(s) {
		Thread t = Thread.currentThread();
		MultiSpec_1RuntimeMonitor.StringBuffer_SingleThreadUsage_useEvent(s, t);
	}

	pointcut SecurityManager_Permission_check(SecurityManager manager, Object context) : (call(* SecurityManager.checkPermission(Permission, Object)) && target(manager) && args(.., context)) && MOP_CommonPointCut();
	before (SecurityManager manager, Object context) : SecurityManager_Permission_check(manager, context) {
		MultiSpec_1RuntimeMonitor.SecurityManager_Permission_checkEvent(manager, context);
	}

	pointcut Integer_BadDecodeArg_decode(Integer i, String nm) : (call(* Integer.decode(String)) && args(nm) && target(i)) && MOP_CommonPointCut();
	before (Integer i, String nm) : Integer_BadDecodeArg_decode(i, nm) {
		MultiSpec_1RuntimeMonitor.Integer_BadDecodeArg_decodeEvent(i, nm);
	}

	pointcut Object_NoClone_clone(Object o) : (call(* Object.clone()) && !within(org.apache.xerces.dom.NodeImpl) && !within(org.apache.batik.bridge.UpdateManager) && !within(org.codehaus.janino.ScriptEvaluator) && !within(org.apache.batik.ext.awt.image.codec.png.PNGEncodeParam) && !within(org.apache.batik.ext.awt.image.spi.MagicNumberRegistryEntry) && !within(org.apache.xerces.util.XMLCatalogResolver) && target(o)) && MOP_CommonPointCut();
	before (Object o) : Object_NoClone_clone(o) {
		MultiSpec_1RuntimeMonitor.Object_NoClone_cloneEvent(o);
	}

	pointcut Enum_UserFriendlyName_name() : (call(* Enum+.name())) && MOP_CommonPointCut();
	before () : Enum_UserFriendlyName_name() {
		MultiSpec_1RuntimeMonitor.Enum_UserFriendlyName_nameEvent();
	}

	pointcut Enum_NoExtraWhiteSpace_valueOf(Class c, String name) : (call(* Enum+.valueOf(Class, String)) && args(c, name)) && MOP_CommonPointCut();
	before (Class c, String name) : Enum_NoExtraWhiteSpace_valueOf(c, name) {
		MultiSpec_1RuntimeMonitor.Enum_NoExtraWhiteSpace_valueOfEvent(c, name);
	}

	pointcut ShutdownHook_PrematureStart_userstart(Thread t) : (call(* Thread+.start(..)) && target(t)) && MOP_CommonPointCut();
	before (Thread t) : ShutdownHook_PrematureStart_userstart(t) {
		MultiSpec_1RuntimeMonitor.ShutdownHook_PrematureStart_userstartEvent(t);
	}

	pointcut ShutdownHook_UnsafeSwingCall_unregister(Thread t) : (call(* Runtime+.removeShutdownHook(..)) && args(t)) && MOP_CommonPointCut();
	before (Thread t) : ShutdownHook_UnsafeSwingCall_unregister(t) {
		boolean MOP_skipAroundAdvice = false;
		//ShutdownHook_SystemExit_unregister
		MultiSpec_1RuntimeMonitor.ShutdownHook_SystemExit_unregisterEvent(t);
		//ShutdownHook_PrematureStart_unregister
		MultiSpec_1RuntimeMonitor.ShutdownHook_PrematureStart_unregisterEvent(t);
		//ShutdownHook_UnsafeAWTCall_unregister
		MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeAWTCall_unregisterEvent(t);
		//ShutdownHook_UnsafeSwingCall_unregister
		MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeSwingCall_unregisterEvent(t);
	}

	pointcut ShutdownHook_UnsafeSwingCall_register(Thread t) : (call(* Runtime+.addShutdownHook(..)) && args(t)) && MOP_CommonPointCut();
	before (Thread t) : ShutdownHook_UnsafeSwingCall_register(t) {
		boolean MOP_skipAroundAdvice = false;
		//ShutdownHook_SystemExit_register
		MultiSpec_1RuntimeMonitor.ShutdownHook_SystemExit_registerEvent(t);
		//ShutdownHook_PrematureStart_bad_register
		MultiSpec_1RuntimeMonitor.ShutdownHook_PrematureStart_bad_registerEvent(t);
		//ShutdownHook_PrematureStart_good_register
		MultiSpec_1RuntimeMonitor.ShutdownHook_PrematureStart_good_registerEvent(t);
		//ShutdownHook_UnsafeAWTCall_register
		MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeAWTCall_registerEvent(t);
		//ShutdownHook_UnsafeSwingCall_register
		MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeSwingCall_registerEvent(t);
	}

	pointcut Long_BadDecodeArg_decode(Long l, String nm) : (call(* Long.decode(String)) && args(nm) && target(l)) && MOP_CommonPointCut();
	before (Long l, String nm) : Long_BadDecodeArg_decode(l, nm) {
		MultiSpec_1RuntimeMonitor.Long_BadDecodeArg_decodeEvent(l, nm);
	}

	pointcut StringBuilder_ThreadSafe_safe_oper(StringBuilder b) : (call(* StringBuilder.*(..)) && target(b)) && MOP_CommonPointCut();
	before (StringBuilder b) : StringBuilder_ThreadSafe_safe_oper(b) {
		Thread t = Thread.currentThread();
		//StringBuilder_ThreadSafe_unsafe_oper
		MultiSpec_1RuntimeMonitor.StringBuilder_ThreadSafe_unsafe_operEvent(b, t);
		//StringBuilder_ThreadSafe_safe_oper
		MultiSpec_1RuntimeMonitor.StringBuilder_ThreadSafe_safe_operEvent(b, t);
	}

	pointcut Long_BadParsingArgs_bad_arg2(String s) : (call(* Long.parseLong(String)) && args(s)) && MOP_CommonPointCut();
	before (String s) : Long_BadParsingArgs_bad_arg2(s) {
		MultiSpec_1RuntimeMonitor.Long_BadParsingArgs_bad_arg2Event(s);
	}

	pointcut Long_BadParsingArgs_bad_arg(String s, int radix) : (call(* Long.parseLong(String, int)) && args(s, radix)) && MOP_CommonPointCut();
	before (String s, int radix) : Long_BadParsingArgs_bad_arg(s, radix) {
		MultiSpec_1RuntimeMonitor.Long_BadParsingArgs_bad_argEvent(s, radix);
	}

	pointcut Short_BadDecodeArg_decode(Short s, String nm) : (call(* Short.decode(String)) && args(nm) && target(s)) && MOP_CommonPointCut();
	before (Short s, String nm) : Short_BadDecodeArg_decode(s, nm) {
		MultiSpec_1RuntimeMonitor.Short_BadDecodeArg_decodeEvent(s, nm);
	}

	pointcut CharSequence_UndefinedHashCode_hashCode() : (call(* CharSequence+.hashCode(..)) && !target(String) && !target(CharBuffer)) && MOP_CommonPointCut();
	before () : CharSequence_UndefinedHashCode_hashCode() {
		MultiSpec_1RuntimeMonitor.CharSequence_UndefinedHashCode_hashCodeEvent();
	}

	pointcut CharSequence_UndefinedHashCode_equals() : (call(* CharSequence+.equals(..)) && !target(String) && !target(CharBuffer)) && MOP_CommonPointCut();
	before () : CharSequence_UndefinedHashCode_equals() {
		MultiSpec_1RuntimeMonitor.CharSequence_UndefinedHashCode_equalsEvent();
	}

	pointcut URLDecoder_DecodeUTF8_decode(String enc) : (call(* URLDecoder.decode(String, String)) && args(*, enc)) && MOP_CommonPointCut();
	before (String enc) : URLDecoder_DecodeUTF8_decode(enc) {
		MultiSpec_1RuntimeMonitor.URLDecoder_DecodeUTF8_decodeEvent(enc);
	}

	pointcut InetSocketAddress_Port_construct(int port) : ((call(InetSocketAddress.new(int)) || call(InetSocketAddress.new(InetAddress, int)) || call(InetSocketAddress.new(String, int)) || call(* InetSocketAddress.createUnresolved(String, int))) && args(.., port)) && MOP_CommonPointCut();
	before (int port) : InetSocketAddress_Port_construct(port) {
		MultiSpec_1RuntimeMonitor.InetSocketAddress_Port_constructEvent(port);
	}

	pointcut Socket_SetTimeoutBeforeBlockingOutput_enter(OutputStream output) : (call(* OutputStream+.write(..)) && target(output)) && MOP_CommonPointCut();
	before (OutputStream output) : Socket_SetTimeoutBeforeBlockingOutput_enter(output) {
		MultiSpec_1RuntimeMonitor.Socket_SetTimeoutBeforeBlockingOutput_enterEvent(output);
	}

	pointcut Socket_InputStreamUnavailable_shutdown(Socket sock) : (call(* Socket+.shutdownInput()) && target(sock)) && MOP_CommonPointCut();
	before (Socket sock) : Socket_InputStreamUnavailable_shutdown(sock) {
		MultiSpec_1RuntimeMonitor.Socket_InputStreamUnavailable_shutdownEvent(sock);
	}

	pointcut Socket_InputStreamUnavailable_get(Socket sock) : (call(* Socket+.getInputStream(..)) && target(sock)) && MOP_CommonPointCut();
	before (Socket sock) : Socket_InputStreamUnavailable_get(sock) {
		MultiSpec_1RuntimeMonitor.Socket_InputStreamUnavailable_getEvent(sock);
	}

	pointcut ServerSocket_LargeReceiveBuffer_set(ServerSocket sock, int size) : (call(* ServerSocket+.setReceiveBufferSize(int)) && target(sock) && args(size)) && MOP_CommonPointCut();
	before (ServerSocket sock, int size) : ServerSocket_LargeReceiveBuffer_set(sock, size) {
		MultiSpec_1RuntimeMonitor.ServerSocket_LargeReceiveBuffer_setEvent(sock, size);
	}

	pointcut NetPermission_Actions_construct(String actions) : (call(NetPermission.new(String, String)) && args(.., actions)) && MOP_CommonPointCut();
	before (String actions) : NetPermission_Actions_construct(actions) {
		MultiSpec_1RuntimeMonitor.NetPermission_Actions_constructEvent(actions);
	}

	pointcut ContentHandler_GetContent_get_content() : (call(* ContentHandler+.getContent(..))) && MOP_CommonPointCut();
	before () : ContentHandler_GetContent_get_content() {
		MultiSpec_1RuntimeMonitor.ContentHandler_GetContent_get_contentEvent();
	}

	pointcut DatagramSocket_TrafficClass_settc(DatagramSocket socket, int tc) : (call(void DatagramSocket.setTrafficClass(int)) && target(socket) && args(tc)) && MOP_CommonPointCut();
	before (DatagramSocket socket, int tc) : DatagramSocket_TrafficClass_settc(socket, tc) {
		MultiSpec_1RuntimeMonitor.DatagramSocket_TrafficClass_settcEvent(socket, tc);
	}

	pointcut SocketImpl_CloseOutput_close(SocketImpl sock) : ((call(* SocketImpl+.close(..)) || call(* SocketImpl+.shutdownOutput(..))) && target(sock)) && MOP_CommonPointCut();
	before (SocketImpl sock) : SocketImpl_CloseOutput_close(sock) {
		MultiSpec_1RuntimeMonitor.SocketImpl_CloseOutput_closeEvent(sock);
	}

	pointcut IDN_ToAscii_toascii(String input) : ((call(* IDN.toASCII(String)) || call(* IDN.toASCII(String, int))) && args(input, ..)) && MOP_CommonPointCut();
	before (String input) : IDN_ToAscii_toascii(input) {
		MultiSpec_1RuntimeMonitor.IDN_ToAscii_toasciiEvent(input);
	}

	pointcut Socket_TrafficClass_settc(Socket socket, int tc) : (call(void Socket.setTrafficClass(int)) && target(socket) && args(tc)) && MOP_CommonPointCut();
	before (Socket socket, int tc) : Socket_TrafficClass_settc(socket, tc) {
		MultiSpec_1RuntimeMonitor.Socket_TrafficClass_settcEvent(socket, tc);
	}

	pointcut SocketPermission_Actions_construct(String actions) : (call(SocketPermission.new(String, String)) && args(*, actions)) && MOP_CommonPointCut();
	before (String actions) : SocketPermission_Actions_construct(actions) {
		MultiSpec_1RuntimeMonitor.SocketPermission_Actions_constructEvent(actions);
	}

	pointcut URLEncoder_EncodeUTF8_encode(String enc) : (call(* URLEncoder.encode(String, String)) && args(*, enc)) && MOP_CommonPointCut();
	before (String enc) : URLEncoder_EncodeUTF8_encode(enc) {
		MultiSpec_1RuntimeMonitor.URLEncoder_EncodeUTF8_encodeEvent(enc);
	}

	pointcut ServerSocket_PerformancePreferences_set(ServerSocket sock) : (call(* ServerSocket+.setPerformancePreferences(..)) && target(sock)) && MOP_CommonPointCut();
	before (ServerSocket sock) : ServerSocket_PerformancePreferences_set(sock) {
		MultiSpec_1RuntimeMonitor.ServerSocket_PerformancePreferences_setEvent(sock);
	}

	pointcut DatagramSocket_SoTimeout_settimeout(int timeout) : (call(void DatagramSocket.setSoTimeout(int)) && args(timeout)) && MOP_CommonPointCut();
	before (int timeout) : DatagramSocket_SoTimeout_settimeout(timeout) {
		MultiSpec_1RuntimeMonitor.DatagramSocket_SoTimeout_settimeoutEvent(timeout);
	}

	pointcut ServerSocket_Port_construct_port(int port) : ((call(ServerSocket.new(int)) || call(ServerSocket.new(int, int)) || call(ServerSocket.new(int, int, InetAddress))) && args(port, ..)) && MOP_CommonPointCut();
	before (int port) : ServerSocket_Port_construct_port(port) {
		MultiSpec_1RuntimeMonitor.ServerSocket_Port_construct_portEvent(port);
	}

	pointcut Socket_CloseInput_use(InputStream input) : (call(* InputStream+.*(..)) && target(input)) && MOP_CommonPointCut();
	before (InputStream input) : Socket_CloseInput_use(input) {
		MultiSpec_1RuntimeMonitor.Socket_CloseInput_useEvent(input);
	}

	pointcut URLConnection_SetBeforeConnect_connect(URLConnection c) : ((call(* URLConnection+.connect(..)) || call(* URLConnection+.getContent(..)) || call(* URLConnection+.getContentEncoding(..)) || call(* URLConnection+.getContentLength(..)) || call(* URLConnection+.getContentType(..)) || call(* URLConnection+.getDate(..)) || call(* URLConnection+.getExpiration(..)) || call(* URLConnection+.getHeaderField(..)) || call(* URLConnection+.getHeaderFieldInt(..)) || call(* URLConnection+.getHeaderFields(..)) || call(* URLConnection+.getInputStream(..)) || call(* URLConnection+.getLastModified(..)) || call(* URLConnection+.getOutputStream(..))) && target(c)) && MOP_CommonPointCut();
	before (URLConnection c) : URLConnection_SetBeforeConnect_connect(c) {
		MultiSpec_1RuntimeMonitor.URLConnection_SetBeforeConnect_connectEvent(c);
	}

	pointcut URLConnection_SetBeforeConnect_set(URLConnection c) : (call(* URLConnection+.set*(..)) && target(c)) && MOP_CommonPointCut();
	before (URLConnection c) : URLConnection_SetBeforeConnect_set(c) {
		MultiSpec_1RuntimeMonitor.URLConnection_SetBeforeConnect_setEvent(c);
	}

	pointcut DatagramSocket_Port_construct_port(int port) : ((call(DatagramSocket.new(int)) || call(DatagramSocket.new(int, InetAddress))) && args(port, ..)) && MOP_CommonPointCut();
	before (int port) : DatagramSocket_Port_construct_port(port) {
		MultiSpec_1RuntimeMonitor.DatagramSocket_Port_construct_portEvent(port);
	}

	pointcut URL_SetURLStreamHandlerFactory_set() : (call(* URL.setURLStreamHandlerFactory(..))) && MOP_CommonPointCut();
	before () : URL_SetURLStreamHandlerFactory_set() {
		MultiSpec_1RuntimeMonitor.URL_SetURLStreamHandlerFactory_setEvent();
	}

	pointcut ServerSocket_SetTimeoutBeforeBlocking_set(ServerSocket sock, int timeout) : (call(* ServerSocket+.setSoTimeout(int)) && target(sock) && args(timeout)) && MOP_CommonPointCut();
	before (ServerSocket sock, int timeout) : ServerSocket_SetTimeoutBeforeBlocking_set(sock, timeout) {
		MultiSpec_1RuntimeMonitor.ServerSocket_SetTimeoutBeforeBlocking_setEvent(sock, timeout);
	}

	pointcut ServerSocket_SetTimeoutBeforeBlocking_enter(ServerSocket sock) : (call(* ServerSocket+.accept(..)) && target(sock)) && MOP_CommonPointCut();
	before (ServerSocket sock) : ServerSocket_SetTimeoutBeforeBlocking_enter(sock) {
		MultiSpec_1RuntimeMonitor.ServerSocket_SetTimeoutBeforeBlocking_enterEvent(sock);
	}

	pointcut NetPermission_Name_construct(String name) : ((call(NetPermission.new(String)) || call(NetPermission.new(String, String))) && args(name, ..)) && MOP_CommonPointCut();
	before (String name) : NetPermission_Name_construct(name) {
		MultiSpec_1RuntimeMonitor.NetPermission_Name_constructEvent(name);
	}

	pointcut Socket_LargeReceiveBuffer_set(Socket sock, int size) : (call(* Socket+.setReceiveBufferSize(int)) && target(sock) && args(size)) && MOP_CommonPointCut();
	before (Socket sock, int size) : Socket_LargeReceiveBuffer_set(sock, size) {
		MultiSpec_1RuntimeMonitor.Socket_LargeReceiveBuffer_setEvent(sock, size);
	}

	pointcut Socket_ReuseAddress_set(Socket sock) : (call(* Socket+.setReuseAddress(..)) && target(sock)) && MOP_CommonPointCut();
	before (Socket sock) : Socket_ReuseAddress_set(sock) {
		MultiSpec_1RuntimeMonitor.Socket_ReuseAddress_setEvent(sock);
	}

	pointcut HttpCookie_Domain_setdomain(String domain) : (call(void HttpCookie.setDomain(String)) && args(domain)) && MOP_CommonPointCut();
	before (String domain) : HttpCookie_Domain_setdomain(domain) {
		MultiSpec_1RuntimeMonitor.HttpCookie_Domain_setdomainEvent(domain);
	}

	pointcut ServerSocket_ReuseAddress_set(ServerSocket sock) : (call(* ServerSocket+.setReuseAddress(..)) && target(sock)) && MOP_CommonPointCut();
	before (ServerSocket sock) : ServerSocket_ReuseAddress_set(sock) {
		MultiSpec_1RuntimeMonitor.ServerSocket_ReuseAddress_setEvent(sock);
	}

	pointcut ServerSocket_ReuseAddress_bind(ServerSocket sock) : (call(* ServerSocket+.bind(..)) && target(sock)) && MOP_CommonPointCut();
	before (ServerSocket sock) : ServerSocket_ReuseAddress_bind(sock) {
		//ServerSocket_LargeReceiveBuffer_bind
		MultiSpec_1RuntimeMonitor.ServerSocket_LargeReceiveBuffer_bindEvent(sock);
		//ServerSocket_PerformancePreferences_bind
		MultiSpec_1RuntimeMonitor.ServerSocket_PerformancePreferences_bindEvent(sock);
		//ServerSocket_ReuseAddress_bind
		MultiSpec_1RuntimeMonitor.ServerSocket_ReuseAddress_bindEvent(sock);
	}

	pointcut Socket_SetTimeoutBeforeBlockingInput_set(Socket sock, int timeout) : (call(* Socket+.setSoTimeout(int)) && target(sock) && args(timeout)) && MOP_CommonPointCut();
	before (Socket sock, int timeout) : Socket_SetTimeoutBeforeBlockingInput_set(sock, timeout) {
		//Socket_SetTimeoutBeforeBlockingOutput_set
		MultiSpec_1RuntimeMonitor.Socket_SetTimeoutBeforeBlockingOutput_setEvent(sock, timeout);
		//Socket_SetTimeoutBeforeBlockingInput_set
		MultiSpec_1RuntimeMonitor.Socket_SetTimeoutBeforeBlockingInput_setEvent(sock, timeout);
	}

	pointcut Socket_SetTimeoutBeforeBlockingInput_enter(InputStream input) : (call(* InputStream+.read(..)) && target(input)) && MOP_CommonPointCut();
	before (InputStream input) : Socket_SetTimeoutBeforeBlockingInput_enter(input) {
		MultiSpec_1RuntimeMonitor.Socket_SetTimeoutBeforeBlockingInput_enterEvent(input);
	}

	pointcut Socket_Timeout_set(int timeout) : (call(* Socket+.setSoTimeout(int)) && args(timeout)) && MOP_CommonPointCut();
	before (int timeout) : Socket_Timeout_set(timeout) {
		MultiSpec_1RuntimeMonitor.Socket_Timeout_setEvent(timeout);
	}

	pointcut InetAddress_IsReachable_isreachable_4(int ttl, int timeout) : (call(* InetAddress+.isReachable(NetworkInterface, int, int)) && args(*, ttl, timeout)) && MOP_CommonPointCut();
	before (int ttl, int timeout) : InetAddress_IsReachable_isreachable_4(ttl, timeout) {
		MultiSpec_1RuntimeMonitor.InetAddress_IsReachable_isreachableEvent(ttl, timeout);
	}

	pointcut InetAddress_IsReachable_isreachable_3(int timeout) : (call(* InetAddress+.isReachable(int)) && args(timeout)) && MOP_CommonPointCut();
	before (int timeout) : InetAddress_IsReachable_isreachable_3(timeout) {
		MultiSpec_1RuntimeMonitor.InetAddress_IsReachable_isreachableEvent(timeout);
	}

	pointcut HttpURLConnection_SetBeforeConnect_connect(HttpURLConnection c) : ((call(* URLConnection+.connect(..)) || call(* URLConnection+.getContent(..)) || call(* URLConnection+.getContentEncoding(..)) || call(* URLConnection+.getContentLength(..)) || call(* URLConnection+.getContentType(..)) || call(* URLConnection+.getDate(..)) || call(* URLConnection+.getExpiration(..)) || call(* URLConnection+.getHeaderField(..)) || call(* URLConnection+.getHeaderFieldInt(..)) || call(* URLConnection+.getHeaderFields(..)) || call(* URLConnection+.getInputStream(..)) || call(* URLConnection+.getLastModified(..)) || call(* URLConnection+.getOutputStream(..)) || call(* HttpURLConnection+.getErrorStream(..)) || call(* HttpURLConnection+.getHeaderFieldDate(..)) || call(* HttpURLConnection+.getHeaderFieldKey(..)) || call(* HttpURLConnection+.getResponseCode(..)) || call(* HttpURLConnection+.getResponseMessage(..))) && target(c)) && MOP_CommonPointCut();
	before (HttpURLConnection c) : HttpURLConnection_SetBeforeConnect_connect(c) {
		MultiSpec_1RuntimeMonitor.HttpURLConnection_SetBeforeConnect_connectEvent(c);
	}

	pointcut HttpURLConnection_SetBeforeConnect_set(HttpURLConnection c) : ((call(* HttpURLConnection+.setFixedLengthStreamingMode(..)) || call(* HttpURLConnection+.setChunkedStreamingMode(..)) || call(* HttpURLConnection+.setRequestMethod(..))) && target(c)) && MOP_CommonPointCut();
	before (HttpURLConnection c) : HttpURLConnection_SetBeforeConnect_set(c) {
		MultiSpec_1RuntimeMonitor.HttpURLConnection_SetBeforeConnect_setEvent(c);
	}

	pointcut ServerSocket_Timeout_set(int timeout) : (call(* ServerSocket+.setSoTimeout(int)) && args(timeout)) && MOP_CommonPointCut();
	before (int timeout) : ServerSocket_Timeout_set(timeout) {
		MultiSpec_1RuntimeMonitor.ServerSocket_Timeout_setEvent(timeout);
	}

	pointcut MulticastSocket_TTL_set2(int ttl) : (call(* MulticastSocket+.setTimeToLive(int)) && args(ttl)) && MOP_CommonPointCut();
	before (int ttl) : MulticastSocket_TTL_set2(ttl) {
		MultiSpec_1RuntimeMonitor.MulticastSocket_TTL_set2Event(ttl);
	}

	pointcut MulticastSocket_TTL_set1(byte ttl) : (call(* MulticastSocket+.setTTL(byte)) && args(ttl)) && MOP_CommonPointCut();
	before (byte ttl) : MulticastSocket_TTL_set1(ttl) {
		MultiSpec_1RuntimeMonitor.MulticastSocket_TTL_set1Event(ttl);
	}

	pointcut ServerSocket_Backlog_set(int backlog) : (call(* ServerSocket+.bind(SocketAddress, int)) && args(*, backlog)) && MOP_CommonPointCut();
	before (int backlog) : ServerSocket_Backlog_set(backlog) {
		MultiSpec_1RuntimeMonitor.ServerSocket_Backlog_setEvent(backlog);
	}

	pointcut ServerSocket_Backlog_construct(int backlog) : ((call(ServerSocket.new(int, int)) || call(ServerSocket.new(int, int, InetAddress))) && args(*, backlog, ..)) && MOP_CommonPointCut();
	before (int backlog) : ServerSocket_Backlog_construct(backlog) {
		MultiSpec_1RuntimeMonitor.ServerSocket_Backlog_constructEvent(backlog);
	}

	pointcut Socket_PerformancePreferences_set(Socket sock) : (call(* Socket+.setPerformancePreferences(..)) && target(sock)) && MOP_CommonPointCut();
	before (Socket sock) : Socket_PerformancePreferences_set(sock) {
		MultiSpec_1RuntimeMonitor.Socket_PerformancePreferences_setEvent(sock);
	}

	pointcut Socket_CloseOutput_use(OutputStream output) : (call(* OutputStream+.*(..)) && target(output)) && MOP_CommonPointCut();
	before (OutputStream output) : Socket_CloseOutput_use(output) {
		//SocketImpl_CloseOutput_use
		MultiSpec_1RuntimeMonitor.SocketImpl_CloseOutput_useEvent(output);
		//Socket_CloseOutput_use
		MultiSpec_1RuntimeMonitor.Socket_CloseOutput_useEvent(output);
	}

	pointcut Socket_CloseOutput_close(Socket sock) : ((call(* Socket+.close(..)) || call(* Socket+.shutdownOutput(..))) && target(sock)) && MOP_CommonPointCut();
	before (Socket sock) : Socket_CloseOutput_close(sock) {
		MultiSpec_1RuntimeMonitor.Socket_CloseOutput_closeEvent(sock);
	}

	pointcut HttpCookie_Name_construct(String name) : (call(HttpCookie.new(String, String)) && args(name, ..)) && MOP_CommonPointCut();
	before (String name) : HttpCookie_Name_construct(name) {
		MultiSpec_1RuntimeMonitor.HttpCookie_Name_constructEvent(name);
	}

	pointcut DatagramPacket_Length_construct_offlen(byte[] buffer, int offset, int length) : ((call(DatagramPacket.new(byte[], int, int)) || call(DatagramPacket.new(byte[], int, int, InetAddress, int)) || call(DatagramPacket.new(byte[], int, int, SocketAddress))) && args(buffer, offset, length, ..)) && MOP_CommonPointCut();
	before (byte[] buffer, int offset, int length) : DatagramPacket_Length_construct_offlen(buffer, offset, length) {
		MultiSpec_1RuntimeMonitor.DatagramPacket_Length_construct_offlenEvent(buffer, offset, length);
	}

	pointcut DatagramPacket_Length_construct_len(byte[] buffer, int length) : ((call(DatagramPacket.new(byte[], int)) || call(DatagramPacket.new(byte[], int, InetAddress, int)) || call(DatagramPacket.new(byte[], int, SocketAddress))) && args(buffer, length, ..)) && MOP_CommonPointCut();
	before (byte[] buffer, int length) : DatagramPacket_Length_construct_len(buffer, length) {
		MultiSpec_1RuntimeMonitor.DatagramPacket_Length_construct_lenEvent(buffer, length);
	}

	pointcut DatagramPacket_SetLength_setlength(DatagramPacket packet, int length) : (call(void DatagramPacket.setLength(int)) && target(packet) && args(length)) && MOP_CommonPointCut();
	before (DatagramPacket packet, int length) : DatagramPacket_SetLength_setlength(packet, length) {
		MultiSpec_1RuntimeMonitor.DatagramPacket_SetLength_setlengthEvent(packet, length);
	}

	pointcut URLConnection_Connect_implicit(URLConnection c) : ((call(* URLConnection+.getContent(..)) || call(* URLConnection+.getContentEncoding(..)) || call(* URLConnection+.getContentLength(..)) || call(* URLConnection+.getContentType(..)) || call(* URLConnection+.getDate(..)) || call(* URLConnection+.getExpiration(..)) || call(* URLConnection+.getHeaderField(..)) || call(* URLConnection+.getHeaderFieldInt(..)) || call(* URLConnection+.getHeaderFields(..)) || call(* URLConnection+.getInputStream(..)) || call(* URLConnection+.getLastModified(..)) || call(* URLConnection+.getOutputStream(..))) && target(c)) && MOP_CommonPointCut();
	before (URLConnection c) : URLConnection_Connect_implicit(c) {
		MultiSpec_1RuntimeMonitor.URLConnection_Connect_implicitEvent(c);
	}

	pointcut URLConnection_Connect_explicit(URLConnection c) : (call(* URLConnection+.connect(..)) && target(c)) && MOP_CommonPointCut();
	before (URLConnection c) : URLConnection_Connect_explicit(c) {
		MultiSpec_1RuntimeMonitor.URLConnection_Connect_explicitEvent(c);
	}

	pointcut Socket_OutputStreamUnavailable_shutdown(Socket sock) : (call(* Socket+.shutdownOutput()) && target(sock)) && MOP_CommonPointCut();
	before (Socket sock) : Socket_OutputStreamUnavailable_shutdown(sock) {
		MultiSpec_1RuntimeMonitor.Socket_OutputStreamUnavailable_shutdownEvent(sock);
	}

	pointcut Socket_OutputStreamUnavailable_close(Socket sock) : (call(* Socket+.close()) && target(sock)) && MOP_CommonPointCut();
	before (Socket sock) : Socket_OutputStreamUnavailable_close(sock) {
		//Socket_InputStreamUnavailable_close
		MultiSpec_1RuntimeMonitor.Socket_InputStreamUnavailable_closeEvent(sock);
		//Socket_OutputStreamUnavailable_close
		MultiSpec_1RuntimeMonitor.Socket_OutputStreamUnavailable_closeEvent(sock);
	}

	pointcut Socket_OutputStreamUnavailable_get(Socket sock) : (call(* Socket+.getOutputStream(..)) && target(sock)) && MOP_CommonPointCut();
	before (Socket sock) : Socket_OutputStreamUnavailable_get(sock) {
		MultiSpec_1RuntimeMonitor.Socket_OutputStreamUnavailable_getEvent(sock);
	}



	


// Two errors below!

	pointcut Comparable_CompareToNullException_badexception(Object o) : (call(* Comparable+.compareTo(..)) && args(o) && if(o == null)) && MOP_CommonPointCut();
	after (Object o) throwing (Exception e) : Comparable_CompareToNullException_badexception(o) {
		MultiSpec_1RuntimeMonitor.Comparable_CompareToNullException_badexceptionEvent(o, e);
	}

	pointcut Comparable_CompareToNullException_badcompare(Object o) : (call(* Comparable+.compareTo(..)) && args(o) && if(o == null)) && MOP_CommonPointCut();
	after (Object o) returning (int i) : Comparable_CompareToNullException_badcompare(o) {
		MultiSpec_1RuntimeMonitor.Comparable_CompareToNullException_badcompareEvent(o, i);
	}

	pointcut Boolean_StaticFactory_constructor_create() : (call(Boolean+.new(boolean))) && MOP_CommonPointCut();
	after () returning (Boolean b) : Boolean_StaticFactory_constructor_create() {
		MultiSpec_1RuntimeMonitor.Boolean_StaticFactory_constructor_createEvent(b);
	}

	pointcut ShutdownHook_SystemExit_exit() : (call(* System.exit(..))) && MOP_CommonPointCut();
	void around () : ShutdownHook_SystemExit_exit() {
		boolean MOP_skipAroundAdvice = false;
		Thread t = Thread.currentThread();
		MultiSpec_1RuntimeMonitor.ShutdownHook_SystemExit_exitEvent(t);
		if(MOP_skipAroundAdvice){
			return;
		} else {
			proceed();
		}
	}

/*
	pointcut StringBuffer_SingleThreadUsage_init() : (call(StringBuffer.new(..))) && MOP_CommonPointCut();
	after () returning (StringBuffer s) : StringBuffer_SingleThreadUsage_init() {
		Thread t = Thread.currentThread();
		MultiSpec_1RuntimeMonitor.StringBuffer_SingleThreadUsage_initEvent(t, s);
	}

	pointcut ShutdownHook_LateRegister_register(Thread t) : (call(* Runtime+.addShutdownHook(..)) && args(t)) && MOP_CommonPointCut();
	after (Thread t) : ShutdownHook_LateRegister_register(t) {
		MultiSpec_1RuntimeMonitor.ShutdownHook_LateRegister_registerEvent(t);
	}

	pointcut ShutdownHook_LateRegister_unregister(Thread t) : (call(* Runtime+.removeShutdownHook(..)) && args(t)) && MOP_CommonPointCut();
	after (Thread t) : ShutdownHook_LateRegister_unregister(t) {
		MultiSpec_1RuntimeMonitor.ShutdownHook_LateRegister_unregisterEvent(t);
	}

	pointcut System_WrongKeyOrValue_createMap() : (call(Map System.getenv())) && MOP_CommonPointCut();
	after () returning (Map map) : System_WrongKeyOrValue_createMap() {
		MultiSpec_1RuntimeMonitor.System_WrongKeyOrValue_createMapEvent(map);
	}

	pointcut ProcessBuilder_NullKeyOrValue_createMap() : (call(* ProcessBuilder.environment())) && MOP_CommonPointCut();
	after () returning (Map map) : ProcessBuilder_NullKeyOrValue_createMap() {
		MultiSpec_1RuntimeMonitor.ProcessBuilder_NullKeyOrValue_createMapEvent(map);
	}

	pointcut Byte_StaticFactory_constructor_create() : (call(Byte+.new(byte))) && MOP_CommonPointCut();
	after () returning (Byte b) : Byte_StaticFactory_constructor_create() {
		MultiSpec_1RuntimeMonitor.Byte_StaticFactory_constructor_createEvent(b);
	}

	pointcut Throwable_InitCauseOnce_createWithoutThrowable() : (call(Throwable+.new()) || call(Throwable+.new(String))) && MOP_CommonPointCut();
	after () returning (Throwable t) : Throwable_InitCauseOnce_createWithoutThrowable() {
		MultiSpec_1RuntimeMonitor.Throwable_InitCauseOnce_createWithoutThrowableEvent(t);
	}

	pointcut Throwable_InitCauseOnce_createWithThrowable() : (call(Throwable+.new(String, Throwable)) || call(Throwable+.new(Throwable))) && MOP_CommonPointCut();
	after () returning (Throwable t) : Throwable_InitCauseOnce_createWithThrowable() {
		MultiSpec_1RuntimeMonitor.Throwable_InitCauseOnce_createWithThrowableEvent(t);
	}

	pointcut Character_StaticFactory_constructor_create() : (call(Character+.new(char))) && MOP_CommonPointCut();
	after () returning (Character b) : Character_StaticFactory_constructor_create() {
		MultiSpec_1RuntimeMonitor.Character_StaticFactory_constructor_createEvent(b);
	}

	pointcut String_UseStringBuilder_constructor_create() : (call(String.new(StringBuilder))) && MOP_CommonPointCut();
	after () returning (String b) : String_UseStringBuilder_constructor_create() {
		MultiSpec_1RuntimeMonitor.String_UseStringBuilder_constructor_createEvent(b);
	}

	static HashMap<Thread, Runnable> ShutdownHook_UnsafeSwingCall_start_ThreadToRunnable = new HashMap<Thread, Runnable>();
	static Thread ShutdownHook_UnsafeSwingCall_start_MainThread = null;

	after (Runnable r) returning (Thread t): ((call(Thread+.new(Runnable+,..)) && args(r,..))|| (initialization(Thread+.new(ThreadGroup+, Runnable+,..)) && args(ThreadGroup, r,..))) && MOP_CommonPointCut() {
		while (!MultiSpec_1_MOPLock.tryLock()) {
			Thread.yield();
		}
		ShutdownHook_UnsafeSwingCall_start_ThreadToRunnable.put(t, r);
		MultiSpec_1_MOPLock.unlock();
	}

	before (Thread t_1): ( execution(void Thread+.run()) && target(t_1) ) && MOP_CommonPointCut() {
		if(Thread.currentThread() == t_1) {
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeSwingCall_startEvent(t);
		}
	}

	before (Runnable r_1): ( execution(void Runnable+.run()) && !execution(void Thread+.run()) && target(r_1) ) && MOP_CommonPointCut() {
		while (!MultiSpec_1_MOPLock.tryLock()) {
			Thread.yield();
		}
		if(ShutdownHook_UnsafeSwingCall_start_ThreadToRunnable.get(Thread.currentThread()) == r_1) {
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeSwingCall_startEvent(t);
		}
		MultiSpec_1_MOPLock.unlock();
	}

	before (): (execution(void *.main(..)) ) && MOP_CommonPointCut() {
		if(ShutdownHook_UnsafeSwingCall_start_MainThread == null){
			ShutdownHook_UnsafeSwingCall_start_MainThread = Thread.currentThread();
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeSwingCall_startEvent(t);
		}
	}

	static HashMap<Thread, Runnable> ShutdownHook_UnsafeAWTCall_start_ThreadToRunnable = new HashMap<Thread, Runnable>();
	static Thread ShutdownHook_UnsafeAWTCall_start_MainThread = null;

	after (Runnable r) returning (Thread t): ((call(Thread+.new(Runnable+,..)) && args(r,..))|| (initialization(Thread+.new(ThreadGroup+, Runnable+,..)) && args(ThreadGroup, r,..))) && MOP_CommonPointCut() {
		while (!MultiSpec_1_MOPLock.tryLock()) {
			Thread.yield();
		}
		ShutdownHook_UnsafeAWTCall_start_ThreadToRunnable.put(t, r);
		MultiSpec_1_MOPLock.unlock();
	}

	before (Thread t_1): ( execution(void Thread+.run()) && target(t_1) ) && MOP_CommonPointCut() {
		if(Thread.currentThread() == t_1) {
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeAWTCall_startEvent(t);
		}
	}

	before (Runnable r_1): ( execution(void Runnable+.run()) && !execution(void Thread+.run()) && target(r_1) ) && MOP_CommonPointCut() {
		while (!MultiSpec_1_MOPLock.tryLock()) {
			Thread.yield();
		}
		if(ShutdownHook_UnsafeAWTCall_start_ThreadToRunnable.get(Thread.currentThread()) == r_1) {
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeAWTCall_startEvent(t);
		}
		MultiSpec_1_MOPLock.unlock();
	}

	before (): (execution(void *.main(..)) ) && MOP_CommonPointCut() {
		if(ShutdownHook_UnsafeAWTCall_start_MainThread == null){
			ShutdownHook_UnsafeAWTCall_start_MainThread = Thread.currentThread();
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeAWTCall_startEvent(t);
		}
	}

	static HashMap<Thread, Runnable> ShutdownHook_SystemExit_start_ThreadToRunnable = new HashMap<Thread, Runnable>();
	static Thread ShutdownHook_SystemExit_start_MainThread = null;

	after (Runnable r) returning (Thread t): ((call(Thread+.new(Runnable+,..)) && args(r,..))|| (initialization(Thread+.new(ThreadGroup+, Runnable+,..)) && args(ThreadGroup, r,..))) && MOP_CommonPointCut() {
		while (!MultiSpec_1_MOPLock.tryLock()) {
			Thread.yield();
		}
		ShutdownHook_SystemExit_start_ThreadToRunnable.put(t, r);
		MultiSpec_1_MOPLock.unlock();
	}

	before (Thread t_1): ( execution(void Thread+.run()) && target(t_1) ) && MOP_CommonPointCut() {
		if(Thread.currentThread() == t_1) {
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_SystemExit_startEvent(t);
		}
	}

	before (Runnable r_1): ( execution(void Runnable+.run()) && !execution(void Thread+.run()) && target(r_1) ) && MOP_CommonPointCut() {
		while (!MultiSpec_1_MOPLock.tryLock()) {
			Thread.yield();
		}
		if(ShutdownHook_SystemExit_start_ThreadToRunnable.get(Thread.currentThread()) == r_1) {
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_SystemExit_startEvent(t);
		}
		MultiSpec_1_MOPLock.unlock();
	}

	before (): (execution(void *.main(..)) ) && MOP_CommonPointCut() {
		if(ShutdownHook_SystemExit_start_MainThread == null){
			ShutdownHook_SystemExit_start_MainThread = Thread.currentThread();
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_SystemExit_startEvent(t);
		}
	}
*/

	class MultiSpec_1_DummyHookThread extends Thread {
		public void run(){
			{
				MultiSpec_1RuntimeMonitor.Console_FillZeroPassword_endProgEvent();
			}
			{
				MultiSpec_1RuntimeMonitor.ObjectOutput_Close_endProgEvent();
			}
			{
				MultiSpec_1RuntimeMonitor.File_DeleteTempFile_endProgEvent();
			}
			{
				MultiSpec_1RuntimeMonitor.ObjectStreamClass_Initialize_endProgEvent();
			}
			{
				MultiSpec_1RuntimeMonitor.ObjectInput_Close_endProgEvent();
			}
			{
				MultiSpec_1RuntimeMonitor.PasswordAuthentication_FillZeroPassword_endProgEvent();
			}
			{
				MultiSpec_1RuntimeMonitor.StringBuffer_SingleThreadUsage_endprogramEvent();
			}
		}
	}
}
