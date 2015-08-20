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

	pointcut Socket_ReuseSocket_connect(Socket sock) : (call(* Socket+.connect(..)) && target(sock)) && MOP_CommonPointCut();
	before (Socket sock) : Socket_ReuseSocket_connect(sock) {
		//Socket_InputStreamUnavailable_connect
		MultiSpec_1RuntimeMonitor.Socket_InputStreamUnavailable_connectEvent(sock);
		//Socket_LargeReceiveBuffer_connect
		MultiSpec_1RuntimeMonitor.Socket_LargeReceiveBuffer_connectEvent(sock);
		//Socket_PerformancePreferences_connect
		MultiSpec_1RuntimeMonitor.Socket_PerformancePreferences_connectEvent(sock);
		//Socket_OutputStreamUnavailable_connect
		MultiSpec_1RuntimeMonitor.Socket_OutputStreamUnavailable_connectEvent(sock);
		//Socket_ReuseSocket_connect
		MultiSpec_1RuntimeMonitor.Socket_ReuseSocket_connectEvent(sock);
	}

	pointcut Socket_ReuseSocket_bind(Socket sock) : (call(* Socket+.bind(..)) && target(sock)) && MOP_CommonPointCut();
	before (Socket sock) : Socket_ReuseSocket_bind(sock) {
		//Socket_ReuseAddress_bind
		MultiSpec_1RuntimeMonitor.Socket_ReuseAddress_bindEvent(sock);
		//Socket_ReuseSocket_bind
		MultiSpec_1RuntimeMonitor.Socket_ReuseSocket_bindEvent(sock);
	}

	pointcut Socket_ReuseSocket_close(Socket sock) : (call(* Socket+.close(..)) && target(sock)) && MOP_CommonPointCut();
	before (Socket sock) : Socket_ReuseSocket_close(sock) {
		//Socket_CloseInput_close
		MultiSpec_1RuntimeMonitor.Socket_CloseInput_closeEvent(sock);
		//Socket_ReuseSocket_close
		MultiSpec_1RuntimeMonitor.Socket_ReuseSocket_closeEvent(sock);
	}

	pointcut Scanner_ManipulateAfterClose_manipulate(Closeable c) : ((call(* InputStream+.read(..)) || call(* InputStream+.available(..)) || call(* InputStream+.reset(..)) || call(* InputStream+.skip(..)) || call(* Readable+.read(..)) || call(* ReadableByteChannel+.read(..))) && target(c) && !target(ByteArrayInputStream) && !target(StringBufferInputStream)) && MOP_CommonPointCut();
	before (Closeable c) : Scanner_ManipulateAfterClose_manipulate(c) {
		MultiSpec_1RuntimeMonitor.Scanner_ManipulateAfterClose_manipulateEvent(c);
	}

	pointcut Dictionary_NullKeyOrValue_putnull(Dictionary d, Object key, Object value) : (call(* Dictionary+.put(..)) && args(key, value) && target(d)) && MOP_CommonPointCut();
	before (Dictionary d, Object key, Object value) : Dictionary_NullKeyOrValue_putnull(d, key, value) {
		MultiSpec_1RuntimeMonitor.Dictionary_NullKeyOrValue_putnullEvent(d, key, value);
	}

	pointcut Scanner_SearchAfterClose_search(Scanner s) : ((call(* Scanner+.find*(..)) || call(* Scanner+.has*(..)) || call(* Scanner+.match(..)) || call(* Scanner+.next*(..)) || call(* Scanner+.skip(..))) && target(s)) && MOP_CommonPointCut();
	before (Scanner s) : Scanner_SearchAfterClose_search(s) {
		MultiSpec_1RuntimeMonitor.Scanner_SearchAfterClose_searchEvent(s);
	}

	pointcut Scanner_SearchAfterClose_close(Scanner s) : (call(* Scanner+.close(..)) && target(s)) && MOP_CommonPointCut();
	before (Scanner s) : Scanner_SearchAfterClose_close(s) {
		MultiSpec_1RuntimeMonitor.Scanner_SearchAfterClose_closeEvent(s);
	}

	pointcut NavigableMap_Modification_modify3(Collection c) : ((call(* Collection+.add(..)) || call(* Collection+.addAll(..))) && target(c)) && MOP_CommonPointCut();
	before (Collection c) : NavigableMap_Modification_modify3(c) {
		//Map_CollectionViewAdd_add
		MultiSpec_1RuntimeMonitor.Map_CollectionViewAdd_addEvent(c);
		//NavigableMap_Modification_modify3
		MultiSpec_1RuntimeMonitor.NavigableMap_Modification_modify3Event(c);
	}

	pointcut NavigableMap_Modification_modify2(NavigableMap m2) : ((call(* Map+.clear*(..)) || call(* Map+.put*(..)) || call(* Map+.remove(..))) && target(m2)) && MOP_CommonPointCut();
	before (NavigableMap m2) : NavigableMap_Modification_modify2(m2) {
		MultiSpec_1RuntimeMonitor.NavigableMap_Modification_modify2Event(m2);
	}

	pointcut NavigableMap_Modification_modify1(NavigableMap m1) : ((call(* Map+.clear*(..)) || call(* Map+.put*(..)) || call(* Map+.remove(..))) && target(m1)) && MOP_CommonPointCut();
	before (NavigableMap m1) : NavigableMap_Modification_modify1(m1) {
		MultiSpec_1RuntimeMonitor.NavigableMap_Modification_modify1Event(m1);
	}

	pointcut Collections_Comparable_invalid_minmax(Collection col, Comparator comp) : ((call(* Collections.min(Collection, Comparator)) || call(* Collections.max(Collection, Comparator))) && args(col, comp)) && MOP_CommonPointCut();
	before (Collection col, Comparator comp) : Collections_Comparable_invalid_minmax(col, comp) {
		MultiSpec_1RuntimeMonitor.Collections_Comparable_invalid_minmaxEvent(col, comp);
	}

	pointcut Collections_Comparable_invalid_sort(List list, Comparator comp) : (call(void Collections.sort(List, Comparator)) && args(list, comp)) && MOP_CommonPointCut();
	before (List list, Comparator comp) : Collections_Comparable_invalid_sort(list, comp) {
		MultiSpec_1RuntimeMonitor.Collections_Comparable_invalid_sortEvent(list, comp);
	}

	pointcut ServiceLoader_MultipleConcurrentThreads_gooduse(ServiceLoader s) : ((call(* ServiceLoader+.iterator()) || call(* ServiceLoader+.reload())) && target(s)) && MOP_CommonPointCut();
	before (ServiceLoader s) : ServiceLoader_MultipleConcurrentThreads_gooduse(s) {
		Thread t2 = Thread.currentThread();
		//ServiceLoader_MultipleConcurrentThreads_baduse
		MultiSpec_1RuntimeMonitor.ServiceLoader_MultipleConcurrentThreads_baduseEvent(s, t2);
		//ServiceLoader_MultipleConcurrentThreads_gooduse
		MultiSpec_1RuntimeMonitor.ServiceLoader_MultipleConcurrentThreads_gooduseEvent(s, t2);
	}

	pointcut ArrayDeque_UnsafeIterator_useiter(Iterator i) : (call(* Iterator.*(..)) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : ArrayDeque_UnsafeIterator_useiter(i) {
		MultiSpec_1RuntimeMonitor.ArrayDeque_UnsafeIterator_useiterEvent(i);
	}

	pointcut ArrayDeque_UnsafeIterator_modify(ArrayDeque q) : (target(ArrayDeque) && (call(* Collection+.add*(..)) || call(* Collection+.clear(..)) || call(* Collection+.offer*(..)) || call(* Collection+.pop(..)) || call(* Collection+.push(..)) || call(* Collection+.remove*(..)) || call(* Collection+.retain*(..))) && target(q)) && MOP_CommonPointCut();
	before (ArrayDeque q) : ArrayDeque_UnsafeIterator_modify(q) {
		MultiSpec_1RuntimeMonitor.ArrayDeque_UnsafeIterator_modifyEvent(q);
	}

	pointcut EnumSet_NonNull_insertnull_16(Collection c) : (call(* EnumSet+.addAll(Collection)) && args(c)) && MOP_CommonPointCut();
	before (Collection c) : EnumSet_NonNull_insertnull_16(c) {
		MultiSpec_1RuntimeMonitor.EnumSet_NonNull_insertnullEvent(c);
	}

	pointcut EnumSet_NonNull_insertnull_15(Object e) : (call(* EnumSet+.add(Object)) && args(e)) && MOP_CommonPointCut();
	before (Object e) : EnumSet_NonNull_insertnull_15(e) {
		MultiSpec_1RuntimeMonitor.EnumSet_NonNull_insertnullEvent(e);
	}

	pointcut Collections_SortBeforeBinarySearch_bsearch2(List list, Comparator comp2) : (call(int Collections.binarySearch(List, Object, Comparator)) && args(list, .., comp2)) && MOP_CommonPointCut();
	before (List list, Comparator comp2) : Collections_SortBeforeBinarySearch_bsearch2(list, comp2) {
		//Collections_SortBeforeBinarySearch_bad_bsearch2
		MultiSpec_1RuntimeMonitor.Collections_SortBeforeBinarySearch_bad_bsearch2Event(list, comp2);
		//Collections_SortBeforeBinarySearch_bsearch2
		MultiSpec_1RuntimeMonitor.Collections_SortBeforeBinarySearch_bsearch2Event(list, comp2);
	}

	pointcut Collections_SortBeforeBinarySearch_bsearch1(List list) : (call(int Collections.binarySearch(List, Object)) && args(list, ..)) && MOP_CommonPointCut();
	before (List list) : Collections_SortBeforeBinarySearch_bsearch1(list) {
		MultiSpec_1RuntimeMonitor.Collections_SortBeforeBinarySearch_bsearch1Event(list);
	}

	pointcut Collections_SortBeforeBinarySearch_modify(List list) : ((call(* Collection+.add*(..)) || call(* Collection+.remove*(..)) || call(* Collection+.clear(..)) || call(* Collection+.retain*(..)) || call(* List+.set(..))) && target(list)) && MOP_CommonPointCut();
	before (List list) : Collections_SortBeforeBinarySearch_modify(list) {
		MultiSpec_1RuntimeMonitor.Collections_SortBeforeBinarySearch_modifyEvent(list);
	}

	pointcut Collections_SortBeforeBinarySearch_sort2(List list, Comparator comp2) : (call(void Collections.sort(List, Comparator)) && args(list, comp2)) && MOP_CommonPointCut();
	before (List list, Comparator comp2) : Collections_SortBeforeBinarySearch_sort2(list, comp2) {
		MultiSpec_1RuntimeMonitor.Collections_SortBeforeBinarySearch_sort2Event(list, comp2);
	}

	pointcut Arrays_MutuallyComparable_invalid_sort(Object[] arr, Comparator comp) : ((call(void Arrays.sort(Object[], Comparator)) || call(void Arrays.sort(Object[], int, int, Comparator))) && args(arr, .., comp)) && MOP_CommonPointCut();
	before (Object[] arr, Comparator comp) : Arrays_MutuallyComparable_invalid_sort(arr, comp) {
		MultiSpec_1RuntimeMonitor.Arrays_MutuallyComparable_invalid_sortEvent(arr, comp);
	}

	pointcut Arrays_SortBeforeBinarySearch_bsearch2_4(Object[] arr, int from, int to, Comparator comp2) : (call(int Arrays.binarySearch(Object[], int, int, Object, Comparator)) && args(arr, from, to, .., comp2)) && MOP_CommonPointCut();
	before (Object[] arr, int from, int to, Comparator comp2) : Arrays_SortBeforeBinarySearch_bsearch2_4(arr, from, to, comp2) {
		MultiSpec_1RuntimeMonitor.Arrays_SortBeforeBinarySearch_bsearch2Event(arr, from, to, comp2);
	}

	pointcut Arrays_SortBeforeBinarySearch_bsearch2_3(Object[] arr, Comparator comp2) : (call(int Arrays.binarySearch(Object[], Object, Comparator)) && args(arr, .., comp2)) && MOP_CommonPointCut();
	before (Object[] arr, Comparator comp2) : Arrays_SortBeforeBinarySearch_bsearch2_3(arr, comp2) {
		MultiSpec_1RuntimeMonitor.Arrays_SortBeforeBinarySearch_bsearch2Event(arr, comp2);
	}

	pointcut Arrays_SortBeforeBinarySearch_bsearch1_4(Object[] arr, int from, int to) : (call(int Arrays.binarySearch(Object[], int, int, Object)) && args(arr, from, to, ..)) && MOP_CommonPointCut();
	before (Object[] arr, int from, int to) : Arrays_SortBeforeBinarySearch_bsearch1_4(arr, from, to) {
		MultiSpec_1RuntimeMonitor.Arrays_SortBeforeBinarySearch_bsearch1Event(arr, from, to);
	}

	pointcut Arrays_SortBeforeBinarySearch_bsearch1_3(Object[] arr) : (call(int Arrays.binarySearch(Object[], Object)) && args(arr, ..)) && MOP_CommonPointCut();
	before (Object[] arr) : Arrays_SortBeforeBinarySearch_bsearch1_3(arr) {
		MultiSpec_1RuntimeMonitor.Arrays_SortBeforeBinarySearch_bsearch1Event(arr);
	}

	pointcut Arrays_SortBeforeBinarySearch_modify(Object[] arr) : (set(Object[] *) && args(arr)) && MOP_CommonPointCut();
	before (Object[] arr) : Arrays_SortBeforeBinarySearch_modify(arr) {
		MultiSpec_1RuntimeMonitor.Arrays_SortBeforeBinarySearch_modifyEvent(arr);
	}

	pointcut Arrays_SortBeforeBinarySearch_sort2_4(Object[] arr, int from, int to, Comparator comp2) : (call(void Arrays.sort(Object[], int, int, Comparator)) && args(arr, from, to, comp2)) && MOP_CommonPointCut();
	before (Object[] arr, int from, int to, Comparator comp2) : Arrays_SortBeforeBinarySearch_sort2_4(arr, from, to, comp2) {
		MultiSpec_1RuntimeMonitor.Arrays_SortBeforeBinarySearch_sort2Event(arr, from, to, comp2);
	}

	pointcut Arrays_SortBeforeBinarySearch_sort2_3(Object[] arr, Comparator comp2) : (call(void Arrays.sort(Object[], Comparator)) && args(arr, comp2)) && MOP_CommonPointCut();
	before (Object[] arr, Comparator comp2) : Arrays_SortBeforeBinarySearch_sort2_3(arr, comp2) {
		MultiSpec_1RuntimeMonitor.Arrays_SortBeforeBinarySearch_sort2Event(arr, comp2);
	}

	pointcut Arrays_SortBeforeBinarySearch_sort1_4(Object[] arr, int from, int to) : (call(void Arrays.sort(Object[], int, int)) && args(arr, from, to)) && MOP_CommonPointCut();
	before (Object[] arr, int from, int to) : Arrays_SortBeforeBinarySearch_sort1_4(arr, from, to) {
		MultiSpec_1RuntimeMonitor.Arrays_SortBeforeBinarySearch_sort1Event(arr, from, to);
	}

	pointcut Arrays_SortBeforeBinarySearch_sort1_3(Object[] arr) : (call(void Arrays.sort(Object[])) && args(arr)) && MOP_CommonPointCut();
	before (Object[] arr) : Arrays_SortBeforeBinarySearch_sort1_3(arr) {
		MultiSpec_1RuntimeMonitor.Arrays_SortBeforeBinarySearch_sort1Event(arr);
	}

	pointcut SortedSet_Comparable_addall(Collection c) : (call(* Collection+.addAll(Collection)) && target(SortedSet) && args(c)) && MOP_CommonPointCut();
	before (Collection c) : SortedSet_Comparable_addall(c) {
		MultiSpec_1RuntimeMonitor.SortedSet_Comparable_addallEvent(c);
	}

	pointcut SortedSet_Comparable_add(Object e) : ((call(* Collection+.add*(..)) || call(* Queue+.offer*(..))) && target(SortedSet) && args(e)) && MOP_CommonPointCut();
	before (Object e) : SortedSet_Comparable_add(e) {
		MultiSpec_1RuntimeMonitor.SortedSet_Comparable_addEvent(e);
	}

	pointcut TreeSet_Comparable_addall(Collection c) : (call(* Collection+.addAll(Collection)) && target(TreeSet) && args(c)) && MOP_CommonPointCut();
	before (Collection c) : TreeSet_Comparable_addall(c) {
		MultiSpec_1RuntimeMonitor.TreeSet_Comparable_addallEvent(c);
	}

	pointcut TreeSet_Comparable_add(Object e) : (call(* Collection+.add*(..)) && target(TreeSet) && args(e)) && MOP_CommonPointCut();
	before (Object e) : TreeSet_Comparable_add(e) {
		MultiSpec_1RuntimeMonitor.TreeSet_Comparable_addEvent(e);
	}

	pointcut EnumMap_NonNull_insertnull_8(Map m) : (call(* EnumMap.putAll(Map)) && args(m)) && MOP_CommonPointCut();
	before (Map m) : EnumMap_NonNull_insertnull_8(m) {
		MultiSpec_1RuntimeMonitor.EnumMap_NonNull_insertnullEvent(m);
	}

	pointcut EnumMap_NonNull_insertnull_7(Object e) : (call(* EnumMap.put(Object, Object)) && args(e, ..)) && MOP_CommonPointCut();
	before (Object e) : EnumMap_NonNull_insertnull_7(e) {
		MultiSpec_1RuntimeMonitor.EnumMap_NonNull_insertnullEvent(e);
	}

	pointcut Set_ItselfAsElement_addall(Set s, Collection src) : (call(* Set+.addAll(Collection)) && target(s) && args(src)) && MOP_CommonPointCut();
	before (Set s, Collection src) : Set_ItselfAsElement_addall(s, src) {
		MultiSpec_1RuntimeMonitor.Set_ItselfAsElement_addallEvent(s, src);
	}

	pointcut Set_ItselfAsElement_add(Set s, Object elem) : (call(* Set+.add(Object)) && target(s) && args(elem)) && MOP_CommonPointCut();
	before (Set s, Object elem) : Set_ItselfAsElement_add(s, elem) {
		MultiSpec_1RuntimeMonitor.Set_ItselfAsElement_addEvent(s, elem);
	}

	pointcut Collections_UnnecessaryNewSetFromMap_unnecessary() : (call(* Collections.newSetFromMap(Map)) && (args(HashMap) || args(TreeMap))) && MOP_CommonPointCut();
	before () : Collections_UnnecessaryNewSetFromMap_unnecessary() {
		MultiSpec_1RuntimeMonitor.Collections_UnnecessaryNewSetFromMap_unnecessaryEvent();
	}

	pointcut StringTokenizer_HasMoreElements_next(StringTokenizer i) : ((call(* StringTokenizer.nextToken()) || call(* StringTokenizer.nextElement())) && target(i)) && MOP_CommonPointCut();
	before (StringTokenizer i) : StringTokenizer_HasMoreElements_next(i) {
		MultiSpec_1RuntimeMonitor.StringTokenizer_HasMoreElements_nextEvent(i);
	}

	pointcut Collection_UnsafeIterator_modify(Collection c) : ((call(* Collection+.add*(..)) || call(* Collection+.clear(..)) || call(* Collection+.offer*(..)) || call(* Collection+.pop(..)) || call(* Collection+.push(..)) || call(* Collection+.remove*(..)) || call(* Collection+.retain*(..))) && target(c)) && MOP_CommonPointCut();
	before (Collection c) : Collection_UnsafeIterator_modify(c) {
		MultiSpec_1RuntimeMonitor.Collection_UnsafeIterator_modifyEvent(c);
	}

	pointcut NavigableMap_UnsafeIterator_modifySet(Set s) : ((call(* Collection+.add(..)) || call(* Collection+.addAll(..))) && target(s)) && MOP_CommonPointCut();
	before (Set s) : NavigableMap_UnsafeIterator_modifySet(s) {
		MultiSpec_1RuntimeMonitor.NavigableMap_UnsafeIterator_modifySetEvent(s);
	}

	pointcut NavigableMap_UnsafeIterator_modifyMap(NavigableMap m) : ((call(* Map+.clear*(..)) || call(* Map+.put*(..)) || call(* Map+.remove*(..))) && target(m)) && MOP_CommonPointCut();
	before (NavigableMap m) : NavigableMap_UnsafeIterator_modifyMap(m) {
		MultiSpec_1RuntimeMonitor.NavigableMap_UnsafeIterator_modifyMapEvent(m);
	}

	pointcut Collections_NewSetFromMap_access(Map map) : (call(* Map+.*(..)) && target(map)) && MOP_CommonPointCut();
	before (Map map) : Collections_NewSetFromMap_access(map) {
		MultiSpec_1RuntimeMonitor.Collections_NewSetFromMap_accessEvent(map);
	}

	pointcut Collections_NewSetFromMap_create(Map map) : (call(* Collections.newSetFromMap(Map)) && args(map)) && MOP_CommonPointCut();
	before (Map map) : Collections_NewSetFromMap_create(map) {
		//Collections_NewSetFromMap_bad_create
		MultiSpec_1RuntimeMonitor.Collections_NewSetFromMap_bad_createEvent(map);
		//Collections_NewSetFromMap_create
		MultiSpec_1RuntimeMonitor.Collections_NewSetFromMap_createEvent(map);
	}

	pointcut Deque_OfferRatherThanAdd_add(Deque q) : ((call(* Deque+.addFirst(..)) || call(* Deque+.addLast(..)) || call(* Deque+.add(..)) || call(* Deque+.push(..))) && target(q)) && MOP_CommonPointCut();
	before (Deque q) : Deque_OfferRatherThanAdd_add(q) {
		MultiSpec_1RuntimeMonitor.Deque_OfferRatherThanAdd_addEvent(q);
	}

	pointcut Collections_ImplementComparable_invalid_minmax(Collection col) : ((call(* Collections.min(Collection)) || call(* Collections.max(Collection))) && args(col)) && MOP_CommonPointCut();
	before (Collection col) : Collections_ImplementComparable_invalid_minmax(col) {
		MultiSpec_1RuntimeMonitor.Collections_ImplementComparable_invalid_minmaxEvent(col);
	}

	pointcut Collections_ImplementComparable_invalid_sort(List list) : (call(void Collections.sort(List)) && args(list)) && MOP_CommonPointCut();
	before (List list) : Collections_ImplementComparable_invalid_sort(list) {
		//Collections_SortBeforeBinarySearch_sort1
		MultiSpec_1RuntimeMonitor.Collections_SortBeforeBinarySearch_sort1Event(list);
		//Collections_ImplementComparable_invalid_sort
		MultiSpec_1RuntimeMonitor.Collections_ImplementComparable_invalid_sortEvent(list);
	}

	pointcut Enumeration_Obsolete_use(Enumeration e) : (call(* Enumeration+.*(..)) && target(e)) && MOP_CommonPointCut();
	before (Enumeration e) : Enumeration_Obsolete_use(e) {
		MultiSpec_1RuntimeMonitor.Enumeration_Obsolete_useEvent(e);
	}

	pointcut Collections_SynchronizedMap_accessIter(Iterator iter) : (call(* Iterator.*(..)) && target(iter)) && MOP_CommonPointCut();
	before (Iterator iter) : Collections_SynchronizedMap_accessIter(iter) {
		//Collections_SynchronizedCollection_accessIter
		MultiSpec_1RuntimeMonitor.Collections_SynchronizedCollection_accessIterEvent(iter);
		//Collections_SynchronizedMap_accessIter
		MultiSpec_1RuntimeMonitor.Collections_SynchronizedMap_accessIterEvent(iter);
	}

	pointcut PriorityQueue_NonComparable_insertnull_4(Collection c) : (call(* Collection+.addAll(Collection)) && target(PriorityQueue) && args(c)) && MOP_CommonPointCut();
	before (Collection c) : PriorityQueue_NonComparable_insertnull_4(c) {
		//PriorityQueue_NonNull_insertnull_12
		MultiSpec_1RuntimeMonitor.PriorityQueue_NonNull_insertnullEvent(c);
		//PriorityQueue_NonComparable_insertnull_4
		MultiSpec_1RuntimeMonitor.PriorityQueue_NonComparable_insertnullEvent(c);
	}

	pointcut PriorityQueue_NonComparable_insertnull_3(Object e) : ((call(* Collection+.add*(..)) || call(* Queue+.offer*(..))) && target(PriorityQueue) && args(e)) && MOP_CommonPointCut();
	before (Object e) : PriorityQueue_NonComparable_insertnull_3(e) {
		//PriorityQueue_NonNull_insertnull_11
		MultiSpec_1RuntimeMonitor.PriorityQueue_NonNull_insertnullEvent(e);
		//PriorityQueue_NonComparable_insertnull_3
		MultiSpec_1RuntimeMonitor.PriorityQueue_NonComparable_insertnullEvent(e);
	}

	pointcut Iterator_RemoveOnce_remove(Iterator i) : (call(void Iterator+.remove()) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : Iterator_RemoveOnce_remove(i) {
		MultiSpec_1RuntimeMonitor.Iterator_RemoveOnce_removeEvent(i);
	}

	pointcut Arrays_Comparable_invalid_sort(Object[] arr) : (target(Arrays) && (call(void Arrays.sort(Object[])) || call(void Arrays.sort(Object[], ..))) && args(arr, ..)) && MOP_CommonPointCut();
	before (Object[] arr) : Arrays_Comparable_invalid_sort(arr) {
		MultiSpec_1RuntimeMonitor.Arrays_Comparable_invalid_sortEvent(arr);
	}

	pointcut NavigableSet_Modification_modify2(NavigableSet s2) : ((call(* Collection+.add*(..)) || call(* Collection+.clear(..)) || call(* Collection+.remove*(..)) || call(* Collection+.retain*(..))) && target(s2)) && MOP_CommonPointCut();
	before (NavigableSet s2) : NavigableSet_Modification_modify2(s2) {
		MultiSpec_1RuntimeMonitor.NavigableSet_Modification_modify2Event(s2);
	}

	pointcut NavigableSet_Modification_modify1(NavigableSet s1) : ((call(* Collection+.add*(..)) || call(* Collection+.clear(..)) || call(* Collection+.remove*(..)) || call(* Collection+.retain*(..))) && target(s1)) && MOP_CommonPointCut();
	before (NavigableSet s1) : NavigableSet_Modification_modify1(s1) {
		MultiSpec_1RuntimeMonitor.NavigableSet_Modification_modify1Event(s1);
	}

	pointcut Iterator_HasNext_next(Iterator i) : (call(* Iterator+.next()) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : Iterator_HasNext_next(i) {
		//Iterator_RemoveOnce_next
		MultiSpec_1RuntimeMonitor.Iterator_RemoveOnce_nextEvent(i);
		//Iterator_HasNext_next
		MultiSpec_1RuntimeMonitor.Iterator_HasNext_nextEvent(i);
	}

	pointcut Vector_InsertIndex_insert(Vector v, int index) : (call(* Vector+.insertElementAt(Object, int)) && target(v) && args(.., index)) && MOP_CommonPointCut();
	before (Vector v, int index) : Vector_InsertIndex_insert(v, index) {
		MultiSpec_1RuntimeMonitor.Vector_InsertIndex_insertEvent(v, index);
	}

	pointcut ArrayDeque_NonNull_insertnull(Object e) : ((call(* ArrayDeque.add*(..)) || call(* ArrayDeque.offer*(..)) || call(* ArrayDeque.push(..))) && args(Object+) && args(e)) && MOP_CommonPointCut();
	before (Object e) : ArrayDeque_NonNull_insertnull(e) {
		MultiSpec_1RuntimeMonitor.ArrayDeque_NonNull_insertnullEvent(e);
	}

	pointcut Collections_CopySize_bad_copy(List dest, List src) : (call(void Collections.copy(List, List)) && args(dest, src)) && MOP_CommonPointCut();
	before (List dest, List src) : Collections_CopySize_bad_copy(dest, src) {
		MultiSpec_1RuntimeMonitor.Collections_CopySize_bad_copyEvent(dest, src);
	}

	pointcut ListIterator_hasNextPrevious_previous(ListIterator i) : (call(* ListIterator.previous()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_hasNextPrevious_previous(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_previousEvent(i);
	}

	pointcut ListIterator_hasNextPrevious_next(ListIterator i) : (call(* ListIterator.next()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_hasNextPrevious_next(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_nextEvent(i);
	}

	pointcut TreeMap_Comparable_putall(Map src) : (call(* Map+.putAll(Map)) && args(src) && target(TreeMap)) && MOP_CommonPointCut();
	before (Map src) : TreeMap_Comparable_putall(src) {
		MultiSpec_1RuntimeMonitor.TreeMap_Comparable_putallEvent(src);
	}

	pointcut TreeMap_Comparable_put(Object key) : (call(* Map+.put(Object, Object)) && args(key, ..) && target(TreeMap)) && MOP_CommonPointCut();
	before (Object key) : TreeMap_Comparable_put(key) {
		MultiSpec_1RuntimeMonitor.TreeMap_Comparable_putEvent(key);
	}

	pointcut TreeMap_Comparable_create(Map src) : (call(TreeMap.new(Map)) && args(src)) && MOP_CommonPointCut();
	before (Map src) : TreeMap_Comparable_create(src) {
		MultiSpec_1RuntimeMonitor.TreeMap_Comparable_createEvent(src);
	}

	pointcut Map_ItselfAsKey_putall(Map map, Map src) : (call(* Map+.putAll(Map)) && target(map) && args(src)) && MOP_CommonPointCut();
	before (Map map, Map src) : Map_ItselfAsKey_putall(map, src) {
		//Map_ItselfAsValue_putall
		MultiSpec_1RuntimeMonitor.Map_ItselfAsValue_putallEvent(map, src);
		//Map_ItselfAsKey_putall
		MultiSpec_1RuntimeMonitor.Map_ItselfAsKey_putallEvent(map, src);
	}

	pointcut Map_ItselfAsKey_put(Map map, Object key, Object value) : (call(* Map+.put(Object, Object)) && target(map) && args(key, value)) && MOP_CommonPointCut();
	before (Map map, Object key, Object value) : Map_ItselfAsKey_put(map, key, value) {
		//Map_ItselfAsValue_put
		MultiSpec_1RuntimeMonitor.Map_ItselfAsValue_putEvent(map, key, value);
		//Map_ItselfAsKey_put
		MultiSpec_1RuntimeMonitor.Map_ItselfAsKey_putEvent(map, key, value);
	}

	pointcut Arrays_DeepHashCode_invalid_deephashcode(Object[] arr) : (call(int Arrays.deepHashCode(Object[])) && args(arr)) && MOP_CommonPointCut();
	before (Object[] arr) : Arrays_DeepHashCode_invalid_deephashcode(arr) {
		MultiSpec_1RuntimeMonitor.Arrays_DeepHashCode_invalid_deephashcodeEvent(arr);
	}

	pointcut ListIterator_Set_set(ListIterator i) : (call(* ListIterator+.set(..)) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_Set_set(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_Set_setEvent(i);
	}

	pointcut ListIterator_Set_previous(ListIterator i) : (call(* ListIterator+.previous()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_Set_previous(i) {
		//ListIterator_RemoveOnce_previous
		MultiSpec_1RuntimeMonitor.ListIterator_RemoveOnce_previousEvent(i);
		//ListIterator_Set_previous
		MultiSpec_1RuntimeMonitor.ListIterator_Set_previousEvent(i);
	}

	pointcut ListIterator_Set_next(ListIterator i) : (call(* Iterator+.next()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_Set_next(i) {
		//ListIterator_RemoveOnce_next
		MultiSpec_1RuntimeMonitor.ListIterator_RemoveOnce_nextEvent(i);
		//ListIterator_Set_next
		MultiSpec_1RuntimeMonitor.ListIterator_Set_nextEvent(i);
	}

	pointcut ListIterator_Set_add(ListIterator i) : (call(void ListIterator+.add(..)) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_Set_add(i) {
		MultiSpec_1RuntimeMonitor.ListIterator_Set_addEvent(i);
	}

	pointcut ListIterator_Set_remove(ListIterator i) : (call(void Iterator+.remove()) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : ListIterator_Set_remove(i) {
		//ListIterator_RemoveOnce_remove
		MultiSpec_1RuntimeMonitor.ListIterator_RemoveOnce_removeEvent(i);
		//ListIterator_Set_remove
		MultiSpec_1RuntimeMonitor.ListIterator_Set_removeEvent(i);
	}

	pointcut Map_UnsynchronizedAddAll_modify(Map s) : ((call(* Map+.clear(..)) || call(* Map+.put*(..)) || call(* Map+.remove*(..))) && target(s)) && MOP_CommonPointCut();
	before (Map s) : Map_UnsynchronizedAddAll_modify(s) {
		MultiSpec_1RuntimeMonitor.Map_UnsynchronizedAddAll_modifyEvent(s);
	}

	pointcut Map_UnsynchronizedAddAll_enter(Map t, Map s) : (call(boolean Map+.putAll(..)) && target(t) && args(s)) && MOP_CommonPointCut();
	before (Map t, Map s) : Map_UnsynchronizedAddAll_enter(t, s) {
		MultiSpec_1RuntimeMonitor.Map_UnsynchronizedAddAll_enterEvent(t, s);
	}

	pointcut List_UnsynchronizedSubList_usesublist(List s) : (call(* List.*(..)) && target(s)) && MOP_CommonPointCut();
	before (List s) : List_UnsynchronizedSubList_usesublist(s) {
		MultiSpec_1RuntimeMonitor.List_UnsynchronizedSubList_usesublistEvent(s);
	}

	pointcut List_UnsynchronizedSubList_modifybackinglist(List b) : ((call(* Collection+.add*(..)) || call(* Collection+.remove*(..)) || call(* Collection+.clear(..)) || call(* Collection+.retain*(..))) && target(b)) && MOP_CommonPointCut();
	before (List b) : List_UnsynchronizedSubList_modifybackinglist(b) {
		MultiSpec_1RuntimeMonitor.List_UnsynchronizedSubList_modifybackinglistEvent(b);
	}

	pointcut Map_UnsafeIterator_useiter(Iterator i) : ((call(* Iterator.hasNext(..)) || call(* Iterator.next(..))) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : Map_UnsafeIterator_useiter(i) {
		//NavigableMap_Modification_useiter
		MultiSpec_1RuntimeMonitor.NavigableMap_Modification_useiterEvent(i);
		//Collection_UnsafeIterator_useiter
		MultiSpec_1RuntimeMonitor.Collection_UnsafeIterator_useiterEvent(i);
		//NavigableMap_UnsafeIterator_useiter
		MultiSpec_1RuntimeMonitor.NavigableMap_UnsafeIterator_useiterEvent(i);
		//NavigableSet_Modification_useiter
		MultiSpec_1RuntimeMonitor.NavigableSet_Modification_useiterEvent(i);
		//Map_UnsafeIterator_useiter
		MultiSpec_1RuntimeMonitor.Map_UnsafeIterator_useiterEvent(i);
	}

	pointcut Map_UnsafeIterator_modifyCol(Collection c) : ((call(* Collection+.clear(..)) || call(* Collection+.offer*(..)) || call(* Collection+.pop(..)) || call(* Collection+.push(..)) || call(* Collection+.remove*(..)) || call(* Collection+.retain*(..))) && target(c)) && MOP_CommonPointCut();
	before (Collection c) : Map_UnsafeIterator_modifyCol(c) {
		MultiSpec_1RuntimeMonitor.Map_UnsafeIterator_modifyColEvent(c);
	}

	pointcut Map_UnsafeIterator_modifyMap(Map m) : ((call(* Map+.clear*(..)) || call(* Map+.put*(..)) || call(* Map+.remove(..))) && target(m)) && MOP_CommonPointCut();
	before (Map m) : Map_UnsafeIterator_modifyMap(m) {
		MultiSpec_1RuntimeMonitor.Map_UnsafeIterator_modifyMapEvent(m);
	}

	pointcut InvalidPropertiesFormatException_NonSerializable_serialize(ObjectOutputStream out, InvalidPropertiesFormatException obj) : (call(* ObjectOutputStream+.writeObject(..)) && target(out) && args(obj)) && MOP_CommonPointCut();
	before (ObjectOutputStream out, InvalidPropertiesFormatException obj) : InvalidPropertiesFormatException_NonSerializable_serialize(out, obj) {
		MultiSpec_1RuntimeMonitor.InvalidPropertiesFormatException_NonSerializable_serializeEvent(out, obj);
	}

	pointcut Collection_UnsynchronizedAddAll_modify(Collection s) : ((call(* Collection+.add*(..)) || call(* Collection+.remove*(..)) || call(* Collection+.clear(..)) || call(* Collection+.retain*(..))) && target(s)) && MOP_CommonPointCut();
	before (Collection s) : Collection_UnsynchronizedAddAll_modify(s) {
		MultiSpec_1RuntimeMonitor.Collection_UnsynchronizedAddAll_modifyEvent(s);
	}

	pointcut Collection_UnsynchronizedAddAll_enter(Collection t, Collection s) : (call(boolean Collection+.addAll(..)) && target(t) && args(s)) && MOP_CommonPointCut();
	before (Collection t, Collection s) : Collection_UnsynchronizedAddAll_enter(t, s) {
		MultiSpec_1RuntimeMonitor.Collection_UnsynchronizedAddAll_enterEvent(t, s);
	}

	pointcut List_UnsafeListIterator_useiter(ListIterator i) : ((call(* Iterator+.hasNext(..)) || call(* ListIterator+.hasPrevious(..)) || call(* Iterator+.next(..)) || call(* ListIterator+.previous(..)) || call(* ListIterator+.nextIndex(..)) || call(* ListIterator+.previousIndex(..))) && target(i)) && MOP_CommonPointCut();
	before (ListIterator i) : List_UnsafeListIterator_useiter(i) {
		MultiSpec_1RuntimeMonitor.List_UnsafeListIterator_useiterEvent(i);
	}

	pointcut List_UnsafeListIterator_modify(List l) : ((call(* Collection+.add*(..)) || call(* Collection+.clear(..)) || call(* Collection+.remove*(..)) || call(* Collection+.retain*(..))) && target(l)) && MOP_CommonPointCut();
	before (List l) : List_UnsafeListIterator_modify(l) {
		//ResourceBundleControl_MutateFormatList_mutate
		MultiSpec_1RuntimeMonitor.ResourceBundleControl_MutateFormatList_mutateEvent(l);
		//List_UnsafeListIterator_modify
		MultiSpec_1RuntimeMonitor.List_UnsafeListIterator_modifyEvent(l);
	}

	pointcut Dictionary_Obsolete_use(Dictionary d) : (call(* Dictionary+.*(..)) && target(d)) && MOP_CommonPointCut();
	before (Dictionary d) : Dictionary_Obsolete_use(d) {
		MultiSpec_1RuntimeMonitor.Dictionary_Obsolete_useEvent(d);
	}

	pointcut ServiceLoaderIterator_Remove_remove(Iterator i) : (call(* Iterator+.remove(..)) && target(i)) && MOP_CommonPointCut();
	before (Iterator i) : ServiceLoaderIterator_Remove_remove(i) {
		MultiSpec_1RuntimeMonitor.ServiceLoaderIterator_Remove_removeEvent(i);
	}

	pointcut InputStream_ManipulateAfterClose_close(InputStream i) : (call(* InputStream+.close(..)) && target(i) && !target(ByteArrayInputStream) && !target(StringBufferInputStream)) && MOP_CommonPointCut();
	before (InputStream i) : InputStream_ManipulateAfterClose_close(i) {
		MultiSpec_1RuntimeMonitor.InputStream_ManipulateAfterClose_closeEvent(i);
	}

	pointcut InputStream_ManipulateAfterClose_manipulate(InputStream i) : ((call(* InputStream+.read(..)) || call(* InputStream+.available(..)) || call(* InputStream+.reset(..)) || call(* InputStream+.skip(..))) && target(i) && !target(ByteArrayInputStream) && !target(StringBufferInputStream)) && MOP_CommonPointCut();
	before (InputStream i) : InputStream_ManipulateAfterClose_manipulate(i) {
		//Properties_ManipulateAfterLoad_manipulate
		MultiSpec_1RuntimeMonitor.Properties_ManipulateAfterLoad_manipulateEvent(i);
		//InputStream_ManipulateAfterClose_manipulate
		MultiSpec_1RuntimeMonitor.InputStream_ManipulateAfterClose_manipulateEvent(i);
	}

	pointcut OutputStream_ManipulateAfterClose_close(OutputStream o) : (call(* OutputStream+.close(..)) && target(o) && !target(ByteArrayOutputStream)) && MOP_CommonPointCut();
	before (OutputStream o) : OutputStream_ManipulateAfterClose_close(o) {
		MultiSpec_1RuntimeMonitor.OutputStream_ManipulateAfterClose_closeEvent(o);
	}

	pointcut OutputStream_ManipulateAfterClose_manipulate(OutputStream o) : ((call(* OutputStream+.write*(..)) || call(* OutputStream+.flush(..))) && target(o) && !target(ByteArrayOutputStream)) && MOP_CommonPointCut();
	before (OutputStream o) : OutputStream_ManipulateAfterClose_manipulate(o) {
		MultiSpec_1RuntimeMonitor.OutputStream_ManipulateAfterClose_manipulateEvent(o);
	}

	pointcut ObjectInput_Close_close(ObjectInput i) : (call(* ObjectInput+.close(..)) && target(i)) && MOP_CommonPointCut();
	before (ObjectInput i) : ObjectInput_Close_close(i) {
		MultiSpec_1RuntimeMonitor.ObjectInput_Close_closeEvent(i);
	}

	pointcut InputStream_ReadAheadLimit_mark(InputStream i, int l) : (call(* InputStream+.mark(int)) && target(i) && args(l) && if(i instanceof BufferedInputStream || i instanceof DataInputStream || i instanceof LineNumberInputStream)) && MOP_CommonPointCut();
	before (InputStream i, int l) : InputStream_ReadAheadLimit_mark(i, l) {
		MultiSpec_1RuntimeMonitor.InputStream_ReadAheadLimit_markEvent(i, l);
	}

	pointcut PipedStream_SingleThread_read(PipedInputStream i) : (call(* InputStream+.read(..)) && target(i)) && MOP_CommonPointCut();
	before (PipedInputStream i) : PipedStream_SingleThread_read(i) {
		Thread t = Thread.currentThread();
		MultiSpec_1RuntimeMonitor.PipedStream_SingleThread_readEvent(i, t);
	}

	pointcut PipedStream_SingleThread_write(PipedOutputStream o) : (call(* OutputStream+.write(..)) && target(o)) && MOP_CommonPointCut();
	before (PipedOutputStream o) : PipedStream_SingleThread_write(o) {
		Thread t = Thread.currentThread();
		MultiSpec_1RuntimeMonitor.PipedStream_SingleThread_writeEvent(o, t);
	}

	pointcut PipedStream_SingleThread_create4(PipedOutputStream o, PipedInputStream i) : (call(* PipedOutputStream+.connect(PipedInputStream+)) && target(o) && args(i)) && MOP_CommonPointCut();
	before (PipedOutputStream o, PipedInputStream i) : PipedStream_SingleThread_create4(o, i) {
		MultiSpec_1RuntimeMonitor.PipedStream_SingleThread_create4Event(o, i);
	}

	pointcut PipedStream_SingleThread_create2(PipedInputStream i, PipedOutputStream o) : (call(* PipedInputStream+.connect(PipedOutputStream+)) && target(i) && args(o)) && MOP_CommonPointCut();
	before (PipedInputStream i, PipedOutputStream o) : PipedStream_SingleThread_create2(i, o) {
		MultiSpec_1RuntimeMonitor.PipedStream_SingleThread_create2Event(i, o);
	}

	pointcut StreamTokenizer_AccessInvalidField_nval(StreamTokenizer s) : (get(* StreamTokenizer.nval) && target(s)) && MOP_CommonPointCut();
	before (StreamTokenizer s) : StreamTokenizer_AccessInvalidField_nval(s) {
		MultiSpec_1RuntimeMonitor.StreamTokenizer_AccessInvalidField_nvalEvent(s);
	}

	pointcut StreamTokenizer_AccessInvalidField_sval(StreamTokenizer s) : (get(* StreamTokenizer.sval) && target(s)) && MOP_CommonPointCut();
	before (StreamTokenizer s) : StreamTokenizer_AccessInvalidField_sval(s) {
		MultiSpec_1RuntimeMonitor.StreamTokenizer_AccessInvalidField_svalEvent(s);
	}

	pointcut ByteArrayOutputStream_FlushBeforeRetrieve_tostring(ByteArrayOutputStream b) : (call(* ByteArrayOutputStream+.toString(..)) && target(b)) && MOP_CommonPointCut();
	before (ByteArrayOutputStream b) : ByteArrayOutputStream_FlushBeforeRetrieve_tostring(b) {
		MultiSpec_1RuntimeMonitor.ByteArrayOutputStream_FlushBeforeRetrieve_tostringEvent(b);
	}

	pointcut ByteArrayOutputStream_FlushBeforeRetrieve_tobytearray(ByteArrayOutputStream b) : (call(* ByteArrayOutputStream+.toByteArray(..)) && target(b)) && MOP_CommonPointCut();
	before (ByteArrayOutputStream b) : ByteArrayOutputStream_FlushBeforeRetrieve_tobytearray(b) {
		MultiSpec_1RuntimeMonitor.ByteArrayOutputStream_FlushBeforeRetrieve_tobytearrayEvent(b);
	}

	pointcut ByteArrayOutputStream_FlushBeforeRetrieve_close(OutputStream o) : (call(* OutputStream+.close(..)) && target(o)) && MOP_CommonPointCut();
	before (OutputStream o) : ByteArrayOutputStream_FlushBeforeRetrieve_close(o) {
		MultiSpec_1RuntimeMonitor.ByteArrayOutputStream_FlushBeforeRetrieve_closeEvent(o);
	}

	pointcut ByteArrayOutputStream_FlushBeforeRetrieve_flush(OutputStream o) : (call(* OutputStream+.flush(..)) && target(o)) && MOP_CommonPointCut();
	before (OutputStream o) : ByteArrayOutputStream_FlushBeforeRetrieve_flush(o) {
		MultiSpec_1RuntimeMonitor.ByteArrayOutputStream_FlushBeforeRetrieve_flushEvent(o);
	}

	pointcut ByteArrayOutputStream_FlushBeforeRetrieve_write(OutputStream o) : (call(* OutputStream+.write*(..)) && target(o)) && MOP_CommonPointCut();
	before (OutputStream o) : ByteArrayOutputStream_FlushBeforeRetrieve_write(o) {
		MultiSpec_1RuntimeMonitor.ByteArrayOutputStream_FlushBeforeRetrieve_writeEvent(o);
	}

	pointcut InputStream_MarkReset_mark_or_reset() : ((call(* InputStream+.mark(..)) || call(* InputStream+.reset(..))) && (target(FileInputStream) || target(PushbackInputStream) || target(ObjectInputStream) || target(PipedInputStream) || target(SequenceInputStream))) && MOP_CommonPointCut();
	before () : InputStream_MarkReset_mark_or_reset() {
		MultiSpec_1RuntimeMonitor.InputStream_MarkReset_mark_or_resetEvent();
	}

	pointcut File_LengthOnDirectory_bad_length(File f) : (call(* File+.length()) && target(f)) && MOP_CommonPointCut();
	before (File f) : File_LengthOnDirectory_bad_length(f) {
		MultiSpec_1RuntimeMonitor.File_LengthOnDirectory_bad_lengthEvent(f);
	}

	pointcut ObjectStreamClass_Initialize_init(ObjectStreamClass c) : ((call(* ObjectStreamClass+.initProxy(..)) || call(* ObjectStreamClass+.initNonProxy(..)) || call(* ObjectStreamClass+.readNonProxy(..))) && target(c)) && MOP_CommonPointCut();
	before (ObjectStreamClass c) : ObjectStreamClass_Initialize_init(c) {
		MultiSpec_1RuntimeMonitor.ObjectStreamClass_Initialize_initEvent(c);
	}

	pointcut RandomAccessFile_ManipulateAfterClose_close(RandomAccessFile f) : (call(* RandomAccessFile+.close(..)) && target(f)) && MOP_CommonPointCut();
	before (RandomAccessFile f) : RandomAccessFile_ManipulateAfterClose_close(f) {
		MultiSpec_1RuntimeMonitor.RandomAccessFile_ManipulateAfterClose_closeEvent(f);
	}

	pointcut RandomAccessFile_ManipulateAfterClose_manipulate(RandomAccessFile f) : ((call(* RandomAccessFile+.read*(..)) || call(* RandomAccessFile+.write*(..))) && target(f)) && MOP_CommonPointCut();
	before (RandomAccessFile f) : RandomAccessFile_ManipulateAfterClose_manipulate(f) {
		MultiSpec_1RuntimeMonitor.RandomAccessFile_ManipulateAfterClose_manipulateEvent(f);
	}

	pointcut Reader_MarkReset_reset(Reader r) : (call(* Reader+.reset(..)) && target(r) && (target(PushbackReader) || target(InputStreamReader) || target(FileReader) || target(PipedReader))) && MOP_CommonPointCut();
	before (Reader r) : Reader_MarkReset_reset(r) {
		MultiSpec_1RuntimeMonitor.Reader_MarkReset_resetEvent(r);
	}

	pointcut Reader_MarkReset_mark(Reader r) : (call(* Reader+.mark(..)) && target(r) && (target(PushbackReader) || target(InputStreamReader) || target(FileReader) || target(PipedReader))) && MOP_CommonPointCut();
	before (Reader r) : Reader_MarkReset_mark(r) {
		MultiSpec_1RuntimeMonitor.Reader_MarkReset_markEvent(r);
	}

	pointcut File_DeleteTempFile_implicit(File f) : (call(* File+.deleteOnExit(..)) && target(f)) && MOP_CommonPointCut();
	before (File f) : File_DeleteTempFile_implicit(f) {
		MultiSpec_1RuntimeMonitor.File_DeleteTempFile_implicitEvent(f);
	}

	pointcut File_DeleteTempFile_explicit(File f) : (call(* File+.delete(..)) && target(f)) && MOP_CommonPointCut();
	before (File f) : File_DeleteTempFile_explicit(f) {
		MultiSpec_1RuntimeMonitor.File_DeleteTempFile_explicitEvent(f);
	}

	pointcut Closeable_MultipleClose_close(Closeable c) : (call(* Closeable+.close(..)) && target(c)) && MOP_CommonPointCut();
	before (Closeable c) : Closeable_MultipleClose_close(c) {
		MultiSpec_1RuntimeMonitor.Closeable_MultipleClose_closeEvent(c);
	}

	pointcut PushbackInputStream_UnreadAheadLimit_safeunread_6(PushbackInputStream p, int len) : (call(* PushbackInputStream+.unread(byte[], int, int)) && target(p) && args(.., len)) && MOP_CommonPointCut();
	before (PushbackInputStream p, int len) : PushbackInputStream_UnreadAheadLimit_safeunread_6(p, len) {
		//PushbackInputStream_UnreadAheadLimit_unsafeunread_6
		MultiSpec_1RuntimeMonitor.PushbackInputStream_UnreadAheadLimit_unsafeunreadEvent(p, len);
		//PushbackInputStream_UnreadAheadLimit_safeunread_6
		MultiSpec_1RuntimeMonitor.PushbackInputStream_UnreadAheadLimit_safeunreadEvent(p, len);
	}

	pointcut PushbackInputStream_UnreadAheadLimit_safeunread_5(PushbackInputStream p, Object b) : (call(* PushbackInputStream+.unread(byte[])) && target(p) && args(b)) && MOP_CommonPointCut();
	before (PushbackInputStream p, Object b) : PushbackInputStream_UnreadAheadLimit_safeunread_5(p, b) {
		//PushbackInputStream_UnreadAheadLimit_unsafeunread_5
		MultiSpec_1RuntimeMonitor.PushbackInputStream_UnreadAheadLimit_unsafeunreadEvent(p, b);
		//PushbackInputStream_UnreadAheadLimit_safeunread_5
		MultiSpec_1RuntimeMonitor.PushbackInputStream_UnreadAheadLimit_safeunreadEvent(p, b);
	}

	pointcut PushbackInputStream_UnreadAheadLimit_safeunread_4(PushbackInputStream p) : (call(* PushbackInputStream+.unread(int)) && target(p)) && MOP_CommonPointCut();
	before (PushbackInputStream p) : PushbackInputStream_UnreadAheadLimit_safeunread_4(p) {
		//PushbackInputStream_UnreadAheadLimit_unsafeunread_4
		MultiSpec_1RuntimeMonitor.PushbackInputStream_UnreadAheadLimit_unsafeunreadEvent(p);
		//PushbackInputStream_UnreadAheadLimit_safeunread_4
		MultiSpec_1RuntimeMonitor.PushbackInputStream_UnreadAheadLimit_safeunreadEvent(p);
	}

	pointcut PipedInputStream_UnconnectedRead_read(PipedInputStream i) : ((call(* PipedInputStream+.read(..)) || call(* PipedInputStream+.receive(..)) || call(* PipedInputStream+.available(..))) && target(i)) && MOP_CommonPointCut();
	before (PipedInputStream i) : PipedInputStream_UnconnectedRead_read(i) {
		MultiSpec_1RuntimeMonitor.PipedInputStream_UnconnectedRead_readEvent(i);
	}

	pointcut PipedInputStream_UnconnectedRead_connect2(PipedInputStream i) : (call(* PipedInputStream+.connect(PipedOutputStream+)) && target(i)) && MOP_CommonPointCut();
	before (PipedInputStream i) : PipedInputStream_UnconnectedRead_connect2(i) {
		MultiSpec_1RuntimeMonitor.PipedInputStream_UnconnectedRead_connect2Event(i);
	}

	pointcut PipedInputStream_UnconnectedRead_connect1(PipedInputStream i) : (call(* PipedOutputStream+.connect(PipedInputStream+)) && args(i)) && MOP_CommonPointCut();
	before (PipedInputStream i) : PipedInputStream_UnconnectedRead_connect1(i) {
		MultiSpec_1RuntimeMonitor.PipedInputStream_UnconnectedRead_connect1Event(i);
	}

	pointcut PipedInputStream_UnconnectedRead_create_io(PipedInputStream i) : (call(PipedOutputStream+.new(PipedInputStream+)) && args(i)) && MOP_CommonPointCut();
	before (PipedInputStream i) : PipedInputStream_UnconnectedRead_create_io(i) {
		MultiSpec_1RuntimeMonitor.PipedInputStream_UnconnectedRead_create_ioEvent(i);
	}

	pointcut ObjectOutput_Close_close(ObjectOutput o) : (call(* ObjectOutput+.close(..)) && target(o)) && MOP_CommonPointCut();
	before (ObjectOutput o) : ObjectOutput_Close_close(o) {
		MultiSpec_1RuntimeMonitor.ObjectOutput_Close_closeEvent(o);
	}

	pointcut Writer_ManipulateAfterClose_close(Writer w) : (call(* Writer+.close(..)) && target(w) && !target(CharArrayWriter) && !target(StringWriter)) && MOP_CommonPointCut();
	before (Writer w) : Writer_ManipulateAfterClose_close(w) {
		MultiSpec_1RuntimeMonitor.Writer_ManipulateAfterClose_closeEvent(w);
	}

	pointcut Writer_ManipulateAfterClose_manipulate(Writer w) : ((call(* Writer+.write*(..)) || call(* Writer+.flush(..))) && target(w) && !target(CharArrayWriter) && !target(StringWriter)) && MOP_CommonPointCut();
	before (Writer w) : Writer_ManipulateAfterClose_manipulate(w) {
		MultiSpec_1RuntimeMonitor.Writer_ManipulateAfterClose_manipulateEvent(w);
	}

	pointcut Closeable_MeaninglessClose_close() : (call(* Closeable+.close()) && (target(ByteArrayInputStream) || target(ByteArrayOutputStream) || target(CharArrayWriter) || target(StringWriter))) && MOP_CommonPointCut();
	before () : Closeable_MeaninglessClose_close() {
		MultiSpec_1RuntimeMonitor.Closeable_MeaninglessClose_closeEvent();
	}

	pointcut Console_CloseWriter_close(Writer w) : (call(* Writer+.close(..)) && target(w)) && MOP_CommonPointCut();
	before (Writer w) : Console_CloseWriter_close(w) {
		MultiSpec_1RuntimeMonitor.Console_CloseWriter_closeEvent(w);
	}

	pointcut Reader_UnmarkedReset_mark(Reader r) : (call(* Reader+.mark(..)) && target(r) && if(r instanceof BufferedReader || r instanceof LineNumberReader)) && MOP_CommonPointCut();
	before (Reader r) : Reader_UnmarkedReset_mark(r) {
		MultiSpec_1RuntimeMonitor.Reader_UnmarkedReset_markEvent(r);
	}

	pointcut Reader_ReadAheadLimit_badreset(Reader r) : (call(* Reader+.reset(..)) && target(r) && if(r instanceof BufferedReader || r instanceof LineNumberReader)) && MOP_CommonPointCut();
	before (Reader r) : Reader_ReadAheadLimit_badreset(r) {
		//Reader_UnmarkedReset_reset
		MultiSpec_1RuntimeMonitor.Reader_UnmarkedReset_resetEvent(r);
		//Reader_ReadAheadLimit_goodreset
		MultiSpec_1RuntimeMonitor.Reader_ReadAheadLimit_goodresetEvent(r);
		//Reader_ReadAheadLimit_badreset
		MultiSpec_1RuntimeMonitor.Reader_ReadAheadLimit_badresetEvent(r);
	}

	pointcut Reader_ReadAheadLimit_mark(Reader r, int l) : (call(* Reader+.mark(int)) && target(r) && args(l) && if(r instanceof BufferedReader || r instanceof LineNumberReader)) && MOP_CommonPointCut();
	before (Reader r, int l) : Reader_ReadAheadLimit_mark(r, l) {
		MultiSpec_1RuntimeMonitor.Reader_ReadAheadLimit_markEvent(r, l);
	}

	pointcut InputStream_UnmarkedReset_reset(InputStream i) : (call(* InputStream+.reset(..)) && target(i) && if(i instanceof BufferedInputStream || i instanceof DataInputStream || i instanceof LineNumberInputStream)) && MOP_CommonPointCut();
	before (InputStream i) : InputStream_UnmarkedReset_reset(i) {
		//InputStream_ReadAheadLimit_goodreset
		MultiSpec_1RuntimeMonitor.InputStream_ReadAheadLimit_goodresetEvent(i);
		//InputStream_ReadAheadLimit_badreset
		MultiSpec_1RuntimeMonitor.InputStream_ReadAheadLimit_badresetEvent(i);
		//InputStream_UnmarkedReset_reset
		MultiSpec_1RuntimeMonitor.InputStream_UnmarkedReset_resetEvent(i);
	}

	pointcut InputStream_UnmarkedReset_mark(InputStream i) : (call(* InputStream+.mark(..)) && target(i) && if(i instanceof BufferedInputStream || i instanceof DataInputStream || i instanceof LineNumberInputStream)) && MOP_CommonPointCut();
	before (InputStream i) : InputStream_UnmarkedReset_mark(i) {
		MultiSpec_1RuntimeMonitor.InputStream_UnmarkedReset_markEvent(i);
	}

	pointcut Console_FillZeroPassword_obliterate(Object pwd) : (call(* Arrays.fill(char[], char)) && args(pwd, ..)) && MOP_CommonPointCut();
	before (Object pwd) : Console_FillZeroPassword_obliterate(pwd) {
		//PasswordAuthentication_FillZeroPassword_obliterate
		MultiSpec_1RuntimeMonitor.PasswordAuthentication_FillZeroPassword_obliterateEvent(pwd);
		//Console_FillZeroPassword_obliterate
		MultiSpec_1RuntimeMonitor.Console_FillZeroPassword_obliterateEvent(pwd);
	}

	pointcut Reader_ManipulateAfterClose_close(Reader r) : (call(* Reader+.close(..)) && target(r)) && MOP_CommonPointCut();
	before (Reader r) : Reader_ManipulateAfterClose_close(r) {
		//Console_CloseReader_close
		MultiSpec_1RuntimeMonitor.Console_CloseReader_closeEvent(r);
		//Reader_ManipulateAfterClose_close
		MultiSpec_1RuntimeMonitor.Reader_ManipulateAfterClose_closeEvent(r);
	}

	pointcut Reader_ManipulateAfterClose_manipulate(Reader r) : ((call(* Reader+.read(..)) || call(* Reader+.ready(..)) || call(* Reader+.mark(..)) || call(* Reader+.reset(..)) || call(* Reader+.skip(..))) && target(r)) && MOP_CommonPointCut();
	before (Reader r) : Reader_ManipulateAfterClose_manipulate(r) {
		MultiSpec_1RuntimeMonitor.Reader_ManipulateAfterClose_manipulateEvent(r);
	}

	pointcut BufferedInputStream_SynchronizedFill_fill(BufferedInputStream i) : (call(* BufferedInputStream.fill(..)) && target(i) && !cflow(call(synchronized * *.*(..)))) && MOP_CommonPointCut();
	before (BufferedInputStream i) : BufferedInputStream_SynchronizedFill_fill(i) {
		MultiSpec_1RuntimeMonitor.BufferedInputStream_SynchronizedFill_fillEvent(i);
	}

	pointcut PipedOutputStream_UnconnectedWrite_write(PipedOutputStream o) : (call(* PipedOutputStream+.write(..)) && target(o)) && MOP_CommonPointCut();
	before (PipedOutputStream o) : PipedOutputStream_UnconnectedWrite_write(o) {
		MultiSpec_1RuntimeMonitor.PipedOutputStream_UnconnectedWrite_writeEvent(o);
	}

	pointcut PipedOutputStream_UnconnectedWrite_connect2(PipedOutputStream o) : (call(* PipedOutputStream+.connect(PipedInputStream+)) && target(o)) && MOP_CommonPointCut();
	before (PipedOutputStream o) : PipedOutputStream_UnconnectedWrite_connect2(o) {
		MultiSpec_1RuntimeMonitor.PipedOutputStream_UnconnectedWrite_connect2Event(o);
	}

	pointcut PipedOutputStream_UnconnectedWrite_connect1(PipedOutputStream o) : (call(* PipedInputStream+.connect(PipedOutputStream+)) && args(o)) && MOP_CommonPointCut();
	before (PipedOutputStream o) : PipedOutputStream_UnconnectedWrite_connect1(o) {
		MultiSpec_1RuntimeMonitor.PipedOutputStream_UnconnectedWrite_connect1Event(o);
	}

	pointcut PipedOutputStream_UnconnectedWrite_create_oi(PipedOutputStream o) : (call(PipedInputStream+.new(PipedOutputStream+)) && args(o)) && MOP_CommonPointCut();
	before (PipedOutputStream o) : PipedOutputStream_UnconnectedWrite_create_oi(o) {
		MultiSpec_1RuntimeMonitor.PipedOutputStream_UnconnectedWrite_create_oiEvent(o);
	}

	pointcut InputStream_MarkAfterClose_close(InputStream i) : (call(* InputStream+.close(..)) && target(i)) && MOP_CommonPointCut();
	before (InputStream i) : InputStream_MarkAfterClose_close(i) {
		MultiSpec_1RuntimeMonitor.InputStream_MarkAfterClose_closeEvent(i);
	}

	pointcut InputStream_MarkAfterClose_mark(InputStream i) : (call(* InputStream+.mark(..)) && target(i)) && MOP_CommonPointCut();
	before (InputStream i) : InputStream_MarkAfterClose_mark(i) {
		MultiSpec_1RuntimeMonitor.InputStream_MarkAfterClose_markEvent(i);
	}

	pointcut PipedOutputStream_UnconnectedWrite_create() : (call(PipedOutputStream+.new())) && MOP_CommonPointCut();
	after () returning (PipedOutputStream o) : PipedOutputStream_UnconnectedWrite_create() {
		MultiSpec_1RuntimeMonitor.PipedOutputStream_UnconnectedWrite_createEvent(o);
	}

	pointcut PipedOutputStream_UnconnectedWrite_create_io() : (call(PipedOutputStream+.new(PipedInputStream+))) && MOP_CommonPointCut();
	after () returning (PipedOutputStream o) : PipedOutputStream_UnconnectedWrite_create_io() {
		MultiSpec_1RuntimeMonitor.PipedOutputStream_UnconnectedWrite_create_ioEvent(o);
	}

	pointcut Console_FillZeroPassword_read() : (call(char[] Console+.readPassword(..))) && MOP_CommonPointCut();
	after () returning (Object pwd) : Console_FillZeroPassword_read() {
		MultiSpec_1RuntimeMonitor.Console_FillZeroPassword_readEvent(pwd);
	}

	pointcut Reader_ReadAheadLimit_read1(Reader r) : (call(* Reader+.read()) && target(r) && if(r instanceof BufferedReader || r instanceof LineNumberReader)) && MOP_CommonPointCut();
	after (Reader r) returning (int n) : Reader_ReadAheadLimit_read1(r) {
		MultiSpec_1RuntimeMonitor.Reader_ReadAheadLimit_read1Event(r, n);
	}

	pointcut Reader_ReadAheadLimit_readn(Reader r) : (call(* Reader+.read(char[], ..)) && target(r) && if(r instanceof BufferedReader || r instanceof LineNumberReader)) && MOP_CommonPointCut();
	after (Reader r) returning (int n) : Reader_ReadAheadLimit_readn(r) {
		MultiSpec_1RuntimeMonitor.Reader_ReadAheadLimit_readnEvent(r, n);
	}

	pointcut Serializable_NoArgConstructor_staticinit() : (staticinitialization(Serializable+)) && MOP_CommonPointCut();
	after () : Serializable_NoArgConstructor_staticinit() {
		//Serializable_NoArgConstructor_staticinit
		MultiSpec_1RuntimeMonitor.Serializable_NoArgConstructor_staticinitEvent(thisJoinPoint.getStaticPart().getSignature());
		//Serializable_UID_staticinit
		MultiSpec_1RuntimeMonitor.Serializable_UID_staticinitEvent(thisJoinPoint.getStaticPart().getSignature());
	}

	pointcut Console_CloseWriter_getwriter() : (call(Writer+ Console+.writer())) && MOP_CommonPointCut();
	after () returning (Writer w) : Console_CloseWriter_getwriter() {
		MultiSpec_1RuntimeMonitor.Console_CloseWriter_getwriterEvent(w);
	}

	pointcut ObjectOutput_Close_create() : (call(ObjectOutput+.new(..))) && MOP_CommonPointCut();
	after () returning (ObjectOutput o) : ObjectOutput_Close_create() {
		MultiSpec_1RuntimeMonitor.ObjectOutput_Close_createEvent(o);
	}

	pointcut PipedInputStream_UnconnectedRead_create() : (call(PipedInputStream+.new())) && MOP_CommonPointCut();
	after () returning (PipedInputStream i) : PipedInputStream_UnconnectedRead_create() {
		MultiSpec_1RuntimeMonitor.PipedInputStream_UnconnectedRead_createEvent(i);
	}

	pointcut PipedInputStream_UnconnectedRead_create_oi() : (call(PipedInputStream+.new(PipedOutputStream+))) && MOP_CommonPointCut();
	after () returning (PipedInputStream i) : PipedInputStream_UnconnectedRead_create_oi() {
		MultiSpec_1RuntimeMonitor.PipedInputStream_UnconnectedRead_create_oiEvent(i);
	}

	pointcut PushbackInputStream_UnreadAheadLimit_create_3() : (call(PushbackInputStream+.new(InputStream))) && MOP_CommonPointCut();
	after () returning (PushbackInputStream p) : PushbackInputStream_UnreadAheadLimit_create_3() {
		MultiSpec_1RuntimeMonitor.PushbackInputStream_UnreadAheadLimit_createEvent(p);
	}

	pointcut PushbackInputStream_UnreadAheadLimit_create_4(int size) : (call(PushbackInputStream+.new(InputStream, int)) && args(.., size)) && MOP_CommonPointCut();
	after (int size) returning (PushbackInputStream p) : PushbackInputStream_UnreadAheadLimit_create_4(size) {
		MultiSpec_1RuntimeMonitor.PushbackInputStream_UnreadAheadLimit_createEvent(size, p);
	}

	pointcut PushbackInputStream_UnreadAheadLimit_read1(PushbackInputStream p) : (call(* PushbackInputStream+.read()) && target(p)) && MOP_CommonPointCut();
	after (PushbackInputStream p) returning (int r) : PushbackInputStream_UnreadAheadLimit_read1(p) {
		MultiSpec_1RuntimeMonitor.PushbackInputStream_UnreadAheadLimit_read1Event(p, r);
	}

	pointcut PushbackInputStream_UnreadAheadLimit_read2(PushbackInputStream p) : (call(* PushbackInputStream+.read(byte[], int, int)) && target(p)) && MOP_CommonPointCut();
	after (PushbackInputStream p) returning (int n) : PushbackInputStream_UnreadAheadLimit_read2(p) {
		MultiSpec_1RuntimeMonitor.PushbackInputStream_UnreadAheadLimit_read2Event(p, n);
	}

	pointcut File_DeleteTempFile_create() : (call(File+ File.createTempFile(..))) && MOP_CommonPointCut();
	after () returning (File f) : File_DeleteTempFile_create() {
		MultiSpec_1RuntimeMonitor.File_DeleteTempFile_createEvent(f);
	}

	pointcut ObjectStreamClass_Initialize_create() : (call(ObjectStreamClass+.new())) && MOP_CommonPointCut();
	after () returning (ObjectStreamClass c) : ObjectStreamClass_Initialize_create() {
		MultiSpec_1RuntimeMonitor.ObjectStreamClass_Initialize_createEvent(c);
	}

	pointcut ByteArrayOutputStream_FlushBeforeRetrieve_outputstreaminit(ByteArrayOutputStream b) : (call(OutputStream+.new(..)) && args(b, ..)) && MOP_CommonPointCut();
	after (ByteArrayOutputStream b) returning (OutputStream o) : ByteArrayOutputStream_FlushBeforeRetrieve_outputstreaminit(b) {
		MultiSpec_1RuntimeMonitor.ByteArrayOutputStream_FlushBeforeRetrieve_outputstreaminitEvent(b, o);
	}

	pointcut StreamTokenizer_AccessInvalidField_nexttoken_word(StreamTokenizer s) : (call(* StreamTokenizer+.nextToken(..)) && target(s)) && MOP_CommonPointCut();
	after (StreamTokenizer s) returning (int t) : StreamTokenizer_AccessInvalidField_nexttoken_word(s) {
		//StreamTokenizer_AccessInvalidField_nexttoken_word
		MultiSpec_1RuntimeMonitor.StreamTokenizer_AccessInvalidField_nexttoken_wordEvent(s, t);
		//StreamTokenizer_AccessInvalidField_nexttoken_num
		MultiSpec_1RuntimeMonitor.StreamTokenizer_AccessInvalidField_nexttoken_numEvent(s, t);
		//StreamTokenizer_AccessInvalidField_nexttoken_eol
		MultiSpec_1RuntimeMonitor.StreamTokenizer_AccessInvalidField_nexttoken_eolEvent(s, t);
		//StreamTokenizer_AccessInvalidField_nexttoken_eof
		MultiSpec_1RuntimeMonitor.StreamTokenizer_AccessInvalidField_nexttoken_eofEvent(s, t);
	}

	pointcut PipedStream_SingleThread_create1(PipedOutputStream o) : (call(PipedInputStream+.new(PipedOutputStream+)) && args(o)) && MOP_CommonPointCut();
	after (PipedOutputStream o) returning (PipedInputStream i) : PipedStream_SingleThread_create1(o) {
		MultiSpec_1RuntimeMonitor.PipedStream_SingleThread_create1Event(o, i);
	}

	pointcut PipedStream_SingleThread_create3(PipedInputStream i) : (call(PipedOutputStream+.new(PipedInputStream+)) && args(i)) && MOP_CommonPointCut();
	after (PipedInputStream i) returning (PipedOutputStream o) : PipedStream_SingleThread_create3(i) {
		MultiSpec_1RuntimeMonitor.PipedStream_SingleThread_create3Event(i, o);
	}

	pointcut InputStream_ReadAheadLimit_read1(InputStream i) : (call(* InputStream+.read()) && target(i) && if(i instanceof BufferedInputStream || i instanceof DataInputStream || i instanceof LineNumberInputStream)) && MOP_CommonPointCut();
	after (InputStream i) returning (int n) : InputStream_ReadAheadLimit_read1(i) {
		MultiSpec_1RuntimeMonitor.InputStream_ReadAheadLimit_read1Event(i, n);
	}

	pointcut InputStream_ReadAheadLimit_readn(InputStream i) : (call(* InputStream+.read(char[], ..)) && target(i) && if(i instanceof BufferedInputStream || i instanceof DataInputStream || i instanceof LineNumberInputStream)) && MOP_CommonPointCut();
	after (InputStream i) returning (int n) : InputStream_ReadAheadLimit_readn(i) {
		MultiSpec_1RuntimeMonitor.InputStream_ReadAheadLimit_readnEvent(i, n);
	}

	pointcut ObjectInput_Close_create() : (call(ObjectInput+.new(..))) && MOP_CommonPointCut();
	after () returning (ObjectInput i) : ObjectInput_Close_create() {
		MultiSpec_1RuntimeMonitor.ObjectInput_Close_createEvent(i);
	}

	pointcut Console_CloseReader_getreader() : (call(Reader+ Console+.reader())) && MOP_CommonPointCut();
	after () returning (Reader r) : Console_CloseReader_getreader() {
		MultiSpec_1RuntimeMonitor.Console_CloseReader_getreaderEvent(r);
	}

	pointcut ServiceLoaderIterator_Remove_create(ServiceLoader s) : (call(Iterator ServiceLoader.iterator()) && target(s)) && MOP_CommonPointCut();
	after (ServiceLoader s) returning (Iterator i) : ServiceLoaderIterator_Remove_create(s) {
		MultiSpec_1RuntimeMonitor.ServiceLoaderIterator_Remove_createEvent(s, i);
	}

	pointcut List_UnsafeListIterator_create(List l) : (call(ListIterator List+.listIterator()) && target(l)) && MOP_CommonPointCut();
	after (List l) returning (ListIterator i) : List_UnsafeListIterator_create(l) {
		MultiSpec_1RuntimeMonitor.List_UnsafeListIterator_createEvent(l, i);
	}

	pointcut Collection_UnsynchronizedAddAll_leave(Collection t, Collection s) : (call(boolean Collection+.addAll(..)) && target(t) && args(s)) && MOP_CommonPointCut();
	after (Collection t, Collection s) : Collection_UnsynchronizedAddAll_leave(t, s) {
		MultiSpec_1RuntimeMonitor.Collection_UnsynchronizedAddAll_leaveEvent(t, s);
	}

	pointcut InvalidPropertiesFormatException_NonSerializable_deserialize(ObjectInputStream in) : (call(* ObjectInputStream+.readObject(..)) && target(in)) && MOP_CommonPointCut();
	after (ObjectInputStream in) returning (InvalidPropertiesFormatException obj) : InvalidPropertiesFormatException_NonSerializable_deserialize(in) {
		MultiSpec_1RuntimeMonitor.InvalidPropertiesFormatException_NonSerializable_deserializeEvent(in, obj);
	}

	pointcut Map_StandardConstructors_staticinit() : (staticinitialization(Map+)) && MOP_CommonPointCut();
	after () : Map_StandardConstructors_staticinit() {
		MultiSpec_1RuntimeMonitor.Map_StandardConstructors_staticinitEvent(thisJoinPoint.getStaticPart().getSignature());
	}

	pointcut Map_UnsafeIterator_getset(Map m) : ((call(Set Map+.keySet()) || call(Set Map+.entrySet()) || call(Collection Map+.values())) && target(m)) && MOP_CommonPointCut();
	after (Map m) returning (Collection c) : Map_UnsafeIterator_getset(m) {
		//Map_UnsafeIterator_getset
		MultiSpec_1RuntimeMonitor.Map_UnsafeIterator_getsetEvent(m, c);
		//Map_CollectionViewAdd_getset
		MultiSpec_1RuntimeMonitor.Map_CollectionViewAdd_getsetEvent(m, c);
	}

	pointcut Map_UnsafeIterator_getiter(Collection c) : (call(Iterator Iterable+.iterator()) && target(c)) && MOP_CommonPointCut();
	after (Collection c) returning (Iterator i) : Map_UnsafeIterator_getiter(c) {
		//Map_UnsafeIterator_getiter
		MultiSpec_1RuntimeMonitor.Map_UnsafeIterator_getiterEvent(c, i);
		//Collection_UnsafeIterator_create
		MultiSpec_1RuntimeMonitor.Collection_UnsafeIterator_createEvent(c, i);
		//NavigableMap_Modification_getiter
		MultiSpec_1RuntimeMonitor.NavigableMap_Modification_getiterEvent(c, i);
	}

	pointcut List_UnsynchronizedSubList_createsublist(List b) : (call(* List.subList(..)) && target(b)) && MOP_CommonPointCut();
	after (List b) returning (List s) : List_UnsynchronizedSubList_createsublist(b) {
		MultiSpec_1RuntimeMonitor.List_UnsynchronizedSubList_createsublistEvent(b, s);
	}

	pointcut Map_UnsynchronizedAddAll_leave(Map t, Map s) : (call(void Map+.putAll(..)) && target(t) && args(s)) && MOP_CommonPointCut();
	after (Map t, Map s) : Map_UnsynchronizedAddAll_leave(t, s) {
		MultiSpec_1RuntimeMonitor.Map_UnsynchronizedAddAll_leaveEvent(t, s);
	}

	pointcut ListIterator_Set_create() : (call(ListIterator Iterable+.listIterator())) && MOP_CommonPointCut();
	after () returning (ListIterator i) : ListIterator_Set_create() {
		MultiSpec_1RuntimeMonitor.ListIterator_Set_createEvent(i);
	}

	pointcut Collection_StandardConstructors_staticinit() : (staticinitialization(Collection+)) && MOP_CommonPointCut();
	after () : Collection_StandardConstructors_staticinit() {
		//Collection_StandardConstructors_staticinit
		MultiSpec_1RuntimeMonitor.Collection_StandardConstructors_staticinitEvent(thisJoinPoint.getStaticPart().getSignature());
		//Collection_HashCode_staticinit
		MultiSpec_1RuntimeMonitor.Collection_HashCode_staticinitEvent(thisJoinPoint.getStaticPart().getSignature());
	}

	pointcut ListIterator_hasNextPrevious_hasnexttrue(ListIterator i) : (call(* ListIterator.hasNext()) && target(i)) && MOP_CommonPointCut();
	after (ListIterator i) returning (boolean b) : ListIterator_hasNextPrevious_hasnexttrue(i) {
		//ListIterator_hasNextPrevious_hasnexttrue
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_hasnexttrueEvent(i, b);
		//ListIterator_hasNextPrevious_hasnextfalse
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_hasnextfalseEvent(i, b);
	}

	pointcut ListIterator_hasNextPrevious_hasprevioustrue(ListIterator i) : (call(* ListIterator.hasPrevious()) && target(i)) && MOP_CommonPointCut();
	after (ListIterator i) returning (boolean b) : ListIterator_hasNextPrevious_hasprevioustrue(i) {
		//ListIterator_hasNextPrevious_hasprevioustrue
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_hasprevioustrueEvent(i, b);
		//ListIterator_hasNextPrevious_haspreviousfalse
		MultiSpec_1RuntimeMonitor.ListIterator_hasNextPrevious_haspreviousfalseEvent(i, b);
	}

	pointcut ResourceBundleControl_MutateFormatList_create() : (call(List ResourceBundle.Control.getFormats(..)) || call(List ResourceBundle.Control.getCandidateLocales(..))) && MOP_CommonPointCut();
	after () returning (List l) : ResourceBundleControl_MutateFormatList_create() {
		MultiSpec_1RuntimeMonitor.ResourceBundleControl_MutateFormatList_createEvent(l);
	}

	pointcut Iterator_HasNext_hasnexttrue(Iterator i) : (call(* Iterator+.hasNext()) && target(i)) && MOP_CommonPointCut();
	after (Iterator i) returning (boolean b) : Iterator_HasNext_hasnexttrue(i) {
		//Iterator_HasNext_hasnexttrue
		MultiSpec_1RuntimeMonitor.Iterator_HasNext_hasnexttrueEvent(i, b);
		//Iterator_HasNext_hasnextfalse
		MultiSpec_1RuntimeMonitor.Iterator_HasNext_hasnextfalseEvent(i, b);
	}

	pointcut NavigableSet_Modification_create(NavigableSet s1) : (call(NavigableSet NavigableSet+.descendingSet()) && target(s1)) && MOP_CommonPointCut();
	after (NavigableSet s1) returning (NavigableSet s2) : NavigableSet_Modification_create(s1) {
		MultiSpec_1RuntimeMonitor.NavigableSet_Modification_createEvent(s1, s2);
	}

	pointcut NavigableSet_Modification_getiter1(NavigableSet s1) : (call(Iterator Iterable+.iterator()) && target(s1)) && MOP_CommonPointCut();
	after (NavigableSet s1) returning (Iterator i) : NavigableSet_Modification_getiter1(s1) {
		MultiSpec_1RuntimeMonitor.NavigableSet_Modification_getiter1Event(s1, i);
	}

	pointcut NavigableSet_Modification_getiter2(NavigableSet s2) : (call(Iterator Iterable+.iterator()) && target(s2)) && MOP_CommonPointCut();
	after (NavigableSet s2) returning (Iterator i) : NavigableSet_Modification_getiter2(s2) {
		MultiSpec_1RuntimeMonitor.NavigableSet_Modification_getiter2Event(s2, i);
	}

	pointcut SortedMap_StandardConstructors_staticinit() : (staticinitialization(SortedMap+)) && MOP_CommonPointCut();
	after () : SortedMap_StandardConstructors_staticinit() {
		MultiSpec_1RuntimeMonitor.SortedMap_StandardConstructors_staticinitEvent(thisJoinPoint.getStaticPart().getSignature());
	}

	pointcut Collections_SynchronizedMap_sync() : (call(* Collections.synchronizedMap(Map)) || call(* Collections.synchronizedSortedMap(SortedMap))) && MOP_CommonPointCut();
	after () returning (Map syncMap) : Collections_SynchronizedMap_sync() {
		MultiSpec_1RuntimeMonitor.Collections_SynchronizedMap_syncEvent(syncMap);
	}

	pointcut Collections_SynchronizedMap_createSet(Map syncMap) : ((call(Set Map+.keySet()) || call(Set Map+.entrySet()) || call(Collection Map+.values())) && target(syncMap)) && MOP_CommonPointCut();
	after (Map syncMap) returning (Collection col) : Collections_SynchronizedMap_createSet(syncMap) {
		MultiSpec_1RuntimeMonitor.Collections_SynchronizedMap_createSetEvent(syncMap, col);
	}

	pointcut Collections_SynchronizedMap_syncCreateIter(Collection col) : (call(* Collection+.iterator()) && target(col)) && MOP_CommonPointCut();
	after (Collection col) returning (Iterator iter) : Collections_SynchronizedMap_syncCreateIter(col) {
		//Collections_SynchronizedMap_syncCreateIter
		MultiSpec_1RuntimeMonitor.Collections_SynchronizedMap_syncCreateIterEvent(col, iter);
		//Collections_SynchronizedMap_asyncCreateIter
		MultiSpec_1RuntimeMonitor.Collections_SynchronizedMap_asyncCreateIterEvent(col, iter);
		//Collections_SynchronizedCollection_syncCreateIter
		MultiSpec_1RuntimeMonitor.Collections_SynchronizedCollection_syncCreateIterEvent(col, iter);
		//Collections_SynchronizedCollection_asyncCreateIter
		MultiSpec_1RuntimeMonitor.Collections_SynchronizedCollection_asyncCreateIterEvent(col, iter);
	}

	pointcut Deque_OfferRatherThanAdd_create() : (call(LinkedBlockingDeque+.new(int))) && MOP_CommonPointCut();
	after () returning (Deque q) : Deque_OfferRatherThanAdd_create() {
		MultiSpec_1RuntimeMonitor.Deque_OfferRatherThanAdd_createEvent(q);
	}

	pointcut NavigableMap_UnsafeIterator_getset(NavigableMap m) : ((call(Set NavigableMap+.navigableKeySet()) || call(Set NavigableMap+.descendingKeySet())) && target(m)) && MOP_CommonPointCut();
	after (NavigableMap m) returning (Set s) : NavigableMap_UnsafeIterator_getset(m) {
		MultiSpec_1RuntimeMonitor.NavigableMap_UnsafeIterator_getsetEvent(m, s);
	}

	pointcut NavigableMap_UnsafeIterator_getiter(Set s) : (call(Iterator Iterable+.iterator()) && target(s)) && MOP_CommonPointCut();
	after (Set s) returning (Iterator i) : NavigableMap_UnsafeIterator_getiter(s) {
		MultiSpec_1RuntimeMonitor.NavigableMap_UnsafeIterator_getiterEvent(s, i);
	}

	pointcut Properties_ManipulateAfterLoad_close(InputStream i) : (call(* Properties+.loadFromXML(InputStream)) && args(i) && !args(ByteArrayInputStream) && !args(StringBufferInputStream)) && MOP_CommonPointCut();
	after (InputStream i) : Properties_ManipulateAfterLoad_close(i) {
		MultiSpec_1RuntimeMonitor.Properties_ManipulateAfterLoad_closeEvent(i);
	}

	pointcut StringTokenizer_HasMoreElements_hasnexttrue(StringTokenizer i) : ((call(boolean StringTokenizer.hasMoreTokens()) || call(boolean StringTokenizer.hasMoreElements())) && target(i)) && MOP_CommonPointCut();
	after (StringTokenizer i) returning (boolean b) : StringTokenizer_HasMoreElements_hasnexttrue(i) {
		//StringTokenizer_HasMoreElements_hasnexttrue
		MultiSpec_1RuntimeMonitor.StringTokenizer_HasMoreElements_hasnexttrueEvent(i, b);
		//StringTokenizer_HasMoreElements_hasnextfalse
		MultiSpec_1RuntimeMonitor.StringTokenizer_HasMoreElements_hasnextfalseEvent(i, b);
	}

	pointcut Random_OverrideNext_staticinit() : (staticinitialization(Random+)) && MOP_CommonPointCut();
	after () : Random_OverrideNext_staticinit() {
		MultiSpec_1RuntimeMonitor.Random_OverrideNext_staticinitEvent(thisJoinPoint.getStaticPart().getSignature());
	}

	pointcut Collections_SynchronizedCollection_sync() : (call(* Collections.synchronizedCollection(Collection)) || call(* Collections.synchronizedSet(Set)) || call(* Collections.synchronizedSortedSet(SortedSet)) || call(* Collections.synchronizedList(List))) && MOP_CommonPointCut();
	after () returning (Collection col) : Collections_SynchronizedCollection_sync() {
		MultiSpec_1RuntimeMonitor.Collections_SynchronizedCollection_syncEvent(col);
	}

	pointcut ArrayDeque_UnsafeIterator_create(ArrayDeque q) : (target(ArrayDeque) && (call(Iterator Iterable+.iterator()) || call(Iterator Deque+.descendingIterator())) && target(q)) && MOP_CommonPointCut();
	after (ArrayDeque q) returning (Iterator i) : ArrayDeque_UnsafeIterator_create(q) {
		MultiSpec_1RuntimeMonitor.ArrayDeque_UnsafeIterator_createEvent(q, i);
	}

	pointcut ServiceLoader_MultipleConcurrentThreads_create() : (call(ServiceLoader ServiceLoader+.load*(..))) && MOP_CommonPointCut();
	after () returning (ServiceLoader s) : ServiceLoader_MultipleConcurrentThreads_create() {
		Thread t2 = Thread.currentThread();
		MultiSpec_1RuntimeMonitor.ServiceLoader_MultipleConcurrentThreads_createEvent(t2, s);
	}

	pointcut NavigableMap_Modification_create(NavigableMap m1) : (call(NavigableMap NavigableMap+.descendingMap()) && target(m1)) && MOP_CommonPointCut();
	after (NavigableMap m1) returning (NavigableMap m2) : NavigableMap_Modification_create(m1) {
		MultiSpec_1RuntimeMonitor.NavigableMap_Modification_createEvent(m1, m2);
	}

	pointcut NavigableMap_Modification_getset1(NavigableMap m1) : ((call(Set Map+.keySet()) || call(Set Map+.entrySet()) || call(Collection Map+.values())) && target(m1)) && MOP_CommonPointCut();
	after (NavigableMap m1) returning (Collection c) : NavigableMap_Modification_getset1(m1) {
		MultiSpec_1RuntimeMonitor.NavigableMap_Modification_getset1Event(m1, c);
	}

	pointcut NavigableMap_Modification_getset2(NavigableMap m2) : ((call(Set Map+.keySet()) || call(Set Map+.entrySet()) || call(Collection Map+.values())) && target(m2)) && MOP_CommonPointCut();
	after (NavigableMap m2) returning (Collection c) : NavigableMap_Modification_getset2(m2) {
		MultiSpec_1RuntimeMonitor.NavigableMap_Modification_getset2Event(m2, c);
	}

	pointcut SortedSet_StandardConstructors_staticinit() : (staticinitialization(SortedSet+)) && MOP_CommonPointCut();
	after () : SortedSet_StandardConstructors_staticinit() {
		MultiSpec_1RuntimeMonitor.SortedSet_StandardConstructors_staticinitEvent(thisJoinPoint.getStaticPart().getSignature());
	}

	pointcut Scanner_ManipulateAfterClose_create(Closeable c) : ((call(Scanner+.new(InputStream, ..)) || call(Scanner+.new(Readable, ..)) || call(Scanner+.new(ReadableByteChannel, ..))) && args(c, ..)) && MOP_CommonPointCut();
	after (Closeable c) returning (Scanner s) : Scanner_ManipulateAfterClose_create(c) {
		MultiSpec_1RuntimeMonitor.Scanner_ManipulateAfterClose_createEvent(c, s);
	}

	pointcut Scanner_ManipulateAfterClose_close(Scanner s) : (call(* Scanner+.close()) && target(s) && !args(ByteArrayInputStream) && !args(StringBufferInputStream)) && MOP_CommonPointCut();
	after (Scanner s) : Scanner_ManipulateAfterClose_close(s) {
		MultiSpec_1RuntimeMonitor.Scanner_ManipulateAfterClose_closeEvent(s);
	}

	pointcut Socket_OutputStreamUnavailable_create_connected() : (call(Socket.new(InetAddress, int)) || call(Socket.new(InetAddress, int, boolean)) || call(Socket.new(InetAddress, int, InetAddress, int)) || call(Socket.new(String, int)) || call(Socket.new(String, int, boolean)) || call(Socket.new(String, int, InetAddress, int))) && MOP_CommonPointCut();
	after () returning (Socket sock) : Socket_OutputStreamUnavailable_create_connected() {
		//Socket_OutputStreamUnavailable_create_connected
		MultiSpec_1RuntimeMonitor.Socket_OutputStreamUnavailable_create_connectedEvent(sock);
		//Socket_PerformancePreferences_create_connected
		MultiSpec_1RuntimeMonitor.Socket_PerformancePreferences_create_connectedEvent(sock);
		//Socket_ReuseAddress_create_connected
		MultiSpec_1RuntimeMonitor.Socket_ReuseAddress_create_connectedEvent(sock);
		//Socket_LargeReceiveBuffer_create_connected
		MultiSpec_1RuntimeMonitor.Socket_LargeReceiveBuffer_create_connectedEvent(sock);
		//Socket_InputStreamUnavailable_create_connected
		MultiSpec_1RuntimeMonitor.Socket_InputStreamUnavailable_create_connectedEvent(sock);
	}

	pointcut Socket_OutputStreamUnavailable_create_unconnected() : (call(Socket.new()) || call(Socket.new(Proxy)) || call(Socket.new(SocketImpl))) && MOP_CommonPointCut();
	after () returning (Socket sock) : Socket_OutputStreamUnavailable_create_unconnected() {
		//Socket_OutputStreamUnavailable_create_unconnected
		MultiSpec_1RuntimeMonitor.Socket_OutputStreamUnavailable_create_unconnectedEvent(sock);
		//Socket_PerformancePreferences_create_unconnected
		MultiSpec_1RuntimeMonitor.Socket_PerformancePreferences_create_unconnectedEvent(sock);
		//Socket_ReuseAddress_create_unconnected
		MultiSpec_1RuntimeMonitor.Socket_ReuseAddress_create_unconnectedEvent(sock);
		//Socket_LargeReceiveBuffer_create_unconnected
		MultiSpec_1RuntimeMonitor.Socket_LargeReceiveBuffer_create_unconnectedEvent(sock);
		//Socket_InputStreamUnavailable_create_unconnected
		MultiSpec_1RuntimeMonitor.Socket_InputStreamUnavailable_create_unconnectedEvent(sock);
	}

	pointcut Authenticator_OverrideGetPasswordAuthentication_staticinit() : (staticinitialization(Authenticator+)) && MOP_CommonPointCut();
	after () : Authenticator_OverrideGetPasswordAuthentication_staticinit() {
		MultiSpec_1RuntimeMonitor.Authenticator_OverrideGetPasswordAuthentication_staticinitEvent(thisJoinPoint.getStaticPart().getSignature());
	}

	pointcut Socket_CloseOutput_getoutput(Socket sock) : (call(OutputStream Socket+.getOutputStream()) && target(sock)) && MOP_CommonPointCut();
	after (Socket sock) returning (OutputStream output) : Socket_CloseOutput_getoutput(sock) {
		//Socket_CloseOutput_getoutput
		MultiSpec_1RuntimeMonitor.Socket_CloseOutput_getoutputEvent(sock, output);
		//Socket_SetTimeoutBeforeBlockingOutput_getoutput
		MultiSpec_1RuntimeMonitor.Socket_SetTimeoutBeforeBlockingOutput_getoutputEvent(sock, output);
	}

	pointcut PasswordAuthentication_FillZeroPassword_read() : (call(char[] PasswordAuthentication+.getPassword(..))) && MOP_CommonPointCut();
	after () returning (Object pwd) : PasswordAuthentication_FillZeroPassword_read() {
		MultiSpec_1RuntimeMonitor.PasswordAuthentication_FillZeroPassword_readEvent(pwd);
	}

	pointcut Socket_SetTimeoutBeforeBlockingInput_getinput(Socket sock) : (call(InputStream Socket+.getInputStream()) && target(sock)) && MOP_CommonPointCut();
	after (Socket sock) returning (InputStream input) : Socket_SetTimeoutBeforeBlockingInput_getinput(sock) {
		//Socket_SetTimeoutBeforeBlockingInput_getinput
		MultiSpec_1RuntimeMonitor.Socket_SetTimeoutBeforeBlockingInput_getinputEvent(sock, input);
		//Socket_CloseInput_getinput
		MultiSpec_1RuntimeMonitor.Socket_CloseInput_getinputEvent(sock, input);
	}

	pointcut Socket_SetTimeoutBeforeBlockingInput_leave(InputStream input) : (call(* InputStream+.read(..)) && target(input)) && MOP_CommonPointCut();
	after (InputStream input) : Socket_SetTimeoutBeforeBlockingInput_leave(input) {
		MultiSpec_1RuntimeMonitor.Socket_SetTimeoutBeforeBlockingInput_leaveEvent(input);
	}

	pointcut ServerSocket_ReuseAddress_create_bound() : (call(ServerSocket.new(int, ..))) && MOP_CommonPointCut();
	after () returning (ServerSocket sock) : ServerSocket_ReuseAddress_create_bound() {
		//ServerSocket_ReuseAddress_create_bound
		MultiSpec_1RuntimeMonitor.ServerSocket_ReuseAddress_create_boundEvent(sock);
		//ServerSocket_PerformancePreferences_create_bound
		MultiSpec_1RuntimeMonitor.ServerSocket_PerformancePreferences_create_boundEvent(sock);
		//ServerSocket_LargeReceiveBuffer_create_bound
		MultiSpec_1RuntimeMonitor.ServerSocket_LargeReceiveBuffer_create_boundEvent(sock);
	}

	pointcut ServerSocket_ReuseAddress_create_unbound() : (call(ServerSocket.new())) && MOP_CommonPointCut();
	after () returning (ServerSocket sock) : ServerSocket_ReuseAddress_create_unbound() {
		//ServerSocket_ReuseAddress_create_unbound
		MultiSpec_1RuntimeMonitor.ServerSocket_ReuseAddress_create_unboundEvent(sock);
		//ServerSocket_PerformancePreferences_create_unbound
		MultiSpec_1RuntimeMonitor.ServerSocket_PerformancePreferences_create_unboundEvent(sock);
		//ServerSocket_LargeReceiveBuffer_create_unbound
		MultiSpec_1RuntimeMonitor.ServerSocket_LargeReceiveBuffer_create_unboundEvent(sock);
	}

	pointcut ServerSocket_SetTimeoutBeforeBlocking_leave(ServerSocket sock) : (call(* ServerSocket+.accept(..)) && target(sock)) && MOP_CommonPointCut();
	after (ServerSocket sock) : ServerSocket_SetTimeoutBeforeBlocking_leave(sock) {
		MultiSpec_1RuntimeMonitor.ServerSocket_SetTimeoutBeforeBlocking_leaveEvent(sock);
	}

	pointcut SocketImpl_CloseOutput_getoutput(SocketImpl sock) : (call(OutputStream SocketImpl+.getOutputStream()) && target(sock)) && MOP_CommonPointCut();
	after (SocketImpl sock) returning (OutputStream output) : SocketImpl_CloseOutput_getoutput(sock) {
		MultiSpec_1RuntimeMonitor.SocketImpl_CloseOutput_getoutputEvent(sock, output);
	}

	pointcut Socket_SetTimeoutBeforeBlockingOutput_leave(OutputStream output) : (call(* OutputStream+.write(..)) && target(output)) && MOP_CommonPointCut();
	after (OutputStream output) : Socket_SetTimeoutBeforeBlockingOutput_leave(output) {
		MultiSpec_1RuntimeMonitor.Socket_SetTimeoutBeforeBlockingOutput_leaveEvent(output);
	}

	pointcut URLConnection_OverrideGetPermission_staticinit() : (staticinitialization(URLConnection+)) && MOP_CommonPointCut();
	after () : URLConnection_OverrideGetPermission_staticinit() {
		MultiSpec_1RuntimeMonitor.URLConnection_OverrideGetPermission_staticinitEvent(thisJoinPoint.getStaticPart().getSignature());
	}

	pointcut ShutdownHook_UnsafeSwingCall_swingcall1() : (call(* SwingUtilities+.invokeAndWait(..)) || call(* SwingUtilities+.invokeLater(..)) || call(* SwingWorker+.execute(..))) && MOP_CommonPointCut();
	void around () : ShutdownHook_UnsafeSwingCall_swingcall1() {
		boolean MOP_skipAroundAdvice = false;
		Thread t = Thread.currentThread();
		MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeSwingCall_swingcall1Event(t);
		if(MOP_skipAroundAdvice){
			return;
		} else {
			proceed();
		}
	}

	pointcut ShutdownHook_UnsafeSwingCall_swingcall2() : (call(* SwingWorker+.get(..))) && MOP_CommonPointCut();
	Object around () : ShutdownHook_UnsafeSwingCall_swingcall2() {
		boolean MOP_skipAroundAdvice = false;
		Thread t = Thread.currentThread();
		MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeSwingCall_swingcall2Event(t);
		if(MOP_skipAroundAdvice){
			return null;
		} else {
			return proceed();
		}
	}

	pointcut Runnable_OverrideRun_staticinit() : (staticinitialization(Runnable+)) && MOP_CommonPointCut();
	after () : Runnable_OverrideRun_staticinit() {
		MultiSpec_1RuntimeMonitor.Runnable_OverrideRun_staticinitEvent(thisJoinPoint.getStaticPart().getSignature());
	}

	pointcut ShutdownHook_UnsafeAWTCall_awtcall() : (call(* EventQueue.invokeAndWait(..)) || call(* EventQueue.invokeLater(..))) && MOP_CommonPointCut();
	void around () : ShutdownHook_UnsafeAWTCall_awtcall() {
		boolean MOP_skipAroundAdvice = false;
		Thread t = Thread.currentThread();
		MultiSpec_1RuntimeMonitor.ShutdownHook_UnsafeAWTCall_awtcallEvent(t);
		if(MOP_skipAroundAdvice){
			return;
		} else {
			proceed();
		}
	}

	pointcut Double_StaticFactory_constructor_create() : (call(Double+.new(double))) && MOP_CommonPointCut();
	after () returning (Double d) : Double_StaticFactory_constructor_create() {
		MultiSpec_1RuntimeMonitor.Double_StaticFactory_constructor_createEvent(d);
	}

	pointcut Long_StaticFactory_constructor_create() : (call(Long+.new(long))) && MOP_CommonPointCut();
	after () returning (Long l) : Long_StaticFactory_constructor_create() {
		MultiSpec_1RuntimeMonitor.Long_StaticFactory_constructor_createEvent(l);
	}

	pointcut Float_StaticFactory_constructor_create() : (call(Float+.new(float))) && MOP_CommonPointCut();
	after () returning (Float f) : Float_StaticFactory_constructor_create() {
		MultiSpec_1RuntimeMonitor.Float_StaticFactory_constructor_createEvent(f);
	}

	pointcut RuntimePermission_PermName_constructor_runtimeperm(String name) : (call(RuntimePermission.new(String)) && args(name)) && MOP_CommonPointCut();
	after (String name) returning (RuntimePermission r) : RuntimePermission_PermName_constructor_runtimeperm(name) {
		MultiSpec_1RuntimeMonitor.RuntimePermission_PermName_constructor_runtimepermEvent(name, r);
	}

	pointcut Integer_StaticFactory_constructor_create() : (call(Integer+.new(int))) && MOP_CommonPointCut();
	after () returning (Integer i) : Integer_StaticFactory_constructor_create() {
		MultiSpec_1RuntimeMonitor.Integer_StaticFactory_constructor_createEvent(i);
	}

	pointcut Short_StaticFactory_constructor_create() : (call(Short+.new(short))) && MOP_CommonPointCut();
	after () returning (Short l) : Short_StaticFactory_constructor_create() {
		MultiSpec_1RuntimeMonitor.Short_StaticFactory_constructor_createEvent(l);
	}

	pointcut SecurityManager_Permission_get(SecurityManager manager) : (call(* SecurityManager.getSecurityContext(..)) && target(manager)) && MOP_CommonPointCut();
	after (SecurityManager manager) returning (Object context) : SecurityManager_Permission_get(manager) {
		MultiSpec_1RuntimeMonitor.SecurityManager_Permission_getEvent(manager, context);
	}

	pointcut RuntimePermission_NullAction_constructor_runtimeperm(String name, String actions) : (call(RuntimePermission.new(String, String)) && args(name, actions)) && MOP_CommonPointCut();
	after (String name, String actions) returning (RuntimePermission r) : RuntimePermission_NullAction_constructor_runtimeperm(name, actions) {
		MultiSpec_1RuntimeMonitor.RuntimePermission_NullAction_constructor_runtimepermEvent(name, actions, r);
	}

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

	static HashMap<Thread, Runnable> ShutdownHook_LateRegister_start_ThreadToRunnable = new HashMap<Thread, Runnable>();
	static Thread ShutdownHook_LateRegister_start_MainThread = null;

	after (Runnable r) returning (Thread t): ((call(Thread+.new(Runnable+,..)) && args(r,..))|| (initialization(Thread+.new(ThreadGroup+, Runnable+,..)) && args(ThreadGroup, r,..))) && MOP_CommonPointCut() {
		while (!MultiSpec_1_MOPLock.tryLock()) {
			Thread.yield();
		}
		ShutdownHook_LateRegister_start_ThreadToRunnable.put(t, r);
		MultiSpec_1_MOPLock.unlock();
	}

	before (Thread t_1): ( execution(void Thread+.run()) && target(t_1) ) && MOP_CommonPointCut() {
		if(Thread.currentThread() == t_1) {
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_LateRegister_startEvent(t);
		}
	}

	before (Runnable r_1): ( execution(void Runnable+.run()) && !execution(void Thread+.run()) && target(r_1) ) && MOP_CommonPointCut() {
		while (!MultiSpec_1_MOPLock.tryLock()) {
			Thread.yield();
		}
		if(ShutdownHook_LateRegister_start_ThreadToRunnable.get(Thread.currentThread()) == r_1) {
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_LateRegister_startEvent(t);
		}
		MultiSpec_1_MOPLock.unlock();
	}

	before (): (execution(void *.main(..)) ) && MOP_CommonPointCut() {
		if(ShutdownHook_LateRegister_start_MainThread == null){
			ShutdownHook_LateRegister_start_MainThread = Thread.currentThread();
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.ShutdownHook_LateRegister_startEvent(t);
		}
	}

	static HashMap<Thread, Runnable> Thread_SetDaemonBeforeStart_start_ThreadToRunnable = new HashMap<Thread, Runnable>();
	static Thread Thread_SetDaemonBeforeStart_start_MainThread = null;

	after (Runnable r) returning (Thread t): ((call(Thread+.new(Runnable+,..)) && args(r,..))|| (initialization(Thread+.new(ThreadGroup+, Runnable+,..)) && args(ThreadGroup, r,..))) && MOP_CommonPointCut() {
		while (!MultiSpec_1_MOPLock.tryLock()) {
			Thread.yield();
		}
		Thread_SetDaemonBeforeStart_start_ThreadToRunnable.put(t, r);
		MultiSpec_1_MOPLock.unlock();
	}

	before (Thread t_1): ( execution(void Thread+.run()) && target(t_1) ) && MOP_CommonPointCut() {
		if(Thread.currentThread() == t_1) {
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.Thread_SetDaemonBeforeStart_startEvent(t);
		}
	}

	before (Runnable r_1): ( execution(void Runnable+.run()) && !execution(void Thread+.run()) && target(r_1) ) && MOP_CommonPointCut() {
		while (!MultiSpec_1_MOPLock.tryLock()) {
			Thread.yield();
		}
		if(Thread_SetDaemonBeforeStart_start_ThreadToRunnable.get(Thread.currentThread()) == r_1) {
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.Thread_SetDaemonBeforeStart_startEvent(t);
		}
		MultiSpec_1_MOPLock.unlock();
	}

	before (): (execution(void *.main(..)) ) && MOP_CommonPointCut() {
		if(Thread_SetDaemonBeforeStart_start_MainThread == null){
			Thread_SetDaemonBeforeStart_start_MainThread = Thread.currentThread();
			Thread t = Thread.currentThread();
			MultiSpec_1RuntimeMonitor.Thread_SetDaemonBeforeStart_startEvent(t);
		}
	}

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
