package mop;
import java.io.*;
import java.util.*;
import java.security.*;
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
import org.aspectj.lang.*;

final class FileCloseMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<FileCloseMonitor> {

FileCloseMonitor_Set(){
this.size = 0;
this.elements = new FileCloseMonitor[4];
}
final void event_write(FileWriter f) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
FileCloseMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final FileCloseMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_write(f);
if(monitorfinalMonitor.FileCloseMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_close(FileWriter f) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
FileCloseMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final FileCloseMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_close(f);
if(monitorfinalMonitor.FileCloseMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_endProg() {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
FileCloseMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final FileCloseMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_endProg();
if(monitorfinalMonitor.FileCloseMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class HasNextMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<HasNextMonitor> {

HasNextMonitor_Set(){
this.size = 0;
this.elements = new HasNextMonitor[4];
}
final void event_create(Collection c, Iterator i) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
HasNextMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final HasNextMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_create(c, i);
if(monitorfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_hasnext(Iterator i) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
HasNextMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final HasNextMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_hasnext(i);
if(monitorfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_next(Iterator i) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
HasNextMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final HasNextMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_next(i);
if(monitorfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class MsgDigestMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<MsgDigestMonitor> {

MsgDigestMonitor_Set(){
this.size = 0;
this.elements = new MsgDigestMonitor[4];
}
final void event_getInstance(MessageDigest P) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
MsgDigestMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final MsgDigestMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_getInstance(P);
if(monitorfinalMonitor.MsgDigestMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_update(MessageDigest P) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
MsgDigestMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final MsgDigestMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_update(P);
if(monitorfinalMonitor.MsgDigestMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_reset(MessageDigest P) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
MsgDigestMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final MsgDigestMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_reset(P);
if(monitorfinalMonitor.MsgDigestMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_digest(MessageDigest P) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
MsgDigestMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final MsgDigestMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_digest(P);
if(monitorfinalMonitor.MsgDigestMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class SafeEnumMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<SafeEnumMonitor> {

SafeEnumMonitor_Set(){
this.size = 0;
this.elements = new SafeEnumMonitor[4];
}
final void event_create(Vector v, Enumeration e) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeEnumMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeEnumMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_create(v, e);
if(monitorfinalMonitor.SafeEnumMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_updatesource(Vector v) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeEnumMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeEnumMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_updatesource(v);
if(monitorfinalMonitor.SafeEnumMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_next(Enumeration e) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeEnumMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeEnumMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_next(e);
if(monitorfinalMonitor.SafeEnumMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class SafeFileMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<SafeFileMonitor> {

SafeFileMonitor_Set(){
this.size = 0;
this.elements = new SafeFileMonitor[4];
}
final void event_open(Thread t, FileReader f) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeFileMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeFileMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_open(t, f);
if(monitorfinalMonitor.SafeFileMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_close(FileReader f, Thread t) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeFileMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeFileMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_close(f, t);
if(monitorfinalMonitor.SafeFileMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_begin(Thread t) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeFileMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeFileMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_begin(t);
if(monitorfinalMonitor.SafeFileMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_end(Thread t) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeFileMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeFileMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_end(t);
if(monitorfinalMonitor.SafeFileMonitor_Prop_1_Category_fail) {
monitorfinalMonitor.Prop_1_handler_fail();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class SafeFileWriterMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<SafeFileWriterMonitor> {

SafeFileWriterMonitor_Set(){
this.size = 0;
this.elements = new SafeFileWriterMonitor[4];
}
final void event_open(FileWriter f) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeFileWriterMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeFileWriterMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_open(f);
if(monitorfinalMonitor.SafeFileWriterMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_write(FileWriter f) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeFileWriterMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeFileWriterMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_write(f);
if(monitorfinalMonitor.SafeFileWriterMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_close(FileWriter f) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeFileWriterMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeFileWriterMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_close(f);
if(monitorfinalMonitor.SafeFileWriterMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class SafeHashSetMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<SafeHashSetMonitor> {

SafeHashSetMonitor_Set(){
this.size = 0;
this.elements = new SafeHashSetMonitor[4];
}
final void event_add(HashSet t, Object o) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeHashSetMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeHashSetMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_add(t, o);
if(monitorfinalMonitor.SafeHashSetMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_unsafe_contains(HashSet t, Object o) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeHashSetMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeHashSetMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_unsafe_contains(t, o);
if(monitorfinalMonitor.SafeHashSetMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_remove(HashSet t, Object o) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeHashSetMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeHashSetMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_remove(t, o);
if(monitorfinalMonitor.SafeHashSetMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class SafeIteratorMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<SafeIteratorMonitor> {

SafeIteratorMonitor_Set(){
this.size = 0;
this.elements = new SafeIteratorMonitor[4];
}
final void event_create(Collection c, Iterator i) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_create(c, i);
if(monitorfinalMonitor.SafeIteratorMonitor_Prop_1_Category_violation) {
monitorfinalMonitor.Prop_1_handler_violation();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_updatesource(Collection c) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_updatesource(c);
if(monitorfinalMonitor.SafeIteratorMonitor_Prop_1_Category_violation) {
monitorfinalMonitor.Prop_1_handler_violation();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_next(Iterator i) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_next(i);
if(monitorfinalMonitor.SafeIteratorMonitor_Prop_1_Category_violation) {
monitorfinalMonitor.Prop_1_handler_violation();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class SafeMapIteratorMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<SafeMapIteratorMonitor> {

SafeMapIteratorMonitor_Set(){
this.size = 0;
this.elements = new SafeMapIteratorMonitor[4];
}
final void event_createColl(Map map, Collection c) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeMapIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeMapIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_createColl(map, c);
if(monitorfinalMonitor.SafeMapIteratorMonitor_Prop_1_Category_violation) {
monitorfinalMonitor.Prop_1_handler_violation();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_createIter(Collection c, Iterator i) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeMapIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeMapIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_createIter(c, i);
if(monitorfinalMonitor.SafeMapIteratorMonitor_Prop_1_Category_violation) {
monitorfinalMonitor.Prop_1_handler_violation();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_useIter(Iterator i) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeMapIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeMapIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_useIter(i);
if(monitorfinalMonitor.SafeMapIteratorMonitor_Prop_1_Category_violation) {
monitorfinalMonitor.Prop_1_handler_violation();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_updateMap(Map map) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeMapIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeMapIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_updateMap(map);
if(monitorfinalMonitor.SafeMapIteratorMonitor_Prop_1_Category_violation) {
monitorfinalMonitor.Prop_1_handler_violation();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class SafeSyncCollectionMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<SafeSyncCollectionMonitor> {

SafeSyncCollectionMonitor_Set(){
this.size = 0;
this.elements = new SafeSyncCollectionMonitor[4];
}
final void event_sync(Object c) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeSyncCollectionMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeSyncCollectionMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_sync(c);
if(monitorfinalMonitor.SafeSyncCollectionMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_syncCreateIter(Object c, Iterator iter) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeSyncCollectionMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeSyncCollectionMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_syncCreateIter(c, iter);
if(monitorfinalMonitor.SafeSyncCollectionMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_asyncCreateIter(Object c, Iterator iter) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeSyncCollectionMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeSyncCollectionMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_asyncCreateIter(c, iter);
if(monitorfinalMonitor.SafeSyncCollectionMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_accessIter(Iterator iter) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeSyncCollectionMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeSyncCollectionMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_accessIter(iter);
if(monitorfinalMonitor.SafeSyncCollectionMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class SafeSyncMapMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<SafeSyncMapMonitor> {

SafeSyncMapMonitor_Set(){
this.size = 0;
this.elements = new SafeSyncMapMonitor[4];
}
final void event_sync(Map syncMap) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeSyncMapMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeSyncMapMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_sync(syncMap);
if(monitorfinalMonitor.SafeSyncMapMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_createSet(Map syncMap, Set mapSet) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeSyncMapMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeSyncMapMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_createSet(syncMap, mapSet);
if(monitorfinalMonitor.SafeSyncMapMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_syncCreateIter(Set mapSet, Iterator iter) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeSyncMapMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeSyncMapMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_syncCreateIter(mapSet, iter);
if(monitorfinalMonitor.SafeSyncMapMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_asyncCreateIter(Set mapSet, Iterator iter) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeSyncMapMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeSyncMapMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_asyncCreateIter(mapSet, iter);
if(monitorfinalMonitor.SafeSyncMapMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_accessIter(Iterator iter) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
SafeSyncMapMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final SafeSyncMapMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_accessIter(iter);
if(monitorfinalMonitor.SafeSyncMapMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class UnsafeIteratorMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<UnsafeIteratorMonitor> {

UnsafeIteratorMonitor_Set(){
this.size = 0;
this.elements = new UnsafeIteratorMonitor[4];
}
final void event_create(Collection c, Iterator i) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
UnsafeIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final UnsafeIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_create(c, i);
if(monitorfinalMonitor.UnsafeIteratorMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_updatesource(Collection c) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
UnsafeIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final UnsafeIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_updatesource(c);
if(monitorfinalMonitor.UnsafeIteratorMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_next(Iterator i) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
UnsafeIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final UnsafeIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_next(i);
if(monitorfinalMonitor.UnsafeIteratorMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}
final class UnsafeMapIteratorMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<UnsafeMapIteratorMonitor> {

UnsafeMapIteratorMonitor_Set(){
this.size = 0;
this.elements = new UnsafeMapIteratorMonitor[4];
}
final void event_createColl(Map map, Collection c) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
UnsafeMapIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final UnsafeMapIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_createColl(map, c);
if(monitorfinalMonitor.UnsafeMapIteratorMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_createIter(Collection c, Iterator i) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
UnsafeMapIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final UnsafeMapIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_createIter(c, i);
if(monitorfinalMonitor.UnsafeMapIteratorMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_useIter(Iterator i) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
UnsafeMapIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final UnsafeMapIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_useIter(i);
if(monitorfinalMonitor.UnsafeMapIteratorMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
final void event_updateMap(Map map) {
int numAlive = 0 ;
for(int i_1 = 0; i_1 < this.size; i_1++){
UnsafeMapIteratorMonitor monitor = this.elements[i_1];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

final UnsafeMapIteratorMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_updateMap(map);
if(monitorfinalMonitor.UnsafeMapIteratorMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}
}
}
for(int i_1 = numAlive; i_1 < this.size; i_1++){
this.elements[i_1] = null;
}
size = numAlive;
}
}

class FileCloseMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
protected Object clone() {
try {
FileCloseMonitor ret = (FileCloseMonitor) super.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


	FileWriter saved_fw;

WeakReference Ref_f = null;

static final int Prop_1_transition_write[] = {0, 3, 3, 3};;
static final int Prop_1_transition_close[] = {1, 1, 3, 3};;
static final int Prop_1_transition_endProg[] = {3, 2, 3, 3};;

volatile boolean FileCloseMonitor_Prop_1_Category_fail = false;

private final AtomicInteger pairValue;

FileCloseMonitor() {
this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;


}

@Override public final int getState() {
	return this.getState(this.pairValue.get() ) ;
}
@Override public final int getLastEvent() {
	return this.getLastEvent(this.pairValue.get() ) ;
}
private final int getState(int pairValue) {
	return (pairValue & 3) ;
}
private final int getLastEvent(int pairValue) {
	return (pairValue >> 2) ;
}
private final int calculatePairValue(int lastEvent, int state) {
	return (((lastEvent + 1) << 2) | state) ;
}

private final int handleEvent(int eventId, int[] table) {
	int nextstate;
	while (true) {
		int oldpairvalue = this.pairValue.get() ;
		int oldstate = this.getState(oldpairvalue) ;
		nextstate = table [ oldstate ];
		int nextpairvalue = this.calculatePairValue(eventId, nextstate) ;
		if (this.pairValue.compareAndSet(oldpairvalue, nextpairvalue) ) {
			break;
		}
	}
	return nextstate;
}

final boolean Prop_1_event_write(FileWriter f) {
{
		saved_fw = f;
	}
if(Ref_f == null){
Ref_f = new WeakReference(f);
}

int nextstate = this.handleEvent(0, Prop_1_transition_write) ;
this.FileCloseMonitor_Prop_1_Category_fail = nextstate == 3;

return true;
}

final boolean Prop_1_event_close(FileWriter f) {
{
	}
if(Ref_f == null){
Ref_f = new WeakReference(f);
}

int nextstate = this.handleEvent(1, Prop_1_transition_close) ;
this.FileCloseMonitor_Prop_1_Category_fail = nextstate == 3;

return true;
}

final boolean Prop_1_event_endProg() {
FileWriter f = null;
if(Ref_f != null){
f = (FileWriter)Ref_f.get();
}
{
		System.out.println("Program has ended.");
	}

int nextstate = this.handleEvent(2, Prop_1_transition_endProg) ;
this.FileCloseMonitor_Prop_1_Category_fail = nextstate == 3;

return true;
}

final void Prop_1_handler_fail (){
{
		System.err.println("You should close the file you wrote.");
		try {
			saved_fw.close();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		this.reset();
	}

}

final void reset() {
this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

FileCloseMonitor_Prop_1_Category_fail = false;
}

// RVMRef_f was suppressed to reduce memory overhead


@Override
protected final void terminateInternal(int idnum) {
int lastEvent = this.getLastEvent();

switch(idnum){
case 0:
break;
}
switch(lastEvent) {
case -1:
return;
case 0:
//write
return;
case 1:
//close
return;
case 2:
//endProg
return;
}
return;
}

public static int getNumberOfEvents() {
return 3;
}

public static int getNumberOfStates() {
return 4;
}

}
class HasNextMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
protected Object clone() {
try {
HasNextMonitor ret = (HasNextMonitor) super.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}



static final int Prop_1_transition_create[] = {2, 3, 3, 3};;
static final int Prop_1_transition_hasnext[] = {3, 1, 1, 3};;
static final int Prop_1_transition_next[] = {3, 2, 3, 3};;

volatile boolean HasNextMonitor_Prop_1_Category_fail = false;

private final AtomicInteger pairValue;

HasNextMonitor() {
this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;


}

@Override public final int getState() {
	return this.getState(this.pairValue.get() ) ;
}
@Override public final int getLastEvent() {
	return this.getLastEvent(this.pairValue.get() ) ;
}
private final int getState(int pairValue) {
	return (pairValue & 3) ;
}
private final int getLastEvent(int pairValue) {
	return (pairValue >> 2) ;
}
private final int calculatePairValue(int lastEvent, int state) {
	return (((lastEvent + 1) << 2) | state) ;
}

private final int handleEvent(int eventId, int[] table) {
	int nextstate;
	while (true) {
		int oldpairvalue = this.pairValue.get() ;
		int oldstate = this.getState(oldpairvalue) ;
		nextstate = table [ oldstate ];
		int nextpairvalue = this.calculatePairValue(eventId, nextstate) ;
		if (this.pairValue.compareAndSet(oldpairvalue, nextpairvalue) ) {
			break;
		}
	}
	return nextstate;
}

final boolean Prop_1_event_create(Collection c, Iterator i) {
{
	}

int nextstate = this.handleEvent(0, Prop_1_transition_create) ;
this.HasNextMonitor_Prop_1_Category_fail = nextstate == 3;

return true;
}

final boolean Prop_1_event_hasnext(Iterator i) {
{
	}

int nextstate = this.handleEvent(1, Prop_1_transition_hasnext) ;
this.HasNextMonitor_Prop_1_Category_fail = nextstate == 3;

return true;
}

final boolean Prop_1_event_next(Iterator i) {
{
	}

int nextstate = this.handleEvent(2, Prop_1_transition_next) ;
this.HasNextMonitor_Prop_1_Category_fail = nextstate == 3;

return true;
}

final void Prop_1_handler_fail (){
{
		System.err.println("! hasNext() has not been called" + " before calling next() for an" + " iterator");
		this.reset();
	}

}

final void reset() {
this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

HasNextMonitor_Prop_1_Category_fail = false;
}

// RVMRef_i was suppressed to reduce memory overhead

//alive_parameters_0 = [Iterator i]
boolean alive_parameters_0 = true;

@Override
protected final void terminateInternal(int idnum) {
int lastEvent = this.getLastEvent();

switch(idnum){
case 0:
alive_parameters_0 = false;
break;
}
switch(lastEvent) {
case -1:
return;
case 0:
//create
//alive_i
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 1:
//hasnext
//alive_i
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 2:
//next
//alive_i
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

}
return;
}

public static int getNumberOfEvents() {
return 3;
}

public static int getNumberOfStates() {
return 4;
}

}
class MsgDigestMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
protected Object clone() {
try {
MsgDigestMonitor ret = (MsgDigestMonitor) super.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}



static final int Prop_1_transition_getInstance[] = {1, 5, 5, 5, 5, 5};;
static final int Prop_1_transition_update[] = {5, 3, 4, 3, 4, 5};;
static final int Prop_1_transition_reset[] = {5, 5, 2, 2, 5, 5};;
static final int Prop_1_transition_digest[] = {5, 5, 3, 3, 3, 5};;

volatile boolean MsgDigestMonitor_Prop_1_Category_fail = false;

private final AtomicInteger pairValue;

MsgDigestMonitor() {
this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;


}

@Override public final int getState() {
	return this.getState(this.pairValue.get() ) ;
}
@Override public final int getLastEvent() {
	return this.getLastEvent(this.pairValue.get() ) ;
}
private final int getState(int pairValue) {
	return (pairValue & 7) ;
}
private final int getLastEvent(int pairValue) {
	return (pairValue >> 3) ;
}
private final int calculatePairValue(int lastEvent, int state) {
	return (((lastEvent + 1) << 3) | state) ;
}

private final int handleEvent(int eventId, int[] table) {
	int nextstate;
	while (true) {
		int oldpairvalue = this.pairValue.get() ;
		int oldstate = this.getState(oldpairvalue) ;
		nextstate = table [ oldstate ];
		int nextpairvalue = this.calculatePairValue(eventId, nextstate) ;
		if (this.pairValue.compareAndSet(oldpairvalue, nextpairvalue) ) {
			break;
		}
	}
	return nextstate;
}

final boolean Prop_1_event_getInstance(MessageDigest P) {
{
	}

int nextstate = this.handleEvent(0, Prop_1_transition_getInstance) ;
this.MsgDigestMonitor_Prop_1_Category_fail = nextstate == 5;

return true;
}

final boolean Prop_1_event_update(MessageDigest P) {
{
	}

int nextstate = this.handleEvent(1, Prop_1_transition_update) ;
this.MsgDigestMonitor_Prop_1_Category_fail = nextstate == 5;

return true;
}

final boolean Prop_1_event_reset(MessageDigest P) {
{
	}

int nextstate = this.handleEvent(2, Prop_1_transition_reset) ;
this.MsgDigestMonitor_Prop_1_Category_fail = nextstate == 5;

return true;
}

final boolean Prop_1_event_digest(MessageDigest P) {
{
	}

int nextstate = this.handleEvent(3, Prop_1_transition_digest) ;
this.MsgDigestMonitor_Prop_1_Category_fail = nextstate == 5;

return true;
}

final void Prop_1_handler_fail (){
{
		System.err.println("Problem in Message Digest has occurred!");
		this.reset();
	}

}

final void reset() {
this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

MsgDigestMonitor_Prop_1_Category_fail = false;
}

// RVMRef_P was suppressed to reduce memory overhead

//alive_parameters_0 = [MessageDigest P]
boolean alive_parameters_0 = true;

@Override
protected final void terminateInternal(int idnum) {
int lastEvent = this.getLastEvent();

switch(idnum){
case 0:
alive_parameters_0 = false;
break;
}
switch(lastEvent) {
case -1:
return;
case 0:
//getInstance
//alive_P
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 1:
//update
//alive_P
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 2:
//reset
//alive_P
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 3:
//digest
//alive_P
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

}
return;
}

public static int getNumberOfEvents() {
return 4;
}

public static int getNumberOfStates() {
return 6;
}

}
interface ISafeEnumMonitor extends IMonitor, IDisableHolder {
}

class SafeEnumDisableHolder extends DisableHolder implements ISafeEnumMonitor {
SafeEnumDisableHolder(long tau) {
super(tau);
}

@Override
public final boolean isTerminated() {
return false;
}

@Override
public int getLastEvent() {
return -1;
}

@Override
public int getState() {
return -1;
}

}

class SafeEnumMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, ISafeEnumMonitor {
protected Object clone() {
try {
SafeEnumMonitor ret = (SafeEnumMonitor) super.clone();
ret.monitorInfo = (com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo)this.monitorInfo.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


WeakReference Ref_e = null;
WeakReference Ref_v = null;
int Prop_1_state;
static final int Prop_1_transition_create[] = {1, 4, 4, 4, 4};;
static final int Prop_1_transition_updatesource[] = {4, 3, 4, 3, 4};;
static final int Prop_1_transition_next[] = {4, 1, 4, 2, 4};;

boolean SafeEnumMonitor_Prop_1_Category_match = false;

SafeEnumMonitor(long tau) {
this.tau = tau;
Prop_1_state = 0;

}

@Override
public final int getState() {
return Prop_1_state;
}

private final long tau;
private long disable = -1;

@Override
public final long getTau() {
return this.tau;
}

@Override
public final long getDisable() {
return this.disable;
}

@Override
public final void setDisable(long value) {
this.disable = value;
}

final boolean Prop_1_event_create(Vector v, Enumeration e) {
{
	}
if(Ref_e == null){
Ref_e = new WeakReference(e);
}
if(Ref_v == null){
Ref_v = new WeakReference(v);
}
RVM_lastevent = 0;

Prop_1_state = Prop_1_transition_create[Prop_1_state];
if(this.monitorInfo.isFullParam){
SafeEnumMonitor_Prop_1_Category_match = Prop_1_state == 2;
}
return true;
}

final boolean Prop_1_event_updatesource(Vector v) {
Enumeration e = null;
if(Ref_e != null){
e = (Enumeration)Ref_e.get();
}
{
	}
if(Ref_v == null){
Ref_v = new WeakReference(v);
}
RVM_lastevent = 1;

Prop_1_state = Prop_1_transition_updatesource[Prop_1_state];
if(this.monitorInfo.isFullParam){
SafeEnumMonitor_Prop_1_Category_match = Prop_1_state == 2;
}
return true;
}

final boolean Prop_1_event_next(Enumeration e) {
Vector v = null;
if(Ref_v != null){
v = (Vector)Ref_v.get();
}
{
	}
if(Ref_e == null){
Ref_e = new WeakReference(e);
}
RVM_lastevent = 2;

Prop_1_state = Prop_1_transition_next[Prop_1_state];
if(this.monitorInfo.isFullParam){
SafeEnumMonitor_Prop_1_Category_match = Prop_1_state == 2;
}
return true;
}

final void Prop_1_handler_match (){
{
		System.out.println("improper enumeration usage at " + com.runtimeverification.rvmonitor.java.rt.ViolationRecorder.getLineOfCode());
		this.reset();
	}

}

final void reset() {
RVM_lastevent = -1;
Prop_1_state = 0;
SafeEnumMonitor_Prop_1_Category_match = false;
}

// RVMRef_v was suppressed to reduce memory overhead
// RVMRef_e was suppressed to reduce memory overhead

//alive_parameters_0 = [Vector v, Enumeration e]
boolean alive_parameters_0 = true;
//alive_parameters_1 = [Enumeration e]
boolean alive_parameters_1 = true;

@Override
protected final void terminateInternal(int idnum) {
switch(idnum){
case 0:
alive_parameters_0 = false;
break;
case 1:
alive_parameters_0 = false;
alive_parameters_1 = false;
break;
}
switch(RVM_lastevent) {
case -1:
return;
case 0:
//create
//alive_v && alive_e
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 1:
//updatesource
//alive_e
if(!(alive_parameters_1)){
RVM_terminated = true;
return;
}
break;

case 2:
//next
//alive_v && alive_e
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

}
return;
}

com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo monitorInfo;
public static int getNumberOfEvents() {
return 3;
}

public static int getNumberOfStates() {
return 5;
}

}
interface ISafeFileMonitor extends IMonitor, IDisableHolder {
}

class SafeFileDisableHolder extends DisableHolder implements ISafeFileMonitor {
SafeFileDisableHolder(long tau) {
super(tau);
}

@Override
public final boolean isTerminated() {
return false;
}

@Override
public int getLastEvent() {
return -1;
}

@Override
public int getState() {
return -1;
}

}

class SafeFileMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, ISafeFileMonitor {
protected Object clone() {
try {
SafeFileMonitor ret = (SafeFileMonitor) super.clone();
ret.Prop_1_stacks = new ArrayList<IntStack>();
for(int Prop_1_i = 0; Prop_1_i < this.Prop_1_stacks.size(); Prop_1_i++){
IntStack Prop_1_stack = this.Prop_1_stacks.get(Prop_1_i);
ret.Prop_1_stacks.add(Prop_1_stack.fclone());
}
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


WeakReference Ref_f = null;
/* %%_%_CFG_%_%% */ArrayList<IntStack> Prop_1_stacks = new ArrayList<IntStack>();
static int[][] Prop_1_gt = { { 0, 26, -1,  }, { 0, 30, 28,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, 15, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, 13, -1,  }, { 0, 38, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, 10, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, 30, 24,  }, { 0, 32, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, 47, -1,  }, { 0, 41, -1,  }, { 0, -1, -1,  }, { 0, 22, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, 51, -1,  }, { 0, 25, -1,  }, { 0, 18, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  },  };
;
static int[][][][] Prop_1_at = { { { { 43,  },  }, { { 48,  },  }, { { 45,  },  }, {  },  }, { { { 20,  },  }, {  }, { { 4,  },  }, {  },  }, { { { 1, 2,  },  }, { { 1, 2,  },  }, { { 1, 2,  },  }, {  },  }, { { { 1, 2,  },  }, {  }, { { 1, 2,  },  }, { { 1, 2,  },  },  }, { { { 44,  },  }, {  }, { { 31,  },  }, { { 49,  },  },  }, { { { 1, 3,  },  }, {  }, { { 1, 3,  },  }, { { 1, 3,  },  },  }, { { { 1, 3,  },  }, {  }, { { 1, 3,  },  }, { { 1, 3,  },  },  }, { { { 1, 4,  },  }, { { 1, 4,  },  }, { { 1, 4,  },  }, {  },  }, { { { 1, 3,  },  }, { { 1, 3,  },  }, { { 1, 3,  },  }, {  },  }, { { { 1, 3,  },  }, { { 1, 3,  },  }, { { 1, 3,  },  }, {  },  }, { { { 39,  },  }, { { 40,  },  }, { { 36,  },  }, {  },  }, { { { 44,  },  }, {  }, { { 31,  },  }, { { 6,  },  },  }, { { { 44,  },  }, {  }, { { 31,  },  }, { { 14,  },  },  }, { { { 37,  },  }, {  }, { { 11,  },  }, { { 16,  },  },  }, { { { 1, 2,  }, { 1, 3,  },  }, {  }, { { 1, 2,  }, { 1, 3,  },  }, {  },  }, { { { 37,  },  }, {  }, { { 11,  },  }, { { 23,  },  },  }, { { { 1, 4,  },  }, {  }, { { 1, 4,  },  }, { { 1, 4,  },  },  }, { { { 1, 3,  }, { 1, 4,  },  }, {  }, { { 1, 3,  }, { 1, 4,  },  }, {  },  }, { { { 37,  },  }, {  }, { { 11,  },  }, { { 35,  },  },  }, { { { 1, 4,  },  }, { { 1, 4,  },  }, { { 1, 4,  },  }, {  },  }, { { { 43,  },  }, { { 42,  },  }, { { 45,  },  }, {  },  }, { { { 1, 3,  }, { 1, 4,  },  }, {  }, { { 1, 3,  }, { 1, 4,  },  }, {  },  }, { { { 39,  },  }, { { 19,  },  }, { { 36,  },  }, {  },  }, { { { 1, 3,  },  }, {  }, { { 1, 3,  },  }, {  },  }, { {  }, {  }, {  }, {  },  }, { { { 39,  },  }, { { 5,  },  }, { { 36,  },  }, {  },  }, { { { 39,  },  }, { { 17,  },  }, { { 36,  },  }, {  },  }, { { { 1, 2,  },  }, { { 1, 2,  },  }, { { 1, 2,  },  }, {  },  }, { {  }, {  }, {  }, {  },  }, { { { 1, 3,  },  }, { { 1, 3,  },  }, { { 1, 3,  },  }, {  },  }, { { { 0,  },  }, {  }, { { 12,  },  }, {  },  }, { { { 44,  },  }, {  }, { { 31,  },  }, { { 34,  },  },  }, { { { 37,  },  }, {  }, { { 11,  },  }, { { 33,  },  },  }, { { { 1, 3,  },  }, {  }, { { 1, 3,  },  }, { { 1, 3,  },  },  }, { { { 1, 2,  },  }, {  }, { { 1, 2,  },  }, { { 1, 2,  },  },  }, { { { 1, 3,  },  }, { { 1, 3,  },  }, { { 1, 3,  },  }, {  },  }, { { { 44,  },  }, {  }, { { 31,  },  }, { { 8,  },  },  }, { { { 43,  },  }, { { 50,  },  }, { { 45,  },  }, {  },  }, { { { 37,  },  }, {  }, { { 11,  },  }, { { 21,  },  },  }, { { { 43,  },  }, { { 29,  },  }, { { 45,  },  }, {  },  }, { { { 1, 3,  },  }, {  }, { { 1, 3,  },  }, {  },  }, { { { 39,  },  }, { { 46,  },  }, { { 36,  },  }, {  },  }, { { { 1, 2,  },  }, {  }, { { 1, 2,  },  }, {  },  }, { { { 43,  },  }, { { 2,  },  }, { { 45,  },  }, {  },  }, { { { 43,  },  }, { { 3,  },  }, { { 45,  },  }, {  },  }, { { { 44,  },  }, {  }, { { 31,  },  }, { { 27,  },  },  }, { { { 1, 4,  },  }, {  }, { { 1, 4,  },  }, { { 1, 4,  },  },  }, { { { 37,  },  }, {  }, { { 11,  },  }, { { 7,  },  },  }, { { { 1, 2,  }, { 1, 3,  },  }, {  }, { { 1, 2,  }, { 1, 3,  },  }, {  },  }, { { { 1, 2,  },  }, {  }, { { 1, 2,  },  }, {  },  }, { { { 1, 3,  },  }, {  }, { { 1, 3,  },  }, { { 1, 3,  },  },  }, { { { 39,  },  }, { { 9,  },  }, { { 36,  },  }, {  },  },  };
;
static boolean[] Prop_1_acc = { false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, true, false, false, false, true, false, true, true, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, true, true, false, false, };
int Prop_1_cat; // ACCEPT = 0, UNKNOWN = 1, FAIL = 2
int Prop_1_event = -1;

class IntStack implements java.io.Serializable {
    int[] data;
    int curr_index = 0;
    public IntStack(){
        data = new int[32];
    }
    public String toString(){
        String ret = "[";
        for (int i = curr_index; i>=0; i--){
            ret += Integer.toString(data[i])+",";
        }
        return ret+"]";
    }
    public int hashCode() {
        return curr_index^peek();
    }
    public boolean equals(Object o) {
        if (o == null) return false;
        if (!(o instanceof IntStack)) return false;
        IntStack s = (IntStack)o;
        if(curr_index != s.curr_index) return false;
        for(int i = 0; i < curr_index; i++){
            if(data[i] != s.data[i]) return false;
        }
        return true;
    }
    public IntStack(int size){
        data = new int[size];
    }
    public int peek(){
        return data[curr_index - 1];
    }
    public int pop(){
        return data[--curr_index];
    }
    public void pop(int num){
        curr_index -= num;
    }
    public void push(int datum){
        if(curr_index < data.length){
            data[curr_index++] = datum;
        } else{
            int len = data.length;
            int[] old = data;
            data = new int[len * 2];
            for(int i = 0; i < len; ++i){
                data[i] = old[i];
            }
            data[curr_index++] = datum;
        }
    }
    public IntStack fclone(){
        IntStack ret = new IntStack(data.length);
        ret.curr_index = curr_index;
        for(int i = 0; i < curr_index; ++i){
            ret.data[i] = data[i];
        }
        return ret;
    }
    public void clear(){
        curr_index = 0;
    }
}

boolean SafeFileMonitor_Prop_1_Category_fail = false;

SafeFileMonitor(long tau) {
this.tau = tau;
IntStack stack = new IntStack();
stack.push(-2);
stack.push(1);
Prop_1_stacks.add(stack);

}

@Override
public final int getState() {
return -1;
}

private final long tau;
private long disable = -1;

@Override
public final long getTau() {
return this.tau;
}

@Override
public final long getDisable() {
return this.disable;
}

@Override
public final void setDisable(long value) {
this.disable = value;
}

final boolean Prop_1_event_open(Thread t, FileReader f) {
{
	}
if(Ref_f == null){
Ref_f = new WeakReference(f);
}
RVM_lastevent = 0;

Prop_1_event = 1;
if (Prop_1_cat != 2) {
    Prop_1_event--; 
    Prop_1_cat = 1; 
    for (int Prop_1_i = Prop_1_stacks.size()-1; Prop_1_i >=0; Prop_1_i--) {
        IntStack stack = Prop_1_stacks.get(Prop_1_i); 
        Prop_1_stacks.set(Prop_1_i,null); 
        while (stack != null) { 
            int s = stack.peek();
            if (s >= 0 && Prop_1_at[s][Prop_1_event].length >= 0) { 
                /* not in an error state and something to do? */
                for (int j = 0; j < Prop_1_at[s][Prop_1_event].length; j++) { 
                    IntStack tstack; 
                    if (Prop_1_at[s][Prop_1_event].length > 1){
                        tstack = stack.fclone(); 
                    } else{ 
                        tstack = stack; 
                    } 
                    switch (Prop_1_at[s][Prop_1_event][j].length) { 
                        case 1:/* Shift */
                            tstack.push(Prop_1_at[s][Prop_1_event][j][0]); 
                            Prop_1_stacks.add(tstack); 
                            if (Prop_1_acc[Prop_1_at[s][Prop_1_event][j][0]]) Prop_1_cat = 0; 
                            break;
                        case 2: /* Reduce */ 
                            tstack.pop(Prop_1_at[s][Prop_1_event][j][1]); 
                            int Prop_1_old = tstack.peek();
                            tstack.push(Prop_1_gt[Prop_1_old][Prop_1_at[s][Prop_1_event][j][0]]); 
                            Prop_1_stacks.add(Prop_1_i,tstack); 
                            break; 
                    } 
                } 
            }
            stack = Prop_1_stacks.get(Prop_1_i); 
            Prop_1_stacks.remove(Prop_1_i); 
        }
    } 
    if (Prop_1_stacks.isEmpty()) 
        Prop_1_cat = 2; 
};
SafeFileMonitor_Prop_1_Category_fail = Prop_1_cat == 2;
return true;
}

final boolean Prop_1_event_close(FileReader f, Thread t) {
{
	}
if(Ref_f == null){
Ref_f = new WeakReference(f);
}
RVM_lastevent = 1;

Prop_1_event = 2;
if (Prop_1_cat != 2) {
    Prop_1_event--; 
    Prop_1_cat = 1; 
    for (int Prop_1_i = Prop_1_stacks.size()-1; Prop_1_i >=0; Prop_1_i--) {
        IntStack stack = Prop_1_stacks.get(Prop_1_i); 
        Prop_1_stacks.set(Prop_1_i,null); 
        while (stack != null) { 
            int s = stack.peek();
            if (s >= 0 && Prop_1_at[s][Prop_1_event].length >= 0) { 
                /* not in an error state and something to do? */
                for (int j = 0; j < Prop_1_at[s][Prop_1_event].length; j++) { 
                    IntStack tstack; 
                    if (Prop_1_at[s][Prop_1_event].length > 1){
                        tstack = stack.fclone(); 
                    } else{ 
                        tstack = stack; 
                    } 
                    switch (Prop_1_at[s][Prop_1_event][j].length) { 
                        case 1:/* Shift */
                            tstack.push(Prop_1_at[s][Prop_1_event][j][0]); 
                            Prop_1_stacks.add(tstack); 
                            if (Prop_1_acc[Prop_1_at[s][Prop_1_event][j][0]]) Prop_1_cat = 0; 
                            break;
                        case 2: /* Reduce */ 
                            tstack.pop(Prop_1_at[s][Prop_1_event][j][1]); 
                            int Prop_1_old = tstack.peek();
                            tstack.push(Prop_1_gt[Prop_1_old][Prop_1_at[s][Prop_1_event][j][0]]); 
                            Prop_1_stacks.add(Prop_1_i,tstack); 
                            break; 
                    } 
                } 
            }
            stack = Prop_1_stacks.get(Prop_1_i); 
            Prop_1_stacks.remove(Prop_1_i); 
        }
    } 
    if (Prop_1_stacks.isEmpty()) 
        Prop_1_cat = 2; 
};
SafeFileMonitor_Prop_1_Category_fail = Prop_1_cat == 2;
return true;
}

final boolean Prop_1_event_begin(Thread t) {
FileReader f = null;
if(Ref_f != null){
f = (FileReader)Ref_f.get();
}
{
	}
RVM_lastevent = 2;

Prop_1_event = 3;
if (Prop_1_cat != 2) {
    Prop_1_event--; 
    Prop_1_cat = 1; 
    for (int Prop_1_i = Prop_1_stacks.size()-1; Prop_1_i >=0; Prop_1_i--) {
        IntStack stack = Prop_1_stacks.get(Prop_1_i); 
        Prop_1_stacks.set(Prop_1_i,null); 
        while (stack != null) { 
            int s = stack.peek();
            if (s >= 0 && Prop_1_at[s][Prop_1_event].length >= 0) { 
                /* not in an error state and something to do? */
                for (int j = 0; j < Prop_1_at[s][Prop_1_event].length; j++) { 
                    IntStack tstack; 
                    if (Prop_1_at[s][Prop_1_event].length > 1){
                        tstack = stack.fclone(); 
                    } else{ 
                        tstack = stack; 
                    } 
                    switch (Prop_1_at[s][Prop_1_event][j].length) { 
                        case 1:/* Shift */
                            tstack.push(Prop_1_at[s][Prop_1_event][j][0]); 
                            Prop_1_stacks.add(tstack); 
                            if (Prop_1_acc[Prop_1_at[s][Prop_1_event][j][0]]) Prop_1_cat = 0; 
                            break;
                        case 2: /* Reduce */ 
                            tstack.pop(Prop_1_at[s][Prop_1_event][j][1]); 
                            int Prop_1_old = tstack.peek();
                            tstack.push(Prop_1_gt[Prop_1_old][Prop_1_at[s][Prop_1_event][j][0]]); 
                            Prop_1_stacks.add(Prop_1_i,tstack); 
                            break; 
                    } 
                } 
            }
            stack = Prop_1_stacks.get(Prop_1_i); 
            Prop_1_stacks.remove(Prop_1_i); 
        }
    } 
    if (Prop_1_stacks.isEmpty()) 
        Prop_1_cat = 2; 
};
SafeFileMonitor_Prop_1_Category_fail = Prop_1_cat == 2;
return true;
}

final boolean Prop_1_event_end(Thread t) {
FileReader f = null;
if(Ref_f != null){
f = (FileReader)Ref_f.get();
}
{
	}
RVM_lastevent = 3;

Prop_1_event = 4;
if (Prop_1_cat != 2) {
    Prop_1_event--; 
    Prop_1_cat = 1; 
    for (int Prop_1_i = Prop_1_stacks.size()-1; Prop_1_i >=0; Prop_1_i--) {
        IntStack stack = Prop_1_stacks.get(Prop_1_i); 
        Prop_1_stacks.set(Prop_1_i,null); 
        while (stack != null) { 
            int s = stack.peek();
            if (s >= 0 && Prop_1_at[s][Prop_1_event].length >= 0) { 
                /* not in an error state and something to do? */
                for (int j = 0; j < Prop_1_at[s][Prop_1_event].length; j++) { 
                    IntStack tstack; 
                    if (Prop_1_at[s][Prop_1_event].length > 1){
                        tstack = stack.fclone(); 
                    } else{ 
                        tstack = stack; 
                    } 
                    switch (Prop_1_at[s][Prop_1_event][j].length) { 
                        case 1:/* Shift */
                            tstack.push(Prop_1_at[s][Prop_1_event][j][0]); 
                            Prop_1_stacks.add(tstack); 
                            if (Prop_1_acc[Prop_1_at[s][Prop_1_event][j][0]]) Prop_1_cat = 0; 
                            break;
                        case 2: /* Reduce */ 
                            tstack.pop(Prop_1_at[s][Prop_1_event][j][1]); 
                            int Prop_1_old = tstack.peek();
                            tstack.push(Prop_1_gt[Prop_1_old][Prop_1_at[s][Prop_1_event][j][0]]); 
                            Prop_1_stacks.add(Prop_1_i,tstack); 
                            break; 
                    } 
                } 
            }
            stack = Prop_1_stacks.get(Prop_1_i); 
            Prop_1_stacks.remove(Prop_1_i); 
        }
    } 
    if (Prop_1_stacks.isEmpty()) 
        Prop_1_cat = 2; 
};
SafeFileMonitor_Prop_1_Category_fail = Prop_1_cat == 2;
return true;
}

final void Prop_1_handler_fail (){
{
		System.out.println("improper use of files");
	}

}

final void reset() {
RVM_lastevent = -1;
Prop_1_stacks.clear();
IntStack stack = new IntStack();
stack.push(-2);
stack.push(1);
Prop_1_stacks.add(stack);
SafeFileMonitor_Prop_1_Category_fail = false;
}

public final int hashCode() {
if(Prop_1_stacks.size() == 0) return 0;
return Prop_1_stacks.size() ^ Prop_1_stacks.get(Prop_1_stacks.size() - 1).hashCode();
}

public final boolean equals(Object o) {
if(o == null) return false;
if(! (o instanceof SafeFileMonitor)) return false ;
SafeFileMonitor m = (SafeFileMonitor) o;
if (Prop_1_stacks.size() != m.Prop_1_stacks.size()) return false;
for(int Prop_1_i = 0; Prop_1_i < Prop_1_stacks.size(); Prop_1_i++){
IntStack Prop_1_stack = Prop_1_stacks.get(Prop_1_i);
IntStack Prop_1_stack2 = m.Prop_1_stacks.get(Prop_1_i);
if(Prop_1_stack.curr_index != Prop_1_stack2.curr_index) return false;
for(int Prop_1_j = 0; Prop_1_j < Prop_1_stack.curr_index; Prop_1_j++){
if(Prop_1_stack.data[Prop_1_j] != Prop_1_stack2.data[Prop_1_j]) return false;
}
}
return true;
}

// RVMRef_f was suppressed to reduce memory overhead
// RVMRef_t was suppressed to reduce memory overhead


@Override
protected final void terminateInternal(int idnum) {
switch(idnum){
case 0:
break;
case 1:
break;
}
switch(RVM_lastevent) {
case -1:
return;
case 0:
//open
return;
case 1:
//close
return;
case 2:
//begin
return;
case 3:
//end
return;
}
return;
}

public static int getNumberOfEvents() {
return 4;
}

public static int getNumberOfStates() {
return 0;
}

}
class SafeFileWriterMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
protected Object clone() {
try {
SafeFileWriterMonitor ret = (SafeFileWriterMonitor) super.clone();
ret.Prop_1_stacks = new ArrayList<IntStack>();
for(int Prop_1_i = 0; Prop_1_i < this.Prop_1_stacks.size(); Prop_1_i++){
IntStack Prop_1_stack = this.Prop_1_stacks.get(Prop_1_i);
ret.Prop_1_stacks.add(Prop_1_stack.fclone());
}
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


/* %%_%_CFG_%_%% */ArrayList<IntStack> Prop_1_stacks = new ArrayList<IntStack>();
static int[][] Prop_1_gt = { { 0, 10, 12,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, 1, -1,  }, { 0, -1, -1,  }, { 0, 10, 14,  }, { 0, 2, -1,  }, { 0, -1, -1,  }, { 0, 2, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  },  };
;
static int[][][][] Prop_1_at = { { { { 0,  },  }, { { 3,  },  }, { { 5,  },  },  }, { {  }, {  }, {  },  }, { { { 2, 2,  },  }, { { 2, 2,  },  }, { { 2, 2,  },  },  }, { { { 2, 1,  },  }, { { 2, 1,  },  }, { { 2, 1,  },  },  }, { {  }, {  }, {  },  }, { {  }, { { 15,  },  }, {  },  }, { {  }, {  }, {  },  }, { {  }, { { 4,  },  }, {  },  }, { { { 1, 4,  },  }, { { 1, 4,  },  }, { { 1, 4,  },  },  }, { { { 11,  },  }, {  }, {  },  }, { { { 2, 1,  },  }, { { 2, 1,  },  }, { { 2, 1,  },  },  }, { { { 0,  },  }, { { 3,  },  }, { { 17,  },  },  }, { { { 0,  },  }, { { 16,  },  }, { { 13,  },  },  }, { {  }, { { 8,  },  }, {  },  }, { { { 0,  },  }, { { 16,  },  }, { { 7,  },  },  }, { { { 1, 3,  },  }, { { 1, 3,  },  }, { { 1, 3,  },  },  }, { { { 2, 2,  },  }, { { 2, 2,  },  }, { { 2, 2,  },  },  }, { {  }, { { 6,  },  }, {  },  },  };
;
static boolean[] Prop_1_acc = { false, true, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, };
int Prop_1_cat; // ACCEPT = 0, UNKNOWN = 1, FAIL = 2
int Prop_1_event = -1;

class IntStack implements java.io.Serializable {
    int[] data;
    int curr_index = 0;
    public IntStack(){
        data = new int[32];
    }
    public String toString(){
        String ret = "[";
        for (int i = curr_index; i>=0; i--){
            ret += Integer.toString(data[i])+",";
        }
        return ret+"]";
    }
    public int hashCode() {
        return curr_index^peek();
    }
    public boolean equals(Object o) {
        if (o == null) return false;
        if (!(o instanceof IntStack)) return false;
        IntStack s = (IntStack)o;
        if(curr_index != s.curr_index) return false;
        for(int i = 0; i < curr_index; i++){
            if(data[i] != s.data[i]) return false;
        }
        return true;
    }
    public IntStack(int size){
        data = new int[size];
    }
    public int peek(){
        return data[curr_index - 1];
    }
    public int pop(){
        return data[--curr_index];
    }
    public void pop(int num){
        curr_index -= num;
    }
    public void push(int datum){
        if(curr_index < data.length){
            data[curr_index++] = datum;
        } else{
            int len = data.length;
            int[] old = data;
            data = new int[len * 2];
            for(int i = 0; i < len; ++i){
                data[i] = old[i];
            }
            data[curr_index++] = datum;
        }
    }
    public IntStack fclone(){
        IntStack ret = new IntStack(data.length);
        ret.curr_index = curr_index;
        for(int i = 0; i < curr_index; ++i){
            ret.data[i] = data[i];
        }
        return ret;
    }
    public void clear(){
        curr_index = 0;
    }
}

boolean SafeFileWriterMonitor_Prop_1_Category_match = false;

SafeFileWriterMonitor() {
IntStack stack = new IntStack();
stack.push(-2);
stack.push(9);
Prop_1_stacks.add(stack);

}

@Override
public final int getState() {
return -1;
}

final boolean Prop_1_event_open(FileWriter f) {
{
	}
RVM_lastevent = 0;

Prop_1_event = 1;
if (Prop_1_cat != 2) {
    Prop_1_event--; 
    Prop_1_cat = 1; 
    for (int Prop_1_i = Prop_1_stacks.size()-1; Prop_1_i >=0; Prop_1_i--) {
        IntStack stack = Prop_1_stacks.get(Prop_1_i); 
        Prop_1_stacks.set(Prop_1_i,null); 
        while (stack != null) { 
            int s = stack.peek();
            if (s >= 0 && Prop_1_at[s][Prop_1_event].length >= 0) { 
                /* not in an error state and something to do? */
                for (int j = 0; j < Prop_1_at[s][Prop_1_event].length; j++) { 
                    IntStack tstack; 
                    if (Prop_1_at[s][Prop_1_event].length > 1){
                        tstack = stack.fclone(); 
                    } else{ 
                        tstack = stack; 
                    } 
                    switch (Prop_1_at[s][Prop_1_event][j].length) { 
                        case 1:/* Shift */
                            tstack.push(Prop_1_at[s][Prop_1_event][j][0]); 
                            Prop_1_stacks.add(tstack); 
                            if (Prop_1_acc[Prop_1_at[s][Prop_1_event][j][0]]) Prop_1_cat = 0; 
                            break;
                        case 2: /* Reduce */ 
                            tstack.pop(Prop_1_at[s][Prop_1_event][j][1]); 
                            int Prop_1_old = tstack.peek();
                            tstack.push(Prop_1_gt[Prop_1_old][Prop_1_at[s][Prop_1_event][j][0]]); 
                            Prop_1_stacks.add(Prop_1_i,tstack); 
                            break; 
                    } 
                } 
            }
            stack = Prop_1_stacks.get(Prop_1_i); 
            Prop_1_stacks.remove(Prop_1_i); 
        }
    } 
    if (Prop_1_stacks.isEmpty()) 
        Prop_1_cat = 2; 
};
SafeFileWriterMonitor_Prop_1_Category_match = Prop_1_cat == 0;
return true;
}

final boolean Prop_1_event_write(FileWriter f) {
{
	}
RVM_lastevent = 1;

Prop_1_event = 2;
if (Prop_1_cat != 2) {
    Prop_1_event--; 
    Prop_1_cat = 1; 
    for (int Prop_1_i = Prop_1_stacks.size()-1; Prop_1_i >=0; Prop_1_i--) {
        IntStack stack = Prop_1_stacks.get(Prop_1_i); 
        Prop_1_stacks.set(Prop_1_i,null); 
        while (stack != null) { 
            int s = stack.peek();
            if (s >= 0 && Prop_1_at[s][Prop_1_event].length >= 0) { 
                /* not in an error state and something to do? */
                for (int j = 0; j < Prop_1_at[s][Prop_1_event].length; j++) { 
                    IntStack tstack; 
                    if (Prop_1_at[s][Prop_1_event].length > 1){
                        tstack = stack.fclone(); 
                    } else{ 
                        tstack = stack; 
                    } 
                    switch (Prop_1_at[s][Prop_1_event][j].length) { 
                        case 1:/* Shift */
                            tstack.push(Prop_1_at[s][Prop_1_event][j][0]); 
                            Prop_1_stacks.add(tstack); 
                            if (Prop_1_acc[Prop_1_at[s][Prop_1_event][j][0]]) Prop_1_cat = 0; 
                            break;
                        case 2: /* Reduce */ 
                            tstack.pop(Prop_1_at[s][Prop_1_event][j][1]); 
                            int Prop_1_old = tstack.peek();
                            tstack.push(Prop_1_gt[Prop_1_old][Prop_1_at[s][Prop_1_event][j][0]]); 
                            Prop_1_stacks.add(Prop_1_i,tstack); 
                            break; 
                    } 
                } 
            }
            stack = Prop_1_stacks.get(Prop_1_i); 
            Prop_1_stacks.remove(Prop_1_i); 
        }
    } 
    if (Prop_1_stacks.isEmpty()) 
        Prop_1_cat = 2; 
};
SafeFileWriterMonitor_Prop_1_Category_match = Prop_1_cat == 0;
return true;
}

final boolean Prop_1_event_close(FileWriter f) {
{
	}
RVM_lastevent = 2;

Prop_1_event = 3;
if (Prop_1_cat != 2) {
    Prop_1_event--; 
    Prop_1_cat = 1; 
    for (int Prop_1_i = Prop_1_stacks.size()-1; Prop_1_i >=0; Prop_1_i--) {
        IntStack stack = Prop_1_stacks.get(Prop_1_i); 
        Prop_1_stacks.set(Prop_1_i,null); 
        while (stack != null) { 
            int s = stack.peek();
            if (s >= 0 && Prop_1_at[s][Prop_1_event].length >= 0) { 
                /* not in an error state and something to do? */
                for (int j = 0; j < Prop_1_at[s][Prop_1_event].length; j++) { 
                    IntStack tstack; 
                    if (Prop_1_at[s][Prop_1_event].length > 1){
                        tstack = stack.fclone(); 
                    } else{ 
                        tstack = stack; 
                    } 
                    switch (Prop_1_at[s][Prop_1_event][j].length) { 
                        case 1:/* Shift */
                            tstack.push(Prop_1_at[s][Prop_1_event][j][0]); 
                            Prop_1_stacks.add(tstack); 
                            if (Prop_1_acc[Prop_1_at[s][Prop_1_event][j][0]]) Prop_1_cat = 0; 
                            break;
                        case 2: /* Reduce */ 
                            tstack.pop(Prop_1_at[s][Prop_1_event][j][1]); 
                            int Prop_1_old = tstack.peek();
                            tstack.push(Prop_1_gt[Prop_1_old][Prop_1_at[s][Prop_1_event][j][0]]); 
                            Prop_1_stacks.add(Prop_1_i,tstack); 
                            break; 
                    } 
                } 
            }
            stack = Prop_1_stacks.get(Prop_1_i); 
            Prop_1_stacks.remove(Prop_1_i); 
        }
    } 
    if (Prop_1_stacks.isEmpty()) 
        Prop_1_cat = 2; 
};
SafeFileWriterMonitor_Prop_1_Category_match = Prop_1_cat == 0;
return true;
}

final void Prop_1_handler_match (){
{
		System.out.println("write after close");
	}

}

final void reset() {
RVM_lastevent = -1;
Prop_1_stacks.clear();
IntStack stack = new IntStack();
stack.push(-2);
stack.push(9);
Prop_1_stacks.add(stack);
SafeFileWriterMonitor_Prop_1_Category_match = false;
}

public final int hashCode() {
if(Prop_1_stacks.size() == 0) return 0;
return Prop_1_stacks.size() ^ Prop_1_stacks.get(Prop_1_stacks.size() - 1).hashCode();
}

public final boolean equals(Object o) {
if(o == null) return false;
if(! (o instanceof SafeFileWriterMonitor)) return false ;
SafeFileWriterMonitor m = (SafeFileWriterMonitor) o;
if (Prop_1_stacks.size() != m.Prop_1_stacks.size()) return false;
for(int Prop_1_i = 0; Prop_1_i < Prop_1_stacks.size(); Prop_1_i++){
IntStack Prop_1_stack = Prop_1_stacks.get(Prop_1_i);
IntStack Prop_1_stack2 = m.Prop_1_stacks.get(Prop_1_i);
if(Prop_1_stack.curr_index != Prop_1_stack2.curr_index) return false;
for(int Prop_1_j = 0; Prop_1_j < Prop_1_stack.curr_index; Prop_1_j++){
if(Prop_1_stack.data[Prop_1_j] != Prop_1_stack2.data[Prop_1_j]) return false;
}
}
return true;
}

// RVMRef_f was suppressed to reduce memory overhead


@Override
protected final void terminateInternal(int idnum) {
switch(idnum){
case 0:
break;
}
switch(RVM_lastevent) {
case -1:
return;
case 0:
//open
return;
case 1:
//write
return;
case 2:
//close
return;
}
return;
}

public static int getNumberOfEvents() {
return 3;
}

public static int getNumberOfStates() {
return 0;
}

}
class SafeHashSetMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
protected Object clone() {
try {
SafeHashSetMonitor ret = (SafeHashSetMonitor) super.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


	int hashcode;

	Object myObj;


static final int Prop_1_transition_add[] = {1, 3, 3, 3};;
static final int Prop_1_transition_unsafe_contains[] = {3, 2, 2, 3};;
static final int Prop_1_transition_remove[] = {3, 3, 3, 3};;

volatile boolean SafeHashSetMonitor_Prop_1_Category_match = false;

private final AtomicInteger pairValue;

SafeHashSetMonitor() {
this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;


}

@Override public final int getState() {
	return this.getState(this.pairValue.get() ) ;
}
@Override public final int getLastEvent() {
	return this.getLastEvent(this.pairValue.get() ) ;
}
private final int getState(int pairValue) {
	return (pairValue & 3) ;
}
private final int getLastEvent(int pairValue) {
	return (pairValue >> 2) ;
}
private final int calculatePairValue(int lastEvent, int state) {
	return (((lastEvent + 1) << 2) | state) ;
}

private final int handleEvent(int eventId, int[] table) {
	int nextstate;
	while (true) {
		int oldpairvalue = this.pairValue.get() ;
		int oldstate = this.getState(oldpairvalue) ;
		nextstate = table [ oldstate ];
		int nextpairvalue = this.calculatePairValue(eventId, nextstate) ;
		if (this.pairValue.compareAndSet(oldpairvalue, nextpairvalue) ) {
			break;
		}
	}
	return nextstate;
}

final boolean Prop_1_event_add(HashSet t, Object o) {
{
		hashcode = o.hashCode();
		myObj = o;
	}

int nextstate = this.handleEvent(0, Prop_1_transition_add) ;
this.SafeHashSetMonitor_Prop_1_Category_match = nextstate == 2;

return true;
}

final boolean Prop_1_event_unsafe_contains(HashSet t, Object o) {
{
		if ( ! (hashcode != o.hashCode()) ) {
			return false;
		}
		{
		}
	}

int nextstate = this.handleEvent(1, Prop_1_transition_unsafe_contains) ;
this.SafeHashSetMonitor_Prop_1_Category_match = nextstate == 2;

return true;
}

final boolean Prop_1_event_remove(HashSet t, Object o) {
{
	}

int nextstate = this.handleEvent(2, Prop_1_transition_remove) ;
this.SafeHashSetMonitor_Prop_1_Category_match = nextstate == 2;

return true;
}

final void Prop_1_handler_match (){
{
		System.err.println("HashCode changed for Object " + myObj + " while being in a   Hashtable!");
		System.exit(1);
	}

}

final void reset() {
this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

SafeHashSetMonitor_Prop_1_Category_match = false;
}

// RVMRef_t was suppressed to reduce memory overhead
// RVMRef_o was suppressed to reduce memory overhead

//alive_parameters_0 = [HashSet t, Object o]
boolean alive_parameters_0 = true;

@Override
protected final void terminateInternal(int idnum) {
int lastEvent = this.getLastEvent();

switch(idnum){
case 0:
alive_parameters_0 = false;
break;
case 1:
alive_parameters_0 = false;
break;
}
switch(lastEvent) {
case -1:
return;
case 0:
//add
//alive_t && alive_o
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 1:
//unsafe_contains
//alive_t && alive_o
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 2:
//remove
return;
}
return;
}

public static int getNumberOfEvents() {
return 3;
}

public static int getNumberOfStates() {
return 4;
}

}
interface ISafeIteratorMonitor extends IMonitor, IDisableHolder {
}

class SafeIteratorDisableHolder extends DisableHolder implements ISafeIteratorMonitor {
SafeIteratorDisableHolder(long tau) {
super(tau);
}

@Override
public final boolean isTerminated() {
return false;
}

@Override
public int getLastEvent() {
return -1;
}

@Override
public int getState() {
return -1;
}

}

class SafeIteratorMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, ISafeIteratorMonitor {
protected Object clone() {
try {
SafeIteratorMonitor ret = (SafeIteratorMonitor) super.clone();
ret.monitorInfo = (com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo)this.monitorInfo.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


WeakReference Ref_c = null;
WeakReference Ref_i = null;
int Prop_1_state;
static final int Prop_1_transition_create[] = {2, 3, 2, 3};;
static final int Prop_1_transition_updatesource[] = {0, 3, 0, 3};;
static final int Prop_1_transition_next[] = {1, 3, 2, 3};;

boolean SafeIteratorMonitor_Prop_1_Category_violation = false;

SafeIteratorMonitor(long tau, CachedWeakReference RVMRef_c, CachedWeakReference RVMRef_i) {
this.tau = tau;
Prop_1_state = 0;

this.RVMRef_c = RVMRef_c;
this.RVMRef_i = RVMRef_i;
}

@Override
public final int getState() {
return Prop_1_state;
}

private final long tau;
private long disable = -1;

@Override
public final long getTau() {
return this.tau;
}

@Override
public final long getDisable() {
return this.disable;
}

@Override
public final void setDisable(long value) {
this.disable = value;
}

final boolean Prop_1_event_create(Collection c, Iterator i) {
{
	}
if(Ref_c == null){
Ref_c = new WeakReference(c);
}
if(Ref_i == null){
Ref_i = new WeakReference(i);
}
RVM_lastevent = 0;

Prop_1_state = Prop_1_transition_create[Prop_1_state];
if(this.monitorInfo.isFullParam){
SafeIteratorMonitor_Prop_1_Category_violation = Prop_1_state == 1;
}
return true;
}

final boolean Prop_1_event_updatesource(Collection c) {
Iterator i = null;
if(Ref_i != null){
i = (Iterator)Ref_i.get();
}
{
	}
if(Ref_c == null){
Ref_c = new WeakReference(c);
}
RVM_lastevent = 1;

Prop_1_state = Prop_1_transition_updatesource[Prop_1_state];
if(this.monitorInfo.isFullParam){
SafeIteratorMonitor_Prop_1_Category_violation = Prop_1_state == 1;
}
return true;
}

final boolean Prop_1_event_next(Iterator i) {
Collection c = null;
if(Ref_c != null){
c = (Collection)Ref_c.get();
}
{
	}
if(Ref_i == null){
Ref_i = new WeakReference(i);
}
RVM_lastevent = 2;

Prop_1_state = Prop_1_transition_next[Prop_1_state];
if(this.monitorInfo.isFullParam){
SafeIteratorMonitor_Prop_1_Category_violation = Prop_1_state == 1;
}
return true;
}

final void Prop_1_handler_violation (){
{
		System.out.println("improper iterator usage");
	}

}

final void reset() {
RVM_lastevent = -1;
Prop_1_state = 0;
SafeIteratorMonitor_Prop_1_Category_violation = false;
}

CachedWeakReference RVMRef_c;
CachedWeakReference RVMRef_i;

//alive_parameters_0 = [Collection c, Iterator i]
boolean alive_parameters_0 = true;
//alive_parameters_1 = [Iterator i]
boolean alive_parameters_1 = true;

@Override
protected final void terminateInternal(int idnum) {
switch(idnum){
case 0:
alive_parameters_0 = false;
break;
case 1:
alive_parameters_0 = false;
alive_parameters_1 = false;
break;
}
switch(RVM_lastevent) {
case -1:
return;
case 0:
//create
//alive_c && alive_i
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 1:
//updatesource
//alive_i
if(!(alive_parameters_1)){
RVM_terminated = true;
return;
}
break;

case 2:
//next
//alive_c && alive_i
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

}
return;
}

com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo monitorInfo;
public static int getNumberOfEvents() {
return 3;
}

public static int getNumberOfStates() {
return 4;
}

}
interface ISafeMapIteratorMonitor extends IMonitor, IDisableHolder {
}

class SafeMapIteratorDisableHolder extends DisableHolder implements ISafeMapIteratorMonitor {
SafeMapIteratorDisableHolder(long tau) {
super(tau);
}

@Override
public final boolean isTerminated() {
return false;
}

@Override
public int getLastEvent() {
return -1;
}

@Override
public int getState() {
return -1;
}

}

class SafeMapIteratorMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, ISafeMapIteratorMonitor {
protected Object clone() {
try {
SafeMapIteratorMonitor ret = (SafeMapIteratorMonitor) super.clone();
ret.monitorInfo = (com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo)this.monitorInfo.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


WeakReference Ref_c = null;
WeakReference Ref_i = null;
WeakReference Ref_map = null;
int Prop_1_state;
static final int Prop_1_transition_createColl[] = {1, 1, 3, 3};;
static final int Prop_1_transition_createIter[] = {0, 1, 3, 3};;
static final int Prop_1_transition_useIter[] = {2, 1, 3, 3};;
static final int Prop_1_transition_updateMap[] = {0, 0, 3, 3};;

boolean SafeMapIteratorMonitor_Prop_1_Category_violation = false;

SafeMapIteratorMonitor(long tau, CachedWeakReference RVMRef_map, CachedWeakReference RVMRef_c, CachedWeakReference RVMRef_i) {
this.tau = tau;
Prop_1_state = 0;

this.RVMRef_map = RVMRef_map;
this.RVMRef_c = RVMRef_c;
this.RVMRef_i = RVMRef_i;
}

@Override
public final int getState() {
return Prop_1_state;
}

private final long tau;
private long disable = -1;

@Override
public final long getTau() {
return this.tau;
}

@Override
public final long getDisable() {
return this.disable;
}

@Override
public final void setDisable(long value) {
this.disable = value;
}

final boolean Prop_1_event_createColl(Map map, Collection c) {
Iterator i = null;
if(Ref_i != null){
i = (Iterator)Ref_i.get();
}
{
	}
if(Ref_c == null){
Ref_c = new WeakReference(c);
}
if(Ref_map == null){
Ref_map = new WeakReference(map);
}
RVM_lastevent = 0;

Prop_1_state = Prop_1_transition_createColl[Prop_1_state];
if(this.monitorInfo.isFullParam){
SafeMapIteratorMonitor_Prop_1_Category_violation = Prop_1_state == 2;
}
return true;
}

final boolean Prop_1_event_createIter(Collection c, Iterator i) {
Map map = null;
if(Ref_map != null){
map = (Map)Ref_map.get();
}
{
	}
if(Ref_c == null){
Ref_c = new WeakReference(c);
}
if(Ref_i == null){
Ref_i = new WeakReference(i);
}
RVM_lastevent = 1;

Prop_1_state = Prop_1_transition_createIter[Prop_1_state];
if(this.monitorInfo.isFullParam){
SafeMapIteratorMonitor_Prop_1_Category_violation = Prop_1_state == 2;
}
return true;
}

final boolean Prop_1_event_useIter(Iterator i) {
Map map = null;
if(Ref_map != null){
map = (Map)Ref_map.get();
}
Collection c = null;
if(Ref_c != null){
c = (Collection)Ref_c.get();
}
{
	}
if(Ref_i == null){
Ref_i = new WeakReference(i);
}
RVM_lastevent = 2;

Prop_1_state = Prop_1_transition_useIter[Prop_1_state];
if(this.monitorInfo.isFullParam){
SafeMapIteratorMonitor_Prop_1_Category_violation = Prop_1_state == 2;
}
return true;
}

final boolean Prop_1_event_updateMap(Map map) {
Collection c = null;
if(Ref_c != null){
c = (Collection)Ref_c.get();
}
Iterator i = null;
if(Ref_i != null){
i = (Iterator)Ref_i.get();
}
{
	}
if(Ref_map == null){
Ref_map = new WeakReference(map);
}
RVM_lastevent = 3;

Prop_1_state = Prop_1_transition_updateMap[Prop_1_state];
if(this.monitorInfo.isFullParam){
SafeMapIteratorMonitor_Prop_1_Category_violation = Prop_1_state == 2;
}
return true;
}

final void Prop_1_handler_violation (){
{
		System.out.println("unsafe iterator usage!");
	}

}

final void reset() {
RVM_lastevent = -1;
Prop_1_state = 0;
SafeMapIteratorMonitor_Prop_1_Category_violation = false;
}

CachedWeakReference RVMRef_map;
CachedWeakReference RVMRef_c;
CachedWeakReference RVMRef_i;

//alive_parameters_0 = [Map map, Iterator i]
boolean alive_parameters_0 = true;
//alive_parameters_1 = [Iterator i]
boolean alive_parameters_1 = true;

@Override
protected final void terminateInternal(int idnum) {
switch(idnum){
case 0:
alive_parameters_0 = false;
break;
case 1:
break;
case 2:
alive_parameters_0 = false;
alive_parameters_1 = false;
break;
}
switch(RVM_lastevent) {
case -1:
return;
case 0:
//createColl
//alive_map && alive_i
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 1:
//createIter
//alive_i
if(!(alive_parameters_1)){
RVM_terminated = true;
return;
}
break;

case 2:
//useIter
//alive_map && alive_i
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 3:
//updateMap
//alive_i
if(!(alive_parameters_1)){
RVM_terminated = true;
return;
}
break;

}
return;
}

com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo monitorInfo;
public static int getNumberOfEvents() {
return 4;
}

public static int getNumberOfStates() {
return 4;
}

}
interface ISafeSyncCollectionMonitor extends IMonitor, IDisableHolder {
}

class SafeSyncCollectionDisableHolder extends DisableHolder implements ISafeSyncCollectionMonitor {
SafeSyncCollectionDisableHolder(long tau) {
super(tau);
}

@Override
public final boolean isTerminated() {
return false;
}

@Override
public int getLastEvent() {
return -1;
}

@Override
public int getState() {
return -1;
}

}

class SafeSyncCollectionMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, ISafeSyncCollectionMonitor {
protected Object clone() {
try {
SafeSyncCollectionMonitor ret = (SafeSyncCollectionMonitor) super.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


	Object c;

WeakReference Ref_c = null;
WeakReference Ref_iter = null;
int Prop_1_state;
static final int Prop_1_transition_sync[] = {1, 4, 4, 4, 4};;
static final int Prop_1_transition_syncCreateIter[] = {4, 2, 4, 4, 4};;
static final int Prop_1_transition_asyncCreateIter[] = {4, 3, 4, 4, 4};;
static final int Prop_1_transition_accessIter[] = {4, 4, 3, 4, 4};;

boolean SafeSyncCollectionMonitor_Prop_1_Category_match = false;

SafeSyncCollectionMonitor(long tau) {
this.tau = tau;
Prop_1_state = 0;

}

@Override
public final int getState() {
return Prop_1_state;
}

private final long tau;
private long disable = -1;

@Override
public final long getTau() {
return this.tau;
}

@Override
public final long getDisable() {
return this.disable;
}

@Override
public final void setDisable(long value) {
this.disable = value;
}

final boolean Prop_1_event_sync(Object c) {
Iterator iter = null;
if(Ref_iter != null){
iter = (Iterator)Ref_iter.get();
}
{
		this.c = c;
	}
if(Ref_c == null){
Ref_c = new WeakReference(c);
}
RVM_lastevent = 0;

Prop_1_state = Prop_1_transition_sync[Prop_1_state];
SafeSyncCollectionMonitor_Prop_1_Category_match = Prop_1_state == 3;
return true;
}

final boolean Prop_1_event_syncCreateIter(Object c, Iterator iter) {
{
	}
if(Ref_c == null){
Ref_c = new WeakReference(c);
}
if(Ref_iter == null){
Ref_iter = new WeakReference(iter);
}
RVM_lastevent = 1;

Prop_1_state = Prop_1_transition_syncCreateIter[Prop_1_state];
SafeSyncCollectionMonitor_Prop_1_Category_match = Prop_1_state == 3;
return true;
}

final boolean Prop_1_event_asyncCreateIter(Object c, Iterator iter) {
{
	}
if(Ref_c == null){
Ref_c = new WeakReference(c);
}
if(Ref_iter == null){
Ref_iter = new WeakReference(iter);
}
RVM_lastevent = 2;

Prop_1_state = Prop_1_transition_asyncCreateIter[Prop_1_state];
SafeSyncCollectionMonitor_Prop_1_Category_match = Prop_1_state == 3;
return true;
}

final boolean Prop_1_event_accessIter(Iterator iter) {
Object c = null;
if(Ref_c != null){
c = (Object)Ref_c.get();
}
{
		if ( ! (!Thread.holdsLock(this.c)) ) {
			return false;
		}
		{
		}
	}
if(Ref_iter == null){
Ref_iter = new WeakReference(iter);
}
RVM_lastevent = 3;

Prop_1_state = Prop_1_transition_accessIter[Prop_1_state];
SafeSyncCollectionMonitor_Prop_1_Category_match = Prop_1_state == 3;
return true;
}

final void Prop_1_handler_match (){
{
		System.out.println("pattern matched!");
	}

}

final void reset() {
RVM_lastevent = -1;
Prop_1_state = 0;
SafeSyncCollectionMonitor_Prop_1_Category_match = false;
}

// RVMRef_c was suppressed to reduce memory overhead
// RVMRef_iter was suppressed to reduce memory overhead

//alive_parameters_0 = [Object c, Iterator iter]
boolean alive_parameters_0 = true;
//alive_parameters_1 = [Iterator iter]
boolean alive_parameters_1 = true;

@Override
protected final void terminateInternal(int idnum) {
switch(idnum){
case 0:
alive_parameters_0 = false;
break;
case 1:
alive_parameters_0 = false;
alive_parameters_1 = false;
break;
}
switch(RVM_lastevent) {
case -1:
return;
case 0:
//sync
//alive_c && alive_iter
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 1:
//syncCreateIter
//alive_iter
if(!(alive_parameters_1)){
RVM_terminated = true;
return;
}
break;

case 2:
//asyncCreateIter
return;
case 3:
//accessIter
return;
}
return;
}

public static int getNumberOfEvents() {
return 4;
}

public static int getNumberOfStates() {
return 5;
}

}
interface ISafeSyncMapMonitor extends IMonitor, IDisableHolder {
}

class SafeSyncMapDisableHolder extends DisableHolder implements ISafeSyncMapMonitor {
SafeSyncMapDisableHolder(long tau) {
super(tau);
}

@Override
public final boolean isTerminated() {
return false;
}

@Override
public int getLastEvent() {
return -1;
}

@Override
public int getState() {
return -1;
}

}

class SafeSyncMapMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, ISafeSyncMapMonitor {
protected Object clone() {
try {
SafeSyncMapMonitor ret = (SafeSyncMapMonitor) super.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


	Map c;

WeakReference Ref_syncMap = null;
WeakReference Ref_iter = null;
WeakReference Ref_mapSet = null;
int Prop_1_state;
static final int Prop_1_transition_sync[] = {3, 5, 5, 5, 5, 5};;
static final int Prop_1_transition_createSet[] = {5, 5, 5, 1, 5, 5};;
static final int Prop_1_transition_syncCreateIter[] = {5, 4, 5, 5, 5, 5};;
static final int Prop_1_transition_asyncCreateIter[] = {5, 2, 5, 5, 5, 5};;
static final int Prop_1_transition_accessIter[] = {5, 5, 5, 5, 2, 5};;

boolean SafeSyncMapMonitor_Prop_1_Category_match = false;

SafeSyncMapMonitor(long tau, CachedWeakReference RVMRef_syncMap) {
this.tau = tau;
Prop_1_state = 0;

this.RVMRef_syncMap = RVMRef_syncMap;
}

@Override
public final int getState() {
return Prop_1_state;
}

private final long tau;
private long disable = -1;

@Override
public final long getTau() {
return this.tau;
}

@Override
public final long getDisable() {
return this.disable;
}

@Override
public final void setDisable(long value) {
this.disable = value;
}

final boolean Prop_1_event_sync(Map syncMap) {
Set mapSet = null;
if(Ref_mapSet != null){
mapSet = (Set)Ref_mapSet.get();
}
Iterator iter = null;
if(Ref_iter != null){
iter = (Iterator)Ref_iter.get();
}
{
		this.c = syncMap;
	}
if(Ref_syncMap == null){
Ref_syncMap = new WeakReference(syncMap);
}
RVM_lastevent = 0;

Prop_1_state = Prop_1_transition_sync[Prop_1_state];
SafeSyncMapMonitor_Prop_1_Category_match = Prop_1_state == 2;
return true;
}

final boolean Prop_1_event_createSet(Map syncMap, Set mapSet) {
Iterator iter = null;
if(Ref_iter != null){
iter = (Iterator)Ref_iter.get();
}
{
	}
if(Ref_syncMap == null){
Ref_syncMap = new WeakReference(syncMap);
}
if(Ref_mapSet == null){
Ref_mapSet = new WeakReference(mapSet);
}
RVM_lastevent = 1;

Prop_1_state = Prop_1_transition_createSet[Prop_1_state];
SafeSyncMapMonitor_Prop_1_Category_match = Prop_1_state == 2;
return true;
}

final boolean Prop_1_event_syncCreateIter(Set mapSet, Iterator iter) {
Map syncMap = null;
if(Ref_syncMap != null){
syncMap = (Map)Ref_syncMap.get();
}
{
		if ( ! (Thread.holdsLock(c)) ) {
			return false;
		}
		{
		}
	}
if(Ref_iter == null){
Ref_iter = new WeakReference(iter);
}
if(Ref_mapSet == null){
Ref_mapSet = new WeakReference(mapSet);
}
RVM_lastevent = 2;

Prop_1_state = Prop_1_transition_syncCreateIter[Prop_1_state];
SafeSyncMapMonitor_Prop_1_Category_match = Prop_1_state == 2;
return true;
}

final boolean Prop_1_event_asyncCreateIter(Set mapSet, Iterator iter) {
Map syncMap = null;
if(Ref_syncMap != null){
syncMap = (Map)Ref_syncMap.get();
}
{
		if ( ! (!Thread.holdsLock(c)) ) {
			return false;
		}
		{
		}
	}
if(Ref_iter == null){
Ref_iter = new WeakReference(iter);
}
if(Ref_mapSet == null){
Ref_mapSet = new WeakReference(mapSet);
}
RVM_lastevent = 3;

Prop_1_state = Prop_1_transition_asyncCreateIter[Prop_1_state];
SafeSyncMapMonitor_Prop_1_Category_match = Prop_1_state == 2;
return true;
}

final boolean Prop_1_event_accessIter(Iterator iter) {
Map syncMap = null;
if(Ref_syncMap != null){
syncMap = (Map)Ref_syncMap.get();
}
Set mapSet = null;
if(Ref_mapSet != null){
mapSet = (Set)Ref_mapSet.get();
}
{
		if ( ! (!Thread.holdsLock(c)) ) {
			return false;
		}
		{
		}
	}
if(Ref_iter == null){
Ref_iter = new WeakReference(iter);
}
RVM_lastevent = 4;

Prop_1_state = Prop_1_transition_accessIter[Prop_1_state];
SafeSyncMapMonitor_Prop_1_Category_match = Prop_1_state == 2;
return true;
}

final void Prop_1_handler_match (){
{
		System.out.println("synchronized collection accessed in non threadsafe manner!");
	}

}

final void reset() {
RVM_lastevent = -1;
Prop_1_state = 0;
SafeSyncMapMonitor_Prop_1_Category_match = false;
}

final CachedWeakReference RVMRef_syncMap;
// RVMRef_mapSet was suppressed to reduce memory overhead
// RVMRef_iter was suppressed to reduce memory overhead

//alive_parameters_0 = [Map syncMap, Set mapSet, Iterator iter]
boolean alive_parameters_0 = true;
//alive_parameters_1 = [Set mapSet, Iterator iter]
boolean alive_parameters_1 = true;
//alive_parameters_2 = [Iterator iter]
boolean alive_parameters_2 = true;

@Override
protected final void terminateInternal(int idnum) {
switch(idnum){
case 0:
alive_parameters_0 = false;
break;
case 1:
alive_parameters_0 = false;
alive_parameters_1 = false;
break;
case 2:
alive_parameters_0 = false;
alive_parameters_1 = false;
alive_parameters_2 = false;
break;
}
switch(RVM_lastevent) {
case -1:
return;
case 0:
//sync
//alive_syncMap && alive_mapSet && alive_iter
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 1:
//createSet
//alive_mapSet && alive_iter
if(!(alive_parameters_1)){
RVM_terminated = true;
return;
}
break;

case 2:
//syncCreateIter
//alive_iter
if(!(alive_parameters_2)){
RVM_terminated = true;
return;
}
break;

case 3:
//asyncCreateIter
return;
case 4:
//accessIter
return;
}
return;
}

public static int getNumberOfEvents() {
return 5;
}

public static int getNumberOfStates() {
return 6;
}

}
interface IUnsafeIteratorMonitor extends IMonitor, IDisableHolder {
}

class UnsafeIteratorDisableHolder extends DisableHolder implements IUnsafeIteratorMonitor {
UnsafeIteratorDisableHolder(long tau) {
super(tau);
}

@Override
public final boolean isTerminated() {
return false;
}

@Override
public int getLastEvent() {
return -1;
}

@Override
public int getState() {
return -1;
}

}

class UnsafeIteratorMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, IUnsafeIteratorMonitor {
protected Object clone() {
try {
UnsafeIteratorMonitor ret = (UnsafeIteratorMonitor) super.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


WeakReference Ref_c = null;
WeakReference Ref_i = null;
int Prop_1_state;
static final int Prop_1_transition_create[] = {1, 4, 4, 4, 4};;
static final int Prop_1_transition_updatesource[] = {4, 3, 4, 3, 4};;
static final int Prop_1_transition_next[] = {4, 1, 4, 2, 4};;

boolean UnsafeIteratorMonitor_Prop_1_Category_match = false;

UnsafeIteratorMonitor(long tau) {
this.tau = tau;
Prop_1_state = 0;

}

@Override
public final int getState() {
return Prop_1_state;
}

private final long tau;
private long disable = -1;

@Override
public final long getTau() {
return this.tau;
}

@Override
public final long getDisable() {
return this.disable;
}

@Override
public final void setDisable(long value) {
this.disable = value;
}

final boolean Prop_1_event_create(Collection c, Iterator i) {
{
	}
if(Ref_c == null){
Ref_c = new WeakReference(c);
}
if(Ref_i == null){
Ref_i = new WeakReference(i);
}
RVM_lastevent = 0;

Prop_1_state = Prop_1_transition_create[Prop_1_state];
UnsafeIteratorMonitor_Prop_1_Category_match = Prop_1_state == 2;
return true;
}

final boolean Prop_1_event_updatesource(Collection c) {
Iterator i = null;
if(Ref_i != null){
i = (Iterator)Ref_i.get();
}
{
	}
if(Ref_c == null){
Ref_c = new WeakReference(c);
}
RVM_lastevent = 1;

Prop_1_state = Prop_1_transition_updatesource[Prop_1_state];
UnsafeIteratorMonitor_Prop_1_Category_match = Prop_1_state == 2;
return true;
}

final boolean Prop_1_event_next(Iterator i) {
Collection c = null;
if(Ref_c != null){
c = (Collection)Ref_c.get();
}
{
	}
if(Ref_i == null){
Ref_i = new WeakReference(i);
}
RVM_lastevent = 2;

Prop_1_state = Prop_1_transition_next[Prop_1_state];
UnsafeIteratorMonitor_Prop_1_Category_match = Prop_1_state == 2;
return true;
}

final void Prop_1_handler_match (){
{
		System.out.println("improper iterator usage");
	}

}

final void reset() {
RVM_lastevent = -1;
Prop_1_state = 0;
UnsafeIteratorMonitor_Prop_1_Category_match = false;
}

// RVMRef_c was suppressed to reduce memory overhead
// RVMRef_i was suppressed to reduce memory overhead

//alive_parameters_0 = [Collection c, Iterator i]
boolean alive_parameters_0 = true;
//alive_parameters_1 = [Iterator i]
boolean alive_parameters_1 = true;

@Override
protected final void terminateInternal(int idnum) {
switch(idnum){
case 0:
alive_parameters_0 = false;
break;
case 1:
alive_parameters_0 = false;
alive_parameters_1 = false;
break;
}
switch(RVM_lastevent) {
case -1:
return;
case 0:
//create
//alive_c && alive_i
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 1:
//updatesource
//alive_i
if(!(alive_parameters_1)){
RVM_terminated = true;
return;
}
break;

case 2:
//next
//alive_c && alive_i
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

}
return;
}

public static int getNumberOfEvents() {
return 3;
}

public static int getNumberOfStates() {
return 5;
}

}
interface IUnsafeMapIteratorMonitor extends IMonitor, IDisableHolder {
}

class UnsafeMapIteratorDisableHolder extends DisableHolder implements IUnsafeMapIteratorMonitor {
UnsafeMapIteratorDisableHolder(long tau) {
super(tau);
}

@Override
public final boolean isTerminated() {
return false;
}

@Override
public int getLastEvent() {
return -1;
}

@Override
public int getState() {
return -1;
}

}

class UnsafeMapIteratorMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject, IUnsafeMapIteratorMonitor {
protected Object clone() {
try {
UnsafeMapIteratorMonitor ret = (UnsafeMapIteratorMonitor) super.clone();
ret.monitorInfo = (com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo)this.monitorInfo.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


WeakReference Ref_c = null;
WeakReference Ref_i = null;
WeakReference Ref_map = null;
int Prop_1_state;
static final int Prop_1_transition_createColl[] = {2, 5, 5, 5, 5, 5};;
static final int Prop_1_transition_createIter[] = {5, 5, 3, 5, 5, 5};;
static final int Prop_1_transition_useIter[] = {5, 5, 5, 3, 1, 5};;
static final int Prop_1_transition_updateMap[] = {5, 5, 2, 4, 4, 5};;

boolean UnsafeMapIteratorMonitor_Prop_1_Category_match = false;

UnsafeMapIteratorMonitor(long tau, CachedWeakReference RVMRef_map, CachedWeakReference RVMRef_c, CachedWeakReference RVMRef_i) {
this.tau = tau;
Prop_1_state = 0;

this.RVMRef_map = RVMRef_map;
this.RVMRef_c = RVMRef_c;
this.RVMRef_i = RVMRef_i;
}

@Override
public final int getState() {
return Prop_1_state;
}

private final long tau;
private long disable = -1;

@Override
public final long getTau() {
return this.tau;
}

@Override
public final long getDisable() {
return this.disable;
}

@Override
public final void setDisable(long value) {
this.disable = value;
}

final boolean Prop_1_event_createColl(Map map, Collection c) {
Iterator i = null;
if(Ref_i != null){
i = (Iterator)Ref_i.get();
}
{
	}
if(Ref_c == null){
Ref_c = new WeakReference(c);
}
if(Ref_map == null){
Ref_map = new WeakReference(map);
}
RVM_lastevent = 0;

Prop_1_state = Prop_1_transition_createColl[Prop_1_state];
if(this.monitorInfo.isFullParam){
UnsafeMapIteratorMonitor_Prop_1_Category_match = Prop_1_state == 1;
}
return true;
}

final boolean Prop_1_event_createIter(Collection c, Iterator i) {
Map map = null;
if(Ref_map != null){
map = (Map)Ref_map.get();
}
{
	}
if(Ref_c == null){
Ref_c = new WeakReference(c);
}
if(Ref_i == null){
Ref_i = new WeakReference(i);
}
RVM_lastevent = 1;

Prop_1_state = Prop_1_transition_createIter[Prop_1_state];
if(this.monitorInfo.isFullParam){
UnsafeMapIteratorMonitor_Prop_1_Category_match = Prop_1_state == 1;
}
return true;
}

final boolean Prop_1_event_useIter(Iterator i) {
Map map = null;
if(Ref_map != null){
map = (Map)Ref_map.get();
}
Collection c = null;
if(Ref_c != null){
c = (Collection)Ref_c.get();
}
{
	}
if(Ref_i == null){
Ref_i = new WeakReference(i);
}
RVM_lastevent = 2;

Prop_1_state = Prop_1_transition_useIter[Prop_1_state];
if(this.monitorInfo.isFullParam){
UnsafeMapIteratorMonitor_Prop_1_Category_match = Prop_1_state == 1;
}
return true;
}

final boolean Prop_1_event_updateMap(Map map) {
Collection c = null;
if(Ref_c != null){
c = (Collection)Ref_c.get();
}
Iterator i = null;
if(Ref_i != null){
i = (Iterator)Ref_i.get();
}
{
	}
if(Ref_map == null){
Ref_map = new WeakReference(map);
}
RVM_lastevent = 3;

Prop_1_state = Prop_1_transition_updateMap[Prop_1_state];
if(this.monitorInfo.isFullParam){
UnsafeMapIteratorMonitor_Prop_1_Category_match = Prop_1_state == 1;
}
return true;
}

final void Prop_1_handler_match (){
{
		System.out.println("unsafe iterator usage!");
	}

}

final void reset() {
RVM_lastevent = -1;
Prop_1_state = 0;
UnsafeMapIteratorMonitor_Prop_1_Category_match = false;
}

CachedWeakReference RVMRef_map;
CachedWeakReference RVMRef_c;
CachedWeakReference RVMRef_i;

//alive_parameters_0 = [Map map, Collection c, Iterator i]
boolean alive_parameters_0 = true;
//alive_parameters_1 = [Map map, Iterator i]
boolean alive_parameters_1 = true;
//alive_parameters_2 = [Iterator i]
boolean alive_parameters_2 = true;

@Override
protected final void terminateInternal(int idnum) {
switch(idnum){
case 0:
alive_parameters_0 = false;
alive_parameters_1 = false;
break;
case 1:
alive_parameters_0 = false;
break;
case 2:
alive_parameters_0 = false;
alive_parameters_1 = false;
alive_parameters_2 = false;
break;
}
switch(RVM_lastevent) {
case -1:
return;
case 0:
//createColl
//alive_map && alive_c && alive_i
if(!(alive_parameters_0)){
RVM_terminated = true;
return;
}
break;

case 1:
//createIter
//alive_map && alive_i
if(!(alive_parameters_1)){
RVM_terminated = true;
return;
}
break;

case 2:
//useIter
//alive_map && alive_i
if(!(alive_parameters_1)){
RVM_terminated = true;
return;
}
break;

case 3:
//updateMap
//alive_i
if(!(alive_parameters_2)){
RVM_terminated = true;
return;
}
break;

}
return;
}

com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo monitorInfo;
public static int getNumberOfEvents() {
return 4;
}

public static int getNumberOfStates() {
return 6;
}

}

class JavaMOPAgent_1RuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager JavaMOPAgent_1MapManager;
static {
JavaMOPAgent_1MapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
JavaMOPAgent_1MapManager.start();
}

// Declarations for the Lock 
static final ReentrantLock JavaMOPAgent_1_RVMLock = new ReentrantLock();
static final Condition JavaMOPAgent_1_RVMLock_cond = JavaMOPAgent_1_RVMLock.newCondition();

// Declarations for Timestamps 
private static long SafeIterator_timestamp = 1;
private static long UnsafeIterator_timestamp = 1;
private static long SafeSyncCollection_timestamp = 1;
private static long SafeFile_timestamp = 1;
private static long UnsafeMapIterator_timestamp = 1;
private static long SafeEnum_timestamp = 1;
private static long SafeSyncMap_timestamp = 1;
private static long SafeMapIterator_timestamp = 1;

private static boolean FileClose_activated = false;
private static boolean HasNext_activated = false;
private static boolean MsgDigest_activated = false;
private static boolean SafeEnum_activated = false;
private static boolean SafeFile_activated = false;
private static boolean SafeFileWriter_activated = false;
private static boolean SafeHashSet_activated = false;
private static boolean SafeIterator_activated = false;
private static boolean SafeMapIterator_activated = false;
private static boolean SafeSyncCollection_activated = false;
private static boolean SafeSyncMap_activated = false;
private static boolean UnsafeIterator_activated = false;
private static boolean UnsafeMapIterator_activated = false;

// Declarations for Indexing Trees 
private static Object FileClose_f_Map_cachekey_f;
private static FileCloseMonitor FileClose_f_Map_cachevalue;
private static final FileCloseMonitor_Set FileClose__Map = new FileCloseMonitor_Set() ;
private static final MapOfMonitor<FileCloseMonitor> FileClose_f_Map = new MapOfMonitor<FileCloseMonitor>(0) ;

private static Object HasNext_i_Map_cachekey_i;
private static HasNextMonitor HasNext_i_Map_cachevalue;
private static final MapOfMonitor<HasNextMonitor> HasNext_i_Map = new MapOfMonitor<HasNextMonitor>(0) ;

private static Object MsgDigest_P_Map_cachekey_P;
private static MsgDigestMonitor MsgDigest_P_Map_cachevalue;
private static final MapOfMonitor<MsgDigestMonitor> MsgDigest_P_Map = new MapOfMonitor<MsgDigestMonitor>(0) ;

private static Object SafeEnum_e_Map_cachekey_e;
private static Tuple2<SafeEnumMonitor_Set, SafeEnumMonitor> SafeEnum_e_Map_cachevalue;
private static Object SafeEnum_v_Map_cachekey_v;
private static Tuple3<MapOfMonitor<SafeEnumMonitor>, SafeEnumMonitor_Set, SafeEnumMonitor> SafeEnum_v_Map_cachevalue;
private static Object SafeEnum_v_e_Map_cachekey_e;
private static Object SafeEnum_v_e_Map_cachekey_v;
private static SafeEnumMonitor SafeEnum_v_e_Map_cachevalue;
private static final MapOfAll<MapOfMonitor<SafeEnumMonitor>, SafeEnumMonitor_Set, SafeEnumMonitor> SafeEnum_v_e_Map = new MapOfAll<MapOfMonitor<SafeEnumMonitor>, SafeEnumMonitor_Set, SafeEnumMonitor>(0) ;
private static final MapOfSetMonitor<SafeEnumMonitor_Set, SafeEnumMonitor> SafeEnum_e_Map = new MapOfSetMonitor<SafeEnumMonitor_Set, SafeEnumMonitor>(1) ;

private static Object SafeFile_f_t_Map_cachekey_f;
private static Object SafeFile_f_t_Map_cachekey_t;
private static SafeFileMonitor SafeFile_f_t_Map_cachevalue;
private static Object SafeFile_t_Map_cachekey_t;
private static Tuple2<SafeFileMonitor_Set, SafeFileMonitor> SafeFile_t_Map_cachevalue;
private static final MapOfSetMonitor<SafeFileMonitor_Set, SafeFileMonitor> SafeFile_t_Map = new MapOfSetMonitor<SafeFileMonitor_Set, SafeFileMonitor>(1) ;
private static final MapOfMap<MapOfMonitor<SafeFileMonitor>> SafeFile_f_t_Map = new MapOfMap<MapOfMonitor<SafeFileMonitor>>(0) ;

private static Object SafeFileWriter_f_Map_cachekey_f;
private static SafeFileWriterMonitor SafeFileWriter_f_Map_cachevalue;
private static final MapOfMonitor<SafeFileWriterMonitor> SafeFileWriter_f_Map = new MapOfMonitor<SafeFileWriterMonitor>(0) ;

private static Object SafeHashSet_t_o_Map_cachekey_o;
private static Object SafeHashSet_t_o_Map_cachekey_t;
private static SafeHashSetMonitor SafeHashSet_t_o_Map_cachevalue;
private static final MapOfMap<MapOfMonitor<SafeHashSetMonitor>> SafeHashSet_t_o_Map = new MapOfMap<MapOfMonitor<SafeHashSetMonitor>>(0) ;

private static Object SafeIterator_c_Map_cachekey_c;
private static Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> SafeIterator_c_Map_cachevalue;
private static Object SafeIterator_c_i_Map_cachekey_c;
private static Object SafeIterator_c_i_Map_cachekey_i;
private static SafeIteratorMonitor SafeIterator_c_i_Map_cachevalue;
private static Object SafeIterator_i_Map_cachekey_i;
private static Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor> SafeIterator_i_Map_cachevalue;
private static final MapOfAll<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> SafeIterator_c_i_Map = new MapOfAll<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor>(0) ;
private static final MapOfSetMonitor<SafeIteratorMonitor_Set, SafeIteratorMonitor> SafeIterator_i_Map = new MapOfSetMonitor<SafeIteratorMonitor_Set, SafeIteratorMonitor>(1) ;
private static final Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor> SafeIterator___To__c_Map = new Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor>(new SafeIteratorMonitor_Set() , null) ;

private static Object SafeMapIterator_c_i_Map_cachekey_c;
private static Object SafeMapIterator_c_i_Map_cachekey_i;
private static Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_c_i_Map_cachevalue;
private static Object SafeMapIterator_i_Map_cachekey_i;
private static Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_i_Map_cachevalue;
private static Object SafeMapIterator_map_Map_cachekey_map;
private static Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_map_Map_cachevalue;
private static Object SafeMapIterator_map_c_Map_cachekey_c;
private static Object SafeMapIterator_map_c_Map_cachekey_map;
private static Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_map_c_Map_cachevalue;
private static Object SafeMapIterator_map_c_i_Map_cachekey_c;
private static Object SafeMapIterator_map_c_i_Map_cachekey_i;
private static Object SafeMapIterator_map_c_i_Map_cachekey_map;
private static ISafeMapIteratorMonitor SafeMapIterator_map_c_i_Map_cachevalue;
private static Object SafeMapIterator_map_i_Map_cachekey_i;
private static Object SafeMapIterator_map_i_Map_cachekey_map;
private static Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> SafeMapIterator_map_i_Map_cachevalue;
private static final MapOfAll<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_map_c_i_Map = new MapOfAll<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(0) ;
private static final MapOfMap<MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>> SafeMapIterator_map_i_Map = new MapOfMap<MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>>(0) ;
private static final MapOfMap<MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>> SafeMapIterator_c_i_Map = new MapOfMap<MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>>(1) ;
private static final MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_i_Map = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(2) ;
private static Object SafeMapIterator_c__To__c_i_Map_cachekey_c;
private static Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_c__To__c_i_Map_cachevalue;
private static Object SafeMapIterator_c__To__map_c_Map_cachekey_c;
private static Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_c__To__map_c_Map_cachevalue;
private static final Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator___To__c_i_Map = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(new SafeMapIteratorMonitor_Set() , null) ;
private static final Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator___To__map_Map = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(new SafeMapIteratorMonitor_Set() , null) ;
private static final MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_c__To__c_i_Map = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ;
private static final Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator___To__map_c_Map = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(new SafeMapIteratorMonitor_Set() , null) ;
private static final MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> SafeMapIterator_c__To__map_c_Map = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ;

private static Object SafeSyncCollection_c_Map_cachekey_c;
private static Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> SafeSyncCollection_c_Map_cachevalue;
private static Object SafeSyncCollection_c_iter_Map_cachekey_c;
private static Object SafeSyncCollection_c_iter_Map_cachekey_iter;
private static ISafeSyncCollectionMonitor SafeSyncCollection_c_iter_Map_cachevalue;
private static Object SafeSyncCollection_iter_Map_cachekey_iter;
private static Tuple2<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor> SafeSyncCollection_iter_Map_cachevalue;
private static final MapOfAll<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> SafeSyncCollection_c_iter_Map = new MapOfAll<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor>(0) ;
private static final MapOfSetMonitor<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor> SafeSyncCollection_iter_Map = new MapOfSetMonitor<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor>(1) ;

private static Object SafeSyncMap_iter_Map_cachekey_iter;
private static Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> SafeSyncMap_iter_Map_cachevalue;
private static Object SafeSyncMap_mapSet_iter_Map_cachekey_iter;
private static Object SafeSyncMap_mapSet_iter_Map_cachekey_mapSet;
private static Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> SafeSyncMap_mapSet_iter_Map_cachevalue;
private static Object SafeSyncMap_syncMap_Map_cachekey_syncMap;
private static Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> SafeSyncMap_syncMap_Map_cachevalue;
private static Object SafeSyncMap_syncMap_mapSet_Map_cachekey_mapSet;
private static Object SafeSyncMap_syncMap_mapSet_Map_cachekey_syncMap;
private static Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> SafeSyncMap_syncMap_mapSet_Map_cachevalue;
private static Object SafeSyncMap_syncMap_mapSet_iter_Map_cachekey_iter;
private static Object SafeSyncMap_syncMap_mapSet_iter_Map_cachekey_mapSet;
private static Object SafeSyncMap_syncMap_mapSet_iter_Map_cachekey_syncMap;
private static ISafeSyncMapMonitor SafeSyncMap_syncMap_mapSet_iter_Map_cachevalue;
private static final MapOfMap<MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>> SafeSyncMap_mapSet_iter_Map = new MapOfMap<MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>>(1) ;
private static final MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> SafeSyncMap_iter_Map = new MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(2) ;
private static final MapOfAll<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> SafeSyncMap_syncMap_mapSet_iter_Map = new MapOfAll<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor>(0) ;
private static Object SafeSyncMap_mapSet__To__syncMap_mapSet_Map_cachekey_mapSet;
private static Tuple2<SafeSyncMapMonitor_Set, SafeSyncMapMonitor> SafeSyncMap_mapSet__To__syncMap_mapSet_Map_cachevalue;
private static final MapOfSetMonitor<SafeSyncMapMonitor_Set, SafeSyncMapMonitor> SafeSyncMap_mapSet__To__syncMap_mapSet_Map = new MapOfSetMonitor<SafeSyncMapMonitor_Set, SafeSyncMapMonitor>(1) ;

private static Object UnsafeIterator_c_Map_cachekey_c;
private static Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> UnsafeIterator_c_Map_cachevalue;
private static Object UnsafeIterator_c_i_Map_cachekey_c;
private static Object UnsafeIterator_c_i_Map_cachekey_i;
private static UnsafeIteratorMonitor UnsafeIterator_c_i_Map_cachevalue;
private static Object UnsafeIterator_i_Map_cachekey_i;
private static Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> UnsafeIterator_i_Map_cachevalue;
private static final MapOfAll<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> UnsafeIterator_c_i_Map = new MapOfAll<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>(0) ;
private static final MapOfSetMonitor<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> UnsafeIterator_i_Map = new MapOfSetMonitor<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>(1) ;

private static Object UnsafeMapIterator_c_i_Map_cachekey_c;
private static Object UnsafeMapIterator_c_i_Map_cachekey_i;
private static Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_c_i_Map_cachevalue;
private static Object UnsafeMapIterator_i_Map_cachekey_i;
private static Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_i_Map_cachevalue;
private static Object UnsafeMapIterator_map_Map_cachekey_map;
private static Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_map_Map_cachevalue;
private static Object UnsafeMapIterator_map_c_Map_cachekey_c;
private static Object UnsafeMapIterator_map_c_Map_cachekey_map;
private static Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_map_c_Map_cachevalue;
private static Object UnsafeMapIterator_map_c_i_Map_cachekey_c;
private static Object UnsafeMapIterator_map_c_i_Map_cachekey_i;
private static Object UnsafeMapIterator_map_c_i_Map_cachekey_map;
private static IUnsafeMapIteratorMonitor UnsafeMapIterator_map_c_i_Map_cachevalue;
private static final MapOfAll<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_map_c_i_Map = new MapOfAll<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(0) ;
private static final MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_i_Map = new MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(2) ;
private static final MapOfMap<MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>> UnsafeMapIterator_c_i_Map = new MapOfMap<MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>>(1) ;
private static Object UnsafeMapIterator_c__To__map_c_Map_cachekey_c;
private static Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_c__To__map_c_Map_cachevalue;
private static final MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> UnsafeMapIterator_c__To__map_c_Map = new MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ;


public static int cleanUp() {
int collected = 0;
// indexing trees
collected += FileClose_f_Map.cleanUpUnnecessaryMappings();
collected += HasNext_i_Map.cleanUpUnnecessaryMappings();
collected += MsgDigest_P_Map.cleanUpUnnecessaryMappings();
collected += SafeEnum_v_e_Map.cleanUpUnnecessaryMappings();
collected += SafeEnum_e_Map.cleanUpUnnecessaryMappings();
collected += SafeFile_t_Map.cleanUpUnnecessaryMappings();
collected += SafeFile_f_t_Map.cleanUpUnnecessaryMappings();
collected += SafeFileWriter_f_Map.cleanUpUnnecessaryMappings();
collected += SafeHashSet_t_o_Map.cleanUpUnnecessaryMappings();
collected += SafeIterator_c_i_Map.cleanUpUnnecessaryMappings();
collected += SafeIterator_i_Map.cleanUpUnnecessaryMappings();
collected += SafeMapIterator_map_c_i_Map.cleanUpUnnecessaryMappings();
collected += SafeMapIterator_map_i_Map.cleanUpUnnecessaryMappings();
collected += SafeMapIterator_c_i_Map.cleanUpUnnecessaryMappings();
collected += SafeMapIterator_i_Map.cleanUpUnnecessaryMappings();
collected += SafeMapIterator_c__To__c_i_Map.cleanUpUnnecessaryMappings();
collected += SafeMapIterator_c__To__map_c_Map.cleanUpUnnecessaryMappings();
collected += SafeSyncCollection_c_iter_Map.cleanUpUnnecessaryMappings();
collected += SafeSyncCollection_iter_Map.cleanUpUnnecessaryMappings();
collected += SafeSyncMap_mapSet_iter_Map.cleanUpUnnecessaryMappings();
collected += SafeSyncMap_iter_Map.cleanUpUnnecessaryMappings();
collected += SafeSyncMap_syncMap_mapSet_iter_Map.cleanUpUnnecessaryMappings();
collected += SafeSyncMap_mapSet__To__syncMap_mapSet_Map.cleanUpUnnecessaryMappings();
collected += UnsafeIterator_c_i_Map.cleanUpUnnecessaryMappings();
collected += UnsafeIterator_i_Map.cleanUpUnnecessaryMappings();
collected += UnsafeMapIterator_map_c_i_Map.cleanUpUnnecessaryMappings();
collected += UnsafeMapIterator_i_Map.cleanUpUnnecessaryMappings();
collected += UnsafeMapIterator_c_i_Map.cleanUpUnnecessaryMappings();
collected += UnsafeMapIterator_c__To__map_c_Map.cleanUpUnnecessaryMappings();
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

public static final void FileClose_writeEvent(FileWriter f) {
FileClose_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_f = null;
MapOfMonitor<FileCloseMonitor> matchedLastMap = null;
FileCloseMonitor matchedEntry = null;
boolean cachehit = false;
if ((f == FileClose_f_Map_cachekey_f) ) {
	matchedEntry = FileClose_f_Map_cachevalue;
	cachehit = true;
}
else {
	wr_f = new CachedWeakReference(f) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<FileCloseMonitor> itmdMap = FileClose_f_Map;
		matchedLastMap = itmdMap;
		FileCloseMonitor node_f = FileClose_f_Map.getNodeEquivalent(wr_f) ;
		matchedEntry = node_f;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_f == null) ) {
		wr_f = new CachedWeakReference(f) ;
	}
	// D(X) main:4
	FileCloseMonitor created = new FileCloseMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_f, created) ;
	// D(X) defineNew:5 for <>
	{
		// InsertMonitor
		FileCloseMonitor_Set targetSet = FileClose__Map;
		targetSet.add(created) ;
	}
}
// D(X) main:8--9
final FileCloseMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_write(f);
if(matchedEntryfinalMonitor.FileCloseMonitor_Prop_1_Category_fail) {
matchedEntryfinalMonitor.Prop_1_handler_fail();
}

if ((cachehit == false) ) {
	FileClose_f_Map_cachekey_f = f;
	FileClose_f_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void FileClose_closeEvent(FileWriter f) {
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

if (FileClose_activated) {
FileCloseMonitor matchedEntry = null;
boolean cachehit = false;
if ((f == FileClose_f_Map_cachekey_f) ) {
	matchedEntry = FileClose_f_Map_cachevalue;
	cachehit = true;
}
else {
	// FindEntry
	FileCloseMonitor node_f = FileClose_f_Map.getNodeWithStrongRef(f) ;
	matchedEntry = node_f;
}
// D(X) main:8--9
if ((matchedEntry != null) ) {
	final FileCloseMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_close(f);
if(matchedEntryfinalMonitor.FileCloseMonitor_Prop_1_Category_fail) {
matchedEntryfinalMonitor.Prop_1_handler_fail();
}

	if ((cachehit == false) ) {
		FileClose_f_Map_cachekey_f = f;
		FileClose_f_Map_cachevalue = matchedEntry;
	}
}

}

JavaMOPAgent_1_RVMLock.unlock();
}

public static final void FileClose_endProgEvent() {
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

if (FileClose_activated) {
FileCloseMonitor_Set matchedEntry = null;
{
	// FindEntry
	matchedEntry = FileClose__Map;
}
// D(X) main:8--9
if ((matchedEntry != null) ) {
	matchedEntry.event_endProg();

}

}

JavaMOPAgent_1_RVMLock.unlock();
}

public static final void HasNext_createEvent(Collection c, Iterator i) {
HasNext_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_i = null;
MapOfMonitor<HasNextMonitor> matchedLastMap = null;
HasNextMonitor matchedEntry = null;
boolean cachehit = false;
if ((i == HasNext_i_Map_cachekey_i) ) {
	matchedEntry = HasNext_i_Map_cachevalue;
	cachehit = true;
}
else {
	wr_i = new CachedWeakReference(i) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<HasNextMonitor> itmdMap = HasNext_i_Map;
		matchedLastMap = itmdMap;
		HasNextMonitor node_i = HasNext_i_Map.getNodeEquivalent(wr_i) ;
		matchedEntry = node_i;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_i == null) ) {
		wr_i = new CachedWeakReference(i) ;
	}
	// D(X) main:4
	HasNextMonitor created = new HasNextMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_i, created) ;
}
// D(X) main:8--9
final HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_create(c, i);
if(matchedEntryfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
matchedEntryfinalMonitor.Prop_1_handler_fail();
}

if ((cachehit == false) ) {
	HasNext_i_Map_cachekey_i = i;
	HasNext_i_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void HasNext_hasnextEvent(Iterator i) {
HasNext_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_i = null;
MapOfMonitor<HasNextMonitor> matchedLastMap = null;
HasNextMonitor matchedEntry = null;
boolean cachehit = false;
if ((i == HasNext_i_Map_cachekey_i) ) {
	matchedEntry = HasNext_i_Map_cachevalue;
	cachehit = true;
}
else {
	wr_i = new CachedWeakReference(i) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<HasNextMonitor> itmdMap = HasNext_i_Map;
		matchedLastMap = itmdMap;
		HasNextMonitor node_i = HasNext_i_Map.getNodeEquivalent(wr_i) ;
		matchedEntry = node_i;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_i == null) ) {
		wr_i = new CachedWeakReference(i) ;
	}
	// D(X) main:4
	HasNextMonitor created = new HasNextMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_i, created) ;
}
// D(X) main:8--9
final HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_hasnext(i);
if(matchedEntryfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
matchedEntryfinalMonitor.Prop_1_handler_fail();
}

if ((cachehit == false) ) {
	HasNext_i_Map_cachekey_i = i;
	HasNext_i_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void HasNext_nextEvent(Iterator i) {
HasNext_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_i = null;
MapOfMonitor<HasNextMonitor> matchedLastMap = null;
HasNextMonitor matchedEntry = null;
boolean cachehit = false;
if ((i == HasNext_i_Map_cachekey_i) ) {
	matchedEntry = HasNext_i_Map_cachevalue;
	cachehit = true;
}
else {
	wr_i = new CachedWeakReference(i) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<HasNextMonitor> itmdMap = HasNext_i_Map;
		matchedLastMap = itmdMap;
		HasNextMonitor node_i = HasNext_i_Map.getNodeEquivalent(wr_i) ;
		matchedEntry = node_i;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_i == null) ) {
		wr_i = new CachedWeakReference(i) ;
	}
	// D(X) main:4
	HasNextMonitor created = new HasNextMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_i, created) ;
}
// D(X) main:8--9
final HasNextMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_next(i);
if(matchedEntryfinalMonitor.HasNextMonitor_Prop_1_Category_fail) {
matchedEntryfinalMonitor.Prop_1_handler_fail();
}

if ((cachehit == false) ) {
	HasNext_i_Map_cachekey_i = i;
	HasNext_i_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeHashSet_addEvent(HashSet t, Object o) {
SafeHashSet_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_t = null;
CachedWeakReference wr_o = null;
MapOfMonitor<SafeHashSetMonitor> matchedLastMap = null;
SafeHashSetMonitor matchedEntry = null;
boolean cachehit = false;
if (((o == SafeHashSet_t_o_Map_cachekey_o) && (t == SafeHashSet_t_o_Map_cachekey_t) ) ) {
	matchedEntry = SafeHashSet_t_o_Map_cachevalue;
	cachehit = true;
}
else {
	wr_t = new CachedWeakReference(t) ;
	wr_o = new CachedWeakReference(o) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<SafeHashSetMonitor> node_t = SafeHashSet_t_o_Map.getNodeEquivalent(wr_t) ;
		if ((node_t == null) ) {
			node_t = new MapOfMonitor<SafeHashSetMonitor>(1) ;
			SafeHashSet_t_o_Map.putNode(wr_t, node_t) ;
		}
		matchedLastMap = node_t;
		SafeHashSetMonitor node_t_o = node_t.getNodeEquivalent(wr_o) ;
		matchedEntry = node_t_o;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_t == null) ) {
		wr_t = new CachedWeakReference(t) ;
	}
	if ((wr_o == null) ) {
		wr_o = new CachedWeakReference(o) ;
	}
	// D(X) main:4
	SafeHashSetMonitor created = new SafeHashSetMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_o, created) ;
}
// D(X) main:8--9
final SafeHashSetMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_add(t, o);
if(matchedEntryfinalMonitor.SafeHashSetMonitor_Prop_1_Category_match) {
matchedEntryfinalMonitor.Prop_1_handler_match();
}

if ((cachehit == false) ) {
	SafeHashSet_t_o_Map_cachekey_o = o;
	SafeHashSet_t_o_Map_cachekey_t = t;
	SafeHashSet_t_o_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeHashSet_unsafe_containsEvent(HashSet t, Object o) {
SafeHashSet_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_t = null;
CachedWeakReference wr_o = null;
MapOfMonitor<SafeHashSetMonitor> matchedLastMap = null;
SafeHashSetMonitor matchedEntry = null;
boolean cachehit = false;
if (((o == SafeHashSet_t_o_Map_cachekey_o) && (t == SafeHashSet_t_o_Map_cachekey_t) ) ) {
	matchedEntry = SafeHashSet_t_o_Map_cachevalue;
	cachehit = true;
}
else {
	wr_t = new CachedWeakReference(t) ;
	wr_o = new CachedWeakReference(o) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<SafeHashSetMonitor> node_t = SafeHashSet_t_o_Map.getNodeEquivalent(wr_t) ;
		if ((node_t == null) ) {
			node_t = new MapOfMonitor<SafeHashSetMonitor>(1) ;
			SafeHashSet_t_o_Map.putNode(wr_t, node_t) ;
		}
		matchedLastMap = node_t;
		SafeHashSetMonitor node_t_o = node_t.getNodeEquivalent(wr_o) ;
		matchedEntry = node_t_o;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_t == null) ) {
		wr_t = new CachedWeakReference(t) ;
	}
	if ((wr_o == null) ) {
		wr_o = new CachedWeakReference(o) ;
	}
	// D(X) main:4
	SafeHashSetMonitor created = new SafeHashSetMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_o, created) ;
}
// D(X) main:8--9
final SafeHashSetMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_unsafe_contains(t, o);
if(matchedEntryfinalMonitor.SafeHashSetMonitor_Prop_1_Category_match) {
matchedEntryfinalMonitor.Prop_1_handler_match();
}

if ((cachehit == false) ) {
	SafeHashSet_t_o_Map_cachekey_o = o;
	SafeHashSet_t_o_Map_cachekey_t = t;
	SafeHashSet_t_o_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeHashSet_removeEvent(HashSet t, Object o) {
SafeHashSet_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_t = null;
CachedWeakReference wr_o = null;
MapOfMonitor<SafeHashSetMonitor> matchedLastMap = null;
SafeHashSetMonitor matchedEntry = null;
boolean cachehit = false;
if (((o == SafeHashSet_t_o_Map_cachekey_o) && (t == SafeHashSet_t_o_Map_cachekey_t) ) ) {
	matchedEntry = SafeHashSet_t_o_Map_cachevalue;
	cachehit = true;
}
else {
	wr_t = new CachedWeakReference(t) ;
	wr_o = new CachedWeakReference(o) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<SafeHashSetMonitor> node_t = SafeHashSet_t_o_Map.getNodeEquivalent(wr_t) ;
		if ((node_t == null) ) {
			node_t = new MapOfMonitor<SafeHashSetMonitor>(1) ;
			SafeHashSet_t_o_Map.putNode(wr_t, node_t) ;
		}
		matchedLastMap = node_t;
		SafeHashSetMonitor node_t_o = node_t.getNodeEquivalent(wr_o) ;
		matchedEntry = node_t_o;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_t == null) ) {
		wr_t = new CachedWeakReference(t) ;
	}
	if ((wr_o == null) ) {
		wr_o = new CachedWeakReference(o) ;
	}
	// D(X) main:4
	SafeHashSetMonitor created = new SafeHashSetMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_o, created) ;
}
// D(X) main:8--9
final SafeHashSetMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_remove(t, o);
if(matchedEntryfinalMonitor.SafeHashSetMonitor_Prop_1_Category_match) {
matchedEntryfinalMonitor.Prop_1_handler_match();
}

if ((cachehit == false) ) {
	SafeHashSet_t_o_Map_cachekey_o = o;
	SafeHashSet_t_o_Map_cachekey_t = t;
	SafeHashSet_t_o_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void MsgDigest_getInstanceEvent(MessageDigest P) {
MsgDigest_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_P = null;
MapOfMonitor<MsgDigestMonitor> matchedLastMap = null;
MsgDigestMonitor matchedEntry = null;
boolean cachehit = false;
if ((P == MsgDigest_P_Map_cachekey_P) ) {
	matchedEntry = MsgDigest_P_Map_cachevalue;
	cachehit = true;
}
else {
	wr_P = new CachedWeakReference(P) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<MsgDigestMonitor> itmdMap = MsgDigest_P_Map;
		matchedLastMap = itmdMap;
		MsgDigestMonitor node_P = MsgDigest_P_Map.getNodeEquivalent(wr_P) ;
		matchedEntry = node_P;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_P == null) ) {
		wr_P = new CachedWeakReference(P) ;
	}
	// D(X) main:4
	MsgDigestMonitor created = new MsgDigestMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_P, created) ;
}
// D(X) main:8--9
final MsgDigestMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_getInstance(P);
if(matchedEntryfinalMonitor.MsgDigestMonitor_Prop_1_Category_fail) {
matchedEntryfinalMonitor.Prop_1_handler_fail();
}

if ((cachehit == false) ) {
	MsgDigest_P_Map_cachekey_P = P;
	MsgDigest_P_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void MsgDigest_updateEvent(MessageDigest P) {
MsgDigest_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_P = null;
MapOfMonitor<MsgDigestMonitor> matchedLastMap = null;
MsgDigestMonitor matchedEntry = null;
boolean cachehit = false;
if ((P == MsgDigest_P_Map_cachekey_P) ) {
	matchedEntry = MsgDigest_P_Map_cachevalue;
	cachehit = true;
}
else {
	wr_P = new CachedWeakReference(P) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<MsgDigestMonitor> itmdMap = MsgDigest_P_Map;
		matchedLastMap = itmdMap;
		MsgDigestMonitor node_P = MsgDigest_P_Map.getNodeEquivalent(wr_P) ;
		matchedEntry = node_P;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_P == null) ) {
		wr_P = new CachedWeakReference(P) ;
	}
	// D(X) main:4
	MsgDigestMonitor created = new MsgDigestMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_P, created) ;
}
// D(X) main:8--9
final MsgDigestMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_update(P);
if(matchedEntryfinalMonitor.MsgDigestMonitor_Prop_1_Category_fail) {
matchedEntryfinalMonitor.Prop_1_handler_fail();
}

if ((cachehit == false) ) {
	MsgDigest_P_Map_cachekey_P = P;
	MsgDigest_P_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void MsgDigest_resetEvent(MessageDigest P) {
MsgDigest_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_P = null;
MapOfMonitor<MsgDigestMonitor> matchedLastMap = null;
MsgDigestMonitor matchedEntry = null;
boolean cachehit = false;
if ((P == MsgDigest_P_Map_cachekey_P) ) {
	matchedEntry = MsgDigest_P_Map_cachevalue;
	cachehit = true;
}
else {
	wr_P = new CachedWeakReference(P) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<MsgDigestMonitor> itmdMap = MsgDigest_P_Map;
		matchedLastMap = itmdMap;
		MsgDigestMonitor node_P = MsgDigest_P_Map.getNodeEquivalent(wr_P) ;
		matchedEntry = node_P;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_P == null) ) {
		wr_P = new CachedWeakReference(P) ;
	}
	// D(X) main:4
	MsgDigestMonitor created = new MsgDigestMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_P, created) ;
}
// D(X) main:8--9
final MsgDigestMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_reset(P);
if(matchedEntryfinalMonitor.MsgDigestMonitor_Prop_1_Category_fail) {
matchedEntryfinalMonitor.Prop_1_handler_fail();
}

if ((cachehit == false) ) {
	MsgDigest_P_Map_cachekey_P = P;
	MsgDigest_P_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void MsgDigest_digestEvent(MessageDigest P) {
MsgDigest_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_P = null;
MapOfMonitor<MsgDigestMonitor> matchedLastMap = null;
MsgDigestMonitor matchedEntry = null;
boolean cachehit = false;
if ((P == MsgDigest_P_Map_cachekey_P) ) {
	matchedEntry = MsgDigest_P_Map_cachevalue;
	cachehit = true;
}
else {
	wr_P = new CachedWeakReference(P) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<MsgDigestMonitor> itmdMap = MsgDigest_P_Map;
		matchedLastMap = itmdMap;
		MsgDigestMonitor node_P = MsgDigest_P_Map.getNodeEquivalent(wr_P) ;
		matchedEntry = node_P;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_P == null) ) {
		wr_P = new CachedWeakReference(P) ;
	}
	// D(X) main:4
	MsgDigestMonitor created = new MsgDigestMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_P, created) ;
}
// D(X) main:8--9
final MsgDigestMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_digest(P);
if(matchedEntryfinalMonitor.MsgDigestMonitor_Prop_1_Category_fail) {
matchedEntryfinalMonitor.Prop_1_handler_fail();
}

if ((cachehit == false) ) {
	MsgDigest_P_Map_cachekey_P = P;
	MsgDigest_P_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeEnum_createEvent(Vector v, Enumeration e) {
SafeEnum_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_e = null;
CachedWeakReference wr_v = null;
MapOfMonitor<SafeEnumMonitor> matchedLastMap = null;
SafeEnumMonitor matchedEntry = null;
boolean cachehit = false;
if (((e == SafeEnum_v_e_Map_cachekey_e) && (v == SafeEnum_v_e_Map_cachekey_v) ) ) {
	matchedEntry = SafeEnum_v_e_Map_cachevalue;
	cachehit = true;
}
else {
	wr_v = new CachedWeakReference(v) ;
	wr_e = new CachedWeakReference(e) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfMonitor<SafeEnumMonitor>, SafeEnumMonitor_Set, SafeEnumMonitor> node_v = SafeEnum_v_e_Map.getNodeEquivalent(wr_v) ;
		if ((node_v == null) ) {
			node_v = new Tuple3<MapOfMonitor<SafeEnumMonitor>, SafeEnumMonitor_Set, SafeEnumMonitor>() ;
			SafeEnum_v_e_Map.putNode(wr_v, node_v) ;
			node_v.setValue1(new MapOfMonitor<SafeEnumMonitor>(1) ) ;
			node_v.setValue2(new SafeEnumMonitor_Set() ) ;
		}
		MapOfMonitor<SafeEnumMonitor> itmdMap = node_v.getValue1() ;
		matchedLastMap = itmdMap;
		SafeEnumMonitor node_v_e = node_v.getValue1() .getNodeEquivalent(wr_e) ;
		matchedEntry = node_v_e;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_v == null) ) {
		wr_v = new CachedWeakReference(v) ;
	}
	if ((wr_e == null) ) {
		wr_e = new CachedWeakReference(e) ;
	}
	if ((matchedEntry == null) ) {
		// D(X) main:4
		SafeEnumMonitor created = new SafeEnumMonitor(SafeEnum_timestamp++) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = true;

		matchedEntry = created;
		matchedLastMap.putNode(wr_e, created) ;
		// D(X) defineNew:5 for <e>
		{
			// InsertMonitor
			Tuple2<SafeEnumMonitor_Set, SafeEnumMonitor> node_e = SafeEnum_e_Map.getNodeEquivalent(wr_e) ;
			if ((node_e == null) ) {
				node_e = new Tuple2<SafeEnumMonitor_Set, SafeEnumMonitor>() ;
				SafeEnum_e_Map.putNode(wr_e, node_e) ;
				node_e.setValue1(new SafeEnumMonitor_Set() ) ;
			}
			SafeEnumMonitor_Set targetSet = node_e.getValue1() ;
			targetSet.add(created) ;
		}
		// D(X) defineNew:5 for <v>
		{
			// InsertMonitor
			Tuple3<MapOfMonitor<SafeEnumMonitor>, SafeEnumMonitor_Set, SafeEnumMonitor> node_v = SafeEnum_v_e_Map.getNodeEquivalent(wr_v) ;
			if ((node_v == null) ) {
				node_v = new Tuple3<MapOfMonitor<SafeEnumMonitor>, SafeEnumMonitor_Set, SafeEnumMonitor>() ;
				SafeEnum_v_e_Map.putNode(wr_v, node_v) ;
				node_v.setValue1(new MapOfMonitor<SafeEnumMonitor>(1) ) ;
				node_v.setValue2(new SafeEnumMonitor_Set() ) ;
			}
			SafeEnumMonitor_Set targetSet = node_v.getValue2() ;
			targetSet.add(created) ;
		}
	}
	// D(X) main:6
	matchedEntry.setDisable(SafeEnum_timestamp++) ;
}
// D(X) main:8--9
final SafeEnumMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_create(v, e);
if(matchedEntryfinalMonitor.SafeEnumMonitor_Prop_1_Category_match) {
matchedEntryfinalMonitor.Prop_1_handler_match();
}

if ((cachehit == false) ) {
	SafeEnum_v_e_Map_cachekey_e = e;
	SafeEnum_v_e_Map_cachekey_v = v;
	SafeEnum_v_e_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeEnum_updatesourceEvent(Vector v) {
SafeEnum_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_v = null;
Tuple3<MapOfMonitor<SafeEnumMonitor>, SafeEnumMonitor_Set, SafeEnumMonitor> matchedEntry = null;
boolean cachehit = false;
if ((v == SafeEnum_v_Map_cachekey_v) ) {
	matchedEntry = SafeEnum_v_Map_cachevalue;
	cachehit = true;
}
else {
	wr_v = new CachedWeakReference(v) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfMonitor<SafeEnumMonitor>, SafeEnumMonitor_Set, SafeEnumMonitor> node_v = SafeEnum_v_e_Map.getNodeEquivalent(wr_v) ;
		if ((node_v == null) ) {
			node_v = new Tuple3<MapOfMonitor<SafeEnumMonitor>, SafeEnumMonitor_Set, SafeEnumMonitor>() ;
			SafeEnum_v_e_Map.putNode(wr_v, node_v) ;
			node_v.setValue1(new MapOfMonitor<SafeEnumMonitor>(1) ) ;
			node_v.setValue2(new SafeEnumMonitor_Set() ) ;
		}
		matchedEntry = node_v;
	}
}
// D(X) main:1
SafeEnumMonitor matchedLeaf = matchedEntry.getValue3() ;
if ((matchedLeaf == null) ) {
	if ((wr_v == null) ) {
		wr_v = new CachedWeakReference(v) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeEnumMonitor created = new SafeEnumMonitor(SafeEnum_timestamp++) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue3(created) ;
		SafeEnumMonitor_Set enclosingSet = matchedEntry.getValue2() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	SafeEnumMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
	disableUpdatedLeaf.setDisable(SafeEnum_timestamp++) ;
}
// D(X) main:8--9
SafeEnumMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
stateTransitionedSet.event_updatesource(v);

if ((cachehit == false) ) {
	SafeEnum_v_Map_cachekey_v = v;
	SafeEnum_v_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeEnum_nextEvent(Enumeration e) {
SafeEnum_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_e = null;
Tuple2<SafeEnumMonitor_Set, SafeEnumMonitor> matchedEntry = null;
boolean cachehit = false;
if ((e == SafeEnum_e_Map_cachekey_e) ) {
	matchedEntry = SafeEnum_e_Map_cachevalue;
	cachehit = true;
}
else {
	wr_e = new CachedWeakReference(e) ;
	{
		// FindOrCreateEntry
		Tuple2<SafeEnumMonitor_Set, SafeEnumMonitor> node_e = SafeEnum_e_Map.getNodeEquivalent(wr_e) ;
		if ((node_e == null) ) {
			node_e = new Tuple2<SafeEnumMonitor_Set, SafeEnumMonitor>() ;
			SafeEnum_e_Map.putNode(wr_e, node_e) ;
			node_e.setValue1(new SafeEnumMonitor_Set() ) ;
		}
		matchedEntry = node_e;
	}
}
// D(X) main:1
SafeEnumMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_e == null) ) {
		wr_e = new CachedWeakReference(e) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeEnumMonitor created = new SafeEnumMonitor(SafeEnum_timestamp++) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue2(created) ;
		SafeEnumMonitor_Set enclosingSet = matchedEntry.getValue1() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	SafeEnumMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	disableUpdatedLeaf.setDisable(SafeEnum_timestamp++) ;
}
// D(X) main:8--9
SafeEnumMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_next(e);

if ((cachehit == false) ) {
	SafeEnum_e_Map_cachekey_e = e;
	SafeEnum_e_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeFile_openEvent(Thread t, FileReader f) {
SafeFile_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_t = null;
CachedWeakReference wr_f = null;
MapOfMonitor<SafeFileMonitor> matchedLastMap = null;
SafeFileMonitor matchedEntry = null;
boolean cachehit = false;
if (((f == SafeFile_f_t_Map_cachekey_f) && (t == SafeFile_f_t_Map_cachekey_t) ) ) {
	matchedEntry = SafeFile_f_t_Map_cachevalue;
	cachehit = true;
}
else {
	wr_f = new CachedWeakReference(f) ;
	wr_t = new CachedWeakReference(t) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<SafeFileMonitor> node_f = SafeFile_f_t_Map.getNodeEquivalent(wr_f) ;
		if ((node_f == null) ) {
			node_f = new MapOfMonitor<SafeFileMonitor>(1) ;
			SafeFile_f_t_Map.putNode(wr_f, node_f) ;
		}
		matchedLastMap = node_f;
		SafeFileMonitor node_f_t = node_f.getNodeEquivalent(wr_t) ;
		matchedEntry = node_f_t;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_f == null) ) {
		wr_f = new CachedWeakReference(f) ;
	}
	if ((wr_t == null) ) {
		wr_t = new CachedWeakReference(t) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <t>
		SafeFileMonitor sourceLeaf = null;
		{
			// FindCode
			Tuple2<SafeFileMonitor_Set, SafeFileMonitor> node_t = SafeFile_t_Map.getNodeEquivalent(wr_t) ;
			if ((node_t != null) ) {
				SafeFileMonitor itmdLeaf = node_t.getValue2() ;
				sourceLeaf = itmdLeaf;
			}
		}
		if ((sourceLeaf != null) ) {
			boolean definable = true;
			// D(X) defineTo:1--5 for <f, t>
			if (definable) {
				// FindCode
				MapOfMonitor<SafeFileMonitor> node_f = SafeFile_f_t_Map.getNodeEquivalent(wr_f) ;
				if ((node_f != null) ) {
					SafeFileMonitor node_f_t = node_f.getNodeEquivalent(wr_t) ;
					if ((node_f_t != null) ) {
						if (((node_f_t.getDisable() > sourceLeaf.getTau() ) || ((node_f_t.getTau() > 0) && (node_f_t.getTau() < sourceLeaf.getTau() ) ) ) ) {
							definable = false;
						}
					}
				}
			}
			if (definable) {
				// D(X) defineTo:6
				SafeFileMonitor created = (SafeFileMonitor)sourceLeaf.clone() ;
				matchedEntry = created;
				matchedLastMap.putNode(wr_t, created) ;
				// D(X) defineTo:7 for <t>
				{
					// InsertMonitor
					Tuple2<SafeFileMonitor_Set, SafeFileMonitor> node_t = SafeFile_t_Map.getNodeEquivalent(wr_t) ;
					if ((node_t == null) ) {
						node_t = new Tuple2<SafeFileMonitor_Set, SafeFileMonitor>() ;
						SafeFile_t_Map.putNode(wr_t, node_t) ;
						node_t.setValue1(new SafeFileMonitor_Set() ) ;
					}
					SafeFileMonitor_Set targetSet = node_t.getValue1() ;
					targetSet.add(created) ;
				}
			}
		}
	}
	if ((matchedEntry == null) ) {
		// D(X) main:4
		SafeFileMonitor created = new SafeFileMonitor(SafeFile_timestamp++) ;
		matchedEntry = created;
		matchedLastMap.putNode(wr_t, created) ;
		// D(X) defineNew:5 for <t>
		{
			// InsertMonitor
			Tuple2<SafeFileMonitor_Set, SafeFileMonitor> node_t = SafeFile_t_Map.getNodeEquivalent(wr_t) ;
			if ((node_t == null) ) {
				node_t = new Tuple2<SafeFileMonitor_Set, SafeFileMonitor>() ;
				SafeFile_t_Map.putNode(wr_t, node_t) ;
				node_t.setValue1(new SafeFileMonitor_Set() ) ;
			}
			SafeFileMonitor_Set targetSet = node_t.getValue1() ;
			targetSet.add(created) ;
		}
	}
	// D(X) main:6
	matchedEntry.setDisable(SafeFile_timestamp++) ;
}
// D(X) main:8--9
final SafeFileMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_open(t, f);
if(matchedEntryfinalMonitor.SafeFileMonitor_Prop_1_Category_fail) {
matchedEntryfinalMonitor.Prop_1_handler_fail();
}

if ((cachehit == false) ) {
	SafeFile_f_t_Map_cachekey_f = f;
	SafeFile_f_t_Map_cachekey_t = t;
	SafeFile_f_t_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeFile_closeEvent(FileReader f, Thread t) {
SafeFile_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_t = null;
CachedWeakReference wr_f = null;
MapOfMonitor<SafeFileMonitor> matchedLastMap = null;
SafeFileMonitor matchedEntry = null;
boolean cachehit = false;
if (((f == SafeFile_f_t_Map_cachekey_f) && (t == SafeFile_f_t_Map_cachekey_t) ) ) {
	matchedEntry = SafeFile_f_t_Map_cachevalue;
	cachehit = true;
}
else {
	wr_f = new CachedWeakReference(f) ;
	wr_t = new CachedWeakReference(t) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<SafeFileMonitor> node_f = SafeFile_f_t_Map.getNodeEquivalent(wr_f) ;
		if ((node_f == null) ) {
			node_f = new MapOfMonitor<SafeFileMonitor>(1) ;
			SafeFile_f_t_Map.putNode(wr_f, node_f) ;
		}
		matchedLastMap = node_f;
		SafeFileMonitor node_f_t = node_f.getNodeEquivalent(wr_t) ;
		matchedEntry = node_f_t;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_f == null) ) {
		wr_f = new CachedWeakReference(f) ;
	}
	if ((wr_t == null) ) {
		wr_t = new CachedWeakReference(t) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <t>
		SafeFileMonitor sourceLeaf = null;
		{
			// FindCode
			Tuple2<SafeFileMonitor_Set, SafeFileMonitor> node_t = SafeFile_t_Map.getNodeEquivalent(wr_t) ;
			if ((node_t != null) ) {
				SafeFileMonitor itmdLeaf = node_t.getValue2() ;
				sourceLeaf = itmdLeaf;
			}
		}
		if ((sourceLeaf != null) ) {
			boolean definable = true;
			// D(X) defineTo:1--5 for <f, t>
			if (definable) {
				// FindCode
				MapOfMonitor<SafeFileMonitor> node_f = SafeFile_f_t_Map.getNodeEquivalent(wr_f) ;
				if ((node_f != null) ) {
					SafeFileMonitor node_f_t = node_f.getNodeEquivalent(wr_t) ;
					if ((node_f_t != null) ) {
						if (((node_f_t.getDisable() > sourceLeaf.getTau() ) || ((node_f_t.getTau() > 0) && (node_f_t.getTau() < sourceLeaf.getTau() ) ) ) ) {
							definable = false;
						}
					}
				}
			}
			if (definable) {
				// D(X) defineTo:6
				SafeFileMonitor created = (SafeFileMonitor)sourceLeaf.clone() ;
				matchedEntry = created;
				matchedLastMap.putNode(wr_t, created) ;
				// D(X) defineTo:7 for <t>
				{
					// InsertMonitor
					Tuple2<SafeFileMonitor_Set, SafeFileMonitor> node_t = SafeFile_t_Map.getNodeEquivalent(wr_t) ;
					if ((node_t == null) ) {
						node_t = new Tuple2<SafeFileMonitor_Set, SafeFileMonitor>() ;
						SafeFile_t_Map.putNode(wr_t, node_t) ;
						node_t.setValue1(new SafeFileMonitor_Set() ) ;
					}
					SafeFileMonitor_Set targetSet = node_t.getValue1() ;
					targetSet.add(created) ;
				}
			}
		}
	}
	if ((matchedEntry == null) ) {
		// D(X) main:4
		SafeFileMonitor created = new SafeFileMonitor(SafeFile_timestamp++) ;
		matchedEntry = created;
		matchedLastMap.putNode(wr_t, created) ;
		// D(X) defineNew:5 for <t>
		{
			// InsertMonitor
			Tuple2<SafeFileMonitor_Set, SafeFileMonitor> node_t = SafeFile_t_Map.getNodeEquivalent(wr_t) ;
			if ((node_t == null) ) {
				node_t = new Tuple2<SafeFileMonitor_Set, SafeFileMonitor>() ;
				SafeFile_t_Map.putNode(wr_t, node_t) ;
				node_t.setValue1(new SafeFileMonitor_Set() ) ;
			}
			SafeFileMonitor_Set targetSet = node_t.getValue1() ;
			targetSet.add(created) ;
		}
	}
	// D(X) main:6
	matchedEntry.setDisable(SafeFile_timestamp++) ;
}
// D(X) main:8--9
final SafeFileMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_close(f, t);
if(matchedEntryfinalMonitor.SafeFileMonitor_Prop_1_Category_fail) {
matchedEntryfinalMonitor.Prop_1_handler_fail();
}

if ((cachehit == false) ) {
	SafeFile_f_t_Map_cachekey_f = f;
	SafeFile_f_t_Map_cachekey_t = t;
	SafeFile_f_t_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeFile_beginEvent(Thread t) {
SafeFile_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_t = null;
Tuple2<SafeFileMonitor_Set, SafeFileMonitor> matchedEntry = null;
boolean cachehit = false;
if ((t == SafeFile_t_Map_cachekey_t) ) {
	matchedEntry = SafeFile_t_Map_cachevalue;
	cachehit = true;
}
else {
	wr_t = new CachedWeakReference(t) ;
	{
		// FindOrCreateEntry
		Tuple2<SafeFileMonitor_Set, SafeFileMonitor> node_t = SafeFile_t_Map.getNodeEquivalent(wr_t) ;
		if ((node_t == null) ) {
			node_t = new Tuple2<SafeFileMonitor_Set, SafeFileMonitor>() ;
			SafeFile_t_Map.putNode(wr_t, node_t) ;
			node_t.setValue1(new SafeFileMonitor_Set() ) ;
		}
		matchedEntry = node_t;
	}
}
// D(X) main:1
SafeFileMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_t == null) ) {
		wr_t = new CachedWeakReference(t) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeFileMonitor created = new SafeFileMonitor(SafeFile_timestamp++) ;
		matchedEntry.setValue2(created) ;
		SafeFileMonitor_Set enclosingSet = matchedEntry.getValue1() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	SafeFileMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	disableUpdatedLeaf.setDisable(SafeFile_timestamp++) ;
}
// D(X) main:8--9
SafeFileMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_begin(t);

if ((cachehit == false) ) {
	SafeFile_t_Map_cachekey_t = t;
	SafeFile_t_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeFile_endEvent(Thread t) {
SafeFile_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_t = null;
Tuple2<SafeFileMonitor_Set, SafeFileMonitor> matchedEntry = null;
boolean cachehit = false;
if ((t == SafeFile_t_Map_cachekey_t) ) {
	matchedEntry = SafeFile_t_Map_cachevalue;
	cachehit = true;
}
else {
	wr_t = new CachedWeakReference(t) ;
	{
		// FindOrCreateEntry
		Tuple2<SafeFileMonitor_Set, SafeFileMonitor> node_t = SafeFile_t_Map.getNodeEquivalent(wr_t) ;
		if ((node_t == null) ) {
			node_t = new Tuple2<SafeFileMonitor_Set, SafeFileMonitor>() ;
			SafeFile_t_Map.putNode(wr_t, node_t) ;
			node_t.setValue1(new SafeFileMonitor_Set() ) ;
		}
		matchedEntry = node_t;
	}
}
// D(X) main:1
SafeFileMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_t == null) ) {
		wr_t = new CachedWeakReference(t) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeFileMonitor created = new SafeFileMonitor(SafeFile_timestamp++) ;
		matchedEntry.setValue2(created) ;
		SafeFileMonitor_Set enclosingSet = matchedEntry.getValue1() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	SafeFileMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	disableUpdatedLeaf.setDisable(SafeFile_timestamp++) ;
}
// D(X) main:8--9
SafeFileMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_end(t);

if ((cachehit == false) ) {
	SafeFile_t_Map_cachekey_t = t;
	SafeFile_t_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeFileWriter_openEvent(FileWriter f) {
SafeFileWriter_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_f = null;
MapOfMonitor<SafeFileWriterMonitor> matchedLastMap = null;
SafeFileWriterMonitor matchedEntry = null;
boolean cachehit = false;
if ((f == SafeFileWriter_f_Map_cachekey_f) ) {
	matchedEntry = SafeFileWriter_f_Map_cachevalue;
	cachehit = true;
}
else {
	wr_f = new CachedWeakReference(f) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<SafeFileWriterMonitor> itmdMap = SafeFileWriter_f_Map;
		matchedLastMap = itmdMap;
		SafeFileWriterMonitor node_f = SafeFileWriter_f_Map.getNodeEquivalent(wr_f) ;
		matchedEntry = node_f;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_f == null) ) {
		wr_f = new CachedWeakReference(f) ;
	}
	// D(X) main:4
	SafeFileWriterMonitor created = new SafeFileWriterMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_f, created) ;
}
// D(X) main:8--9
final SafeFileWriterMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_open(f);
if(matchedEntryfinalMonitor.SafeFileWriterMonitor_Prop_1_Category_match) {
matchedEntryfinalMonitor.Prop_1_handler_match();
}

if ((cachehit == false) ) {
	SafeFileWriter_f_Map_cachekey_f = f;
	SafeFileWriter_f_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeFileWriter_writeEvent(FileWriter f) {
SafeFileWriter_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_f = null;
MapOfMonitor<SafeFileWriterMonitor> matchedLastMap = null;
SafeFileWriterMonitor matchedEntry = null;
boolean cachehit = false;
if ((f == SafeFileWriter_f_Map_cachekey_f) ) {
	matchedEntry = SafeFileWriter_f_Map_cachevalue;
	cachehit = true;
}
else {
	wr_f = new CachedWeakReference(f) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<SafeFileWriterMonitor> itmdMap = SafeFileWriter_f_Map;
		matchedLastMap = itmdMap;
		SafeFileWriterMonitor node_f = SafeFileWriter_f_Map.getNodeEquivalent(wr_f) ;
		matchedEntry = node_f;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_f == null) ) {
		wr_f = new CachedWeakReference(f) ;
	}
	// D(X) main:4
	SafeFileWriterMonitor created = new SafeFileWriterMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_f, created) ;
}
// D(X) main:8--9
final SafeFileWriterMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_write(f);
if(matchedEntryfinalMonitor.SafeFileWriterMonitor_Prop_1_Category_match) {
matchedEntryfinalMonitor.Prop_1_handler_match();
}

if ((cachehit == false) ) {
	SafeFileWriter_f_Map_cachekey_f = f;
	SafeFileWriter_f_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeFileWriter_closeEvent(FileWriter f) {
SafeFileWriter_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_f = null;
MapOfMonitor<SafeFileWriterMonitor> matchedLastMap = null;
SafeFileWriterMonitor matchedEntry = null;
boolean cachehit = false;
if ((f == SafeFileWriter_f_Map_cachekey_f) ) {
	matchedEntry = SafeFileWriter_f_Map_cachevalue;
	cachehit = true;
}
else {
	wr_f = new CachedWeakReference(f) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<SafeFileWriterMonitor> itmdMap = SafeFileWriter_f_Map;
		matchedLastMap = itmdMap;
		SafeFileWriterMonitor node_f = SafeFileWriter_f_Map.getNodeEquivalent(wr_f) ;
		matchedEntry = node_f;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_f == null) ) {
		wr_f = new CachedWeakReference(f) ;
	}
	// D(X) main:4
	SafeFileWriterMonitor created = new SafeFileWriterMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_f, created) ;
}
// D(X) main:8--9
final SafeFileWriterMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_close(f);
if(matchedEntryfinalMonitor.SafeFileWriterMonitor_Prop_1_Category_match) {
matchedEntryfinalMonitor.Prop_1_handler_match();
}

if ((cachehit == false) ) {
	SafeFileWriter_f_Map_cachekey_f = f;
	SafeFileWriter_f_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeIterator_createEvent(Collection c, Iterator i) {
SafeIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_c = null;
CachedWeakReference wr_i = null;
MapOfMonitor<SafeIteratorMonitor> matchedLastMap = null;
SafeIteratorMonitor matchedEntry = null;
boolean cachehit = false;
if (((c == SafeIterator_c_i_Map_cachekey_c) && (i == SafeIterator_c_i_Map_cachekey_i) ) ) {
	matchedEntry = SafeIterator_c_i_Map_cachevalue;
	cachehit = true;
}
else {
	wr_c = new CachedWeakReference(c) ;
	wr_i = new CachedWeakReference(i) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> node_c = SafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
		if ((node_c == null) ) {
			node_c = new Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor>() ;
			SafeIterator_c_i_Map.putNode(wr_c, node_c) ;
			node_c.setValue1(new MapOfMonitor<SafeIteratorMonitor>(1) ) ;
			node_c.setValue2(new SafeIteratorMonitor_Set() ) ;
		}
		MapOfMonitor<SafeIteratorMonitor> itmdMap = node_c.getValue1() ;
		matchedLastMap = itmdMap;
		SafeIteratorMonitor node_c_i = node_c.getValue1() .getNodeEquivalent(wr_i) ;
		matchedEntry = node_c_i;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_c == null) ) {
		wr_c = new CachedWeakReference(c) ;
	}
	if ((wr_i == null) ) {
		wr_i = new CachedWeakReference(i) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <c>
		SafeIteratorMonitor sourceLeaf = null;
		{
			// FindCode
			Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> node_c = SafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
			if ((node_c != null) ) {
				SafeIteratorMonitor itmdLeaf = node_c.getValue3() ;
				sourceLeaf = itmdLeaf;
			}
		}
		if ((sourceLeaf != null) ) {
			boolean definable = true;
			// D(X) defineTo:1--5 for <c, i>
			if (definable) {
				// FindCode
				Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> node_c = SafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
				if ((node_c != null) ) {
					SafeIteratorMonitor node_c_i = node_c.getValue1() .getNodeEquivalent(wr_i) ;
					if ((node_c_i != null) ) {
						if (((node_c_i.getDisable() > sourceLeaf.getTau() ) || ((node_c_i.getTau() > 0) && (node_c_i.getTau() < sourceLeaf.getTau() ) ) ) ) {
							definable = false;
						}
					}
				}
			}
			// D(X) defineTo:1--5 for <i>
			if (definable) {
				// FindCode
				Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor> node_i = SafeIterator_i_Map.getNodeEquivalent(wr_i) ;
				if ((node_i != null) ) {
					SafeIteratorMonitor itmdLeaf = node_i.getValue2() ;
					if ((itmdLeaf != null) ) {
						if (((itmdLeaf.getDisable() > sourceLeaf.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceLeaf.getTau() ) ) ) ) {
							definable = false;
						}
					}
				}
			}
			if (definable) {
				// D(X) defineTo:6
				SafeIteratorMonitor created = (SafeIteratorMonitor)sourceLeaf.clone() ;
				created.RVMRef_i = wr_i;
				created.monitorInfo.isFullParam = true;

				matchedEntry = created;
				matchedLastMap.putNode(wr_i, created) ;
				// D(X) defineTo:7 for <c>
				{
					// InsertMonitor
					Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> node_c = SafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
					if ((node_c == null) ) {
						node_c = new Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor>() ;
						SafeIterator_c_i_Map.putNode(wr_c, node_c) ;
						node_c.setValue1(new MapOfMonitor<SafeIteratorMonitor>(1) ) ;
						node_c.setValue2(new SafeIteratorMonitor_Set() ) ;
					}
					SafeIteratorMonitor_Set targetSet = node_c.getValue2() ;
					targetSet.add(created) ;
				}
				// D(X) defineTo:7 for <i>
				{
					// InsertMonitor
					Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor> node_i = SafeIterator_i_Map.getNodeEquivalent(wr_i) ;
					if ((node_i == null) ) {
						node_i = new Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor>() ;
						SafeIterator_i_Map.putNode(wr_i, node_i) ;
						node_i.setValue1(new SafeIteratorMonitor_Set() ) ;
					}
					SafeIteratorMonitor_Set targetSet = node_i.getValue1() ;
					targetSet.add(created) ;
				}
			}
		}
	}
	if ((matchedEntry == null) ) {
		// D(X) main:4
		SafeIteratorMonitor created = new SafeIteratorMonitor(SafeIterator_timestamp++, wr_c, wr_i) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = true;

		matchedEntry = created;
		matchedLastMap.putNode(wr_i, created) ;
		// D(X) defineNew:5 for <c>
		{
			// InsertMonitor
			Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> node_c = SafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
			if ((node_c == null) ) {
				node_c = new Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor>() ;
				SafeIterator_c_i_Map.putNode(wr_c, node_c) ;
				node_c.setValue1(new MapOfMonitor<SafeIteratorMonitor>(1) ) ;
				node_c.setValue2(new SafeIteratorMonitor_Set() ) ;
			}
			SafeIteratorMonitor_Set targetSet = node_c.getValue2() ;
			targetSet.add(created) ;
		}
		// D(X) defineNew:5 for <i>
		{
			// InsertMonitor
			Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor> node_i = SafeIterator_i_Map.getNodeEquivalent(wr_i) ;
			if ((node_i == null) ) {
				node_i = new Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor>() ;
				SafeIterator_i_Map.putNode(wr_i, node_i) ;
				node_i.setValue1(new SafeIteratorMonitor_Set() ) ;
			}
			SafeIteratorMonitor_Set targetSet = node_i.getValue1() ;
			targetSet.add(created) ;
		}
	}
	// D(X) main:6
	matchedEntry.setDisable(SafeIterator_timestamp++) ;
}
// D(X) main:8--9
final SafeIteratorMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_create(c, i);
if(matchedEntryfinalMonitor.SafeIteratorMonitor_Prop_1_Category_violation) {
matchedEntryfinalMonitor.Prop_1_handler_violation();
}

if ((cachehit == false) ) {
	SafeIterator_c_i_Map_cachekey_c = c;
	SafeIterator_c_i_Map_cachekey_i = i;
	SafeIterator_c_i_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeIterator_updatesourceEvent(Collection c) {
SafeIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_c = null;
Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if ((c == SafeIterator_c_Map_cachekey_c) ) {
	matchedEntry = SafeIterator_c_Map_cachevalue;
	cachehit = true;
}
else {
	wr_c = new CachedWeakReference(c) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> node_c = SafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
		if ((node_c == null) ) {
			node_c = new Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor>() ;
			SafeIterator_c_i_Map.putNode(wr_c, node_c) ;
			node_c.setValue1(new MapOfMonitor<SafeIteratorMonitor>(1) ) ;
			node_c.setValue2(new SafeIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_c;
	}
}
// D(X) main:1
SafeIteratorMonitor matchedLeaf = matchedEntry.getValue3() ;
if ((matchedLeaf == null) ) {
	if ((wr_c == null) ) {
		wr_c = new CachedWeakReference(c) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeIteratorMonitor created = new SafeIteratorMonitor(SafeIterator_timestamp++, wr_c, null) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue3(created) ;
		SafeIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
		enclosingSet.add(created) ;
		// D(X) defineNew:5 for <-c>
		{
			// InsertMonitor
			SafeIteratorMonitor_Set targetSet = SafeIterator___To__c_Map.getValue1() ;
			targetSet.add(created) ;
		}
	}
	// D(X) main:6
	SafeIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
	disableUpdatedLeaf.setDisable(SafeIterator_timestamp++) ;
}
// D(X) main:8--9
SafeIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
stateTransitionedSet.event_updatesource(c);

if ((cachehit == false) ) {
	SafeIterator_c_Map_cachekey_c = c;
	SafeIterator_c_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeIterator_nextEvent(Iterator i) {
SafeIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_i = null;
Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if ((i == SafeIterator_i_Map_cachekey_i) ) {
	matchedEntry = SafeIterator_i_Map_cachevalue;
	cachehit = true;
}
else {
	wr_i = new CachedWeakReference(i) ;
	{
		// FindOrCreateEntry
		Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor> node_i = SafeIterator_i_Map.getNodeEquivalent(wr_i) ;
		if ((node_i == null) ) {
			node_i = new Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor>() ;
			SafeIterator_i_Map.putNode(wr_i, node_i) ;
			node_i.setValue1(new SafeIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_i;
	}
}
// D(X) main:1
SafeIteratorMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_i == null) ) {
		wr_i = new CachedWeakReference(i) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <>
		SafeIteratorMonitor_Set sourceSet = null;
		{
			// FindCode
			SafeIteratorMonitor_Set itmdSet = SafeIterator___To__c_Map.getValue1() ;
			sourceSet = itmdSet;
		}
		if ((sourceSet != null) ) {
			int numalive = 0;
			int setlen = sourceSet.getSize() ;
			for (int ielem = 0; (ielem < setlen) ;++ielem) {
				SafeIteratorMonitor sourceMonitor = sourceSet.get(ielem) ;
				if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_c.get() != null) ) ) {
					sourceSet.set(numalive++, sourceMonitor) ;
					CachedWeakReference wr_c = sourceMonitor.RVMRef_c;
					MapOfMonitor<SafeIteratorMonitor> destLastMap = null;
					SafeIteratorMonitor destLeaf = null;
					{
						// FindOrCreate
						Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> node_c = SafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
						if ((node_c == null) ) {
							node_c = new Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor>() ;
							SafeIterator_c_i_Map.putNode(wr_c, node_c) ;
							node_c.setValue1(new MapOfMonitor<SafeIteratorMonitor>(1) ) ;
							node_c.setValue2(new SafeIteratorMonitor_Set() ) ;
						}
						MapOfMonitor<SafeIteratorMonitor> itmdMap = node_c.getValue1() ;
						destLastMap = itmdMap;
						SafeIteratorMonitor node_c_i = node_c.getValue1() .getNodeEquivalent(wr_i) ;
						destLeaf = node_c_i;
					}
					if ((destLeaf == null) ) {
						boolean definable = true;
						// D(X) defineTo:1--5 for <c, i>
						if (definable) {
							// FindCode
							Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> node_c = SafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
							if ((node_c != null) ) {
								SafeIteratorMonitor node_c_i = node_c.getValue1() .getNodeEquivalent(wr_i) ;
								if ((node_c_i != null) ) {
									if (((node_c_i.getDisable() > sourceMonitor.getTau() ) || ((node_c_i.getTau() > 0) && (node_c_i.getTau() < sourceMonitor.getTau() ) ) ) ) {
										definable = false;
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <i>
						if (definable) {
							// FindCode
							Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor> node_i = SafeIterator_i_Map.getNodeEquivalent(wr_i) ;
							if ((node_i != null) ) {
								SafeIteratorMonitor itmdLeaf = node_i.getValue2() ;
								if ((itmdLeaf != null) ) {
									if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
										definable = false;
									}
								}
							}
						}
						if (definable) {
							// D(X) defineTo:6
							SafeIteratorMonitor created = (SafeIteratorMonitor)sourceMonitor.clone() ;
							created.RVMRef_i = wr_i;
							created.monitorInfo.isFullParam = true;

							destLastMap.putNode(wr_i, created) ;
							// D(X) defineTo:7 for <c>
							{
								// InsertMonitor
								Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor> node_c = SafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
								if ((node_c == null) ) {
									node_c = new Tuple3<MapOfMonitor<SafeIteratorMonitor>, SafeIteratorMonitor_Set, SafeIteratorMonitor>() ;
									SafeIterator_c_i_Map.putNode(wr_c, node_c) ;
									node_c.setValue1(new MapOfMonitor<SafeIteratorMonitor>(1) ) ;
									node_c.setValue2(new SafeIteratorMonitor_Set() ) ;
								}
								SafeIteratorMonitor_Set targetSet = node_c.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <i>
							{
								// InsertMonitor
								Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor> node_i = SafeIterator_i_Map.getNodeEquivalent(wr_i) ;
								if ((node_i == null) ) {
									node_i = new Tuple2<SafeIteratorMonitor_Set, SafeIteratorMonitor>() ;
									SafeIterator_i_Map.putNode(wr_i, node_i) ;
									node_i.setValue1(new SafeIteratorMonitor_Set() ) ;
								}
								SafeIteratorMonitor_Set targetSet = node_i.getValue1() ;
								targetSet.add(created) ;
							}
						}
					}
				}
			}
			sourceSet.eraseRange(numalive) ;
		}
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeIteratorMonitor created = new SafeIteratorMonitor(SafeIterator_timestamp++, null, wr_i) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue2(created) ;
		SafeIteratorMonitor_Set enclosingSet = matchedEntry.getValue1() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	SafeIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	disableUpdatedLeaf.setDisable(SafeIterator_timestamp++) ;
}
// D(X) main:8--9
SafeIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_next(i);

if ((cachehit == false) ) {
	SafeIterator_i_Map_cachekey_i = i;
	SafeIterator_i_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeMapIterator_createCollEvent(Map map, Collection c) {
SafeMapIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_c = null;
CachedWeakReference wr_map = null;
Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if (((c == SafeMapIterator_map_c_Map_cachekey_c) && (map == SafeMapIterator_map_c_Map_cachekey_map) ) ) {
	matchedEntry = SafeMapIterator_map_c_Map_cachevalue;
	cachehit = true;
}
else {
	wr_map = new CachedWeakReference(map) ;
	wr_c = new CachedWeakReference(c) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
		if ((node_map == null) ) {
			node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
			SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
			node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
			node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
		}
		Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
		if ((node_map_c == null) ) {
			node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
			node_map.getValue1() .putNode(wr_c, node_map_c) ;
			node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
			node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_map_c;
	}
}
// D(X) main:1
SafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue3() ;
if ((matchedLeaf == null) ) {
	if ((wr_map == null) ) {
		wr_map = new CachedWeakReference(map) ;
	}
	if ((wr_c == null) ) {
		wr_c = new CachedWeakReference(c) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <c>
		SafeMapIteratorMonitor_Set sourceSet = null;
		{
			// FindCode
			Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c__To__c_i_Map.getNodeEquivalent(wr_c) ;
			if ((node_c != null) ) {
				SafeMapIteratorMonitor_Set itmdSet = node_c.getValue1() ;
				sourceSet = itmdSet;
			}
		}
		if ((sourceSet != null) ) {
			int numalive = 0;
			int setlen = sourceSet.getSize() ;
			for (int ielem = 0; (ielem < setlen) ;++ielem) {
				SafeMapIteratorMonitor sourceMonitor = sourceSet.get(ielem) ;
				if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_i.get() != null) ) ) {
					sourceSet.set(numalive++, sourceMonitor) ;
					CachedWeakReference wr_i = sourceMonitor.RVMRef_i;
					MapOfMonitor<ISafeMapIteratorMonitor> destLastMap = null;
					ISafeMapIteratorMonitor destLeaf = null;
					{
						// FindOrCreate
						Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
						if ((node_map == null) ) {
							node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
							SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
							node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
							node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
						}
						Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
						if ((node_map_c == null) ) {
							node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
							node_map.getValue1() .putNode(wr_c, node_map_c) ;
							node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
							node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
						}
						MapOfMonitor<ISafeMapIteratorMonitor> itmdMap = node_map_c.getValue1() ;
						destLastMap = itmdMap;
						ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
						destLeaf = node_map_c_i;
					}
					if (((destLeaf == null) || destLeaf instanceof SafeMapIteratorDisableHolder) ) {
						boolean definable = true;
						// D(X) defineTo:1--5 for <map>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								SafeMapIteratorMonitor itmdLeaf = node_map.getValue3() ;
								if ((itmdLeaf != null) ) {
									if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
										definable = false;
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, c>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c != null) ) {
									SafeMapIteratorMonitor itmdLeaf = node_map_c.getValue3() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, c, i>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c != null) ) {
									ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
									if ((node_map_c_i != null) ) {
										if (((node_map_c_i.getDisable() > sourceMonitor.getTau() ) || ((node_map_c_i.getTau() > 0) && (node_map_c_i.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, i>
						if (definable) {
							// FindCode
							MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
								if ((node_map_i != null) ) {
									ISafeMapIteratorMonitor itmdLeaf = node_map_i.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						if (definable) {
							// D(X) defineTo:6
							SafeMapIteratorMonitor created = (SafeMapIteratorMonitor)sourceMonitor.clone() ;
							created.RVMRef_map = wr_map;
							created.monitorInfo.isFullParam = true;

							destLastMap.putNode(wr_i, created) ;
							// D(X) defineTo:7 for <c, i>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
								if ((node_c == null) ) {
									node_c = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ;
									SafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
								}
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
								if ((node_c_i == null) ) {
									node_c_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									node_c.putNode(wr_i, node_c_i) ;
									node_c_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_c_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <i>
							{
								// InsertMonitor
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
								if ((node_i == null) ) {
									node_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_i_Map.putNode(wr_i, node_i) ;
									node_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map, c>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c == null) ) {
									node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									node_map.getValue1() .putNode(wr_c, node_map_c) ;
									node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
									node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map_c.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map, i>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>(1) ;
									SafeMapIterator_map_i_Map.putNode(wr_map, node_map) ;
								}
								Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
								if ((node_map_i == null) ) {
									node_map_i = new Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>() ;
									node_map.putNode(wr_i, node_map_i) ;
									node_map_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map_i.getValue1() ;
								targetSet.add(created) ;
							}
						}
					}
				}
			}
			sourceSet.eraseRange(numalive) ;
		}
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <map>
		SafeMapIteratorMonitor sourceLeaf = null;
		{
			// FindCode
			Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
			if ((node_map != null) ) {
				SafeMapIteratorMonitor itmdLeaf = node_map.getValue3() ;
				sourceLeaf = itmdLeaf;
			}
		}
		if ((sourceLeaf != null) ) {
			boolean definable = true;
			// D(X) defineTo:1--5 for <map, c>
			if (definable) {
				// FindCode
				Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
				if ((node_map != null) ) {
					Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
					if ((node_map_c != null) ) {
						SafeMapIteratorMonitor itmdLeaf = node_map_c.getValue3() ;
						if ((itmdLeaf != null) ) {
							if (((itmdLeaf.getDisable() > sourceLeaf.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceLeaf.getTau() ) ) ) ) {
								definable = false;
							}
						}
					}
				}
			}
			if (definable) {
				// D(X) defineTo:6
				SafeMapIteratorMonitor created = (SafeMapIteratorMonitor)sourceLeaf.clone() ;
				created.RVMRef_c = wr_c;
				created.monitorInfo.isFullParam = false;

				matchedEntry.setValue3(created) ;
				matchedLeaf = created;
				SafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
				enclosingSet.add(created) ;
				// D(X) defineTo:7 for <map>
				{
					// InsertMonitor
					Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
					if ((node_map == null) ) {
						node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
						SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
						node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
						node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
					}
					SafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
					targetSet.add(created) ;
				}
				// D(X) defineTo:7 for <-map, c>
				{
					// InsertMonitor
					SafeMapIteratorMonitor_Set targetSet = SafeMapIterator___To__map_c_Map.getValue1() ;
					targetSet.add(created) ;
				}
				// D(X) defineTo:7 for <c-map, c>
				{
					// InsertMonitor
					Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c__To__map_c_Map.getNodeEquivalent(wr_c) ;
					if ((node_c == null) ) {
						node_c = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
						SafeMapIterator_c__To__map_c_Map.putNode(wr_c, node_c) ;
						node_c.setValue1(new SafeMapIteratorMonitor_Set() ) ;
					}
					SafeMapIteratorMonitor_Set targetSet = node_c.getValue1() ;
					targetSet.add(created) ;
				}
			}
		}
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeMapIteratorMonitor created = new SafeMapIteratorMonitor(SafeMapIterator_timestamp++, wr_map, wr_c, null) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue3(created) ;
		SafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
		enclosingSet.add(created) ;
		// D(X) defineNew:5 for <map>
		{
			// InsertMonitor
			Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
			if ((node_map == null) ) {
				node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
				SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
				node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
				node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
			}
			SafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
			targetSet.add(created) ;
		}
		// D(X) defineNew:5 for <-map, c>
		{
			// InsertMonitor
			SafeMapIteratorMonitor_Set targetSet = SafeMapIterator___To__map_c_Map.getValue1() ;
			targetSet.add(created) ;
		}
		// D(X) defineNew:5 for <c-map, c>
		{
			// InsertMonitor
			Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c__To__map_c_Map.getNodeEquivalent(wr_c) ;
			if ((node_c == null) ) {
				node_c = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
				SafeMapIterator_c__To__map_c_Map.putNode(wr_c, node_c) ;
				node_c.setValue1(new SafeMapIteratorMonitor_Set() ) ;
			}
			SafeMapIteratorMonitor_Set targetSet = node_c.getValue1() ;
			targetSet.add(created) ;
		}
	}
	// D(X) main:6
	SafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
	disableUpdatedLeaf.setDisable(SafeMapIterator_timestamp++) ;
}
// D(X) main:8--9
SafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
stateTransitionedSet.event_createColl(map, c);

if ((cachehit == false) ) {
	SafeMapIterator_map_c_Map_cachekey_c = c;
	SafeMapIterator_map_c_Map_cachekey_map = map;
	SafeMapIterator_map_c_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeMapIterator_createIterEvent(Collection c, Iterator i) {
SafeMapIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_c = null;
CachedWeakReference wr_i = null;
Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if (((c == SafeMapIterator_c_i_Map_cachekey_c) && (i == SafeMapIterator_c_i_Map_cachekey_i) ) ) {
	matchedEntry = SafeMapIterator_c_i_Map_cachevalue;
	cachehit = true;
}
else {
	wr_c = new CachedWeakReference(c) ;
	wr_i = new CachedWeakReference(i) ;
	{
		// FindOrCreateEntry
		MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
		if ((node_c == null) ) {
			node_c = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ;
			SafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
		}
		Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
		if ((node_c_i == null) ) {
			node_c_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
			node_c.putNode(wr_i, node_c_i) ;
			node_c_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_c_i;
	}
}
// D(X) main:1
SafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_c == null) ) {
		wr_c = new CachedWeakReference(c) ;
	}
	if ((wr_i == null) ) {
		wr_i = new CachedWeakReference(i) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <c>
		SafeMapIteratorMonitor_Set sourceSet = null;
		{
			// FindCode
			Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c__To__map_c_Map.getNodeEquivalent(wr_c) ;
			if ((node_c != null) ) {
				SafeMapIteratorMonitor_Set itmdSet = node_c.getValue1() ;
				sourceSet = itmdSet;
			}
		}
		if ((sourceSet != null) ) {
			int numalive = 0;
			int setlen = sourceSet.getSize() ;
			for (int ielem = 0; (ielem < setlen) ;++ielem) {
				SafeMapIteratorMonitor sourceMonitor = sourceSet.get(ielem) ;
				if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_map.get() != null) ) ) {
					sourceSet.set(numalive++, sourceMonitor) ;
					CachedWeakReference wr_map = sourceMonitor.RVMRef_map;
					MapOfMonitor<ISafeMapIteratorMonitor> destLastMap = null;
					ISafeMapIteratorMonitor destLeaf = null;
					{
						// FindOrCreate
						Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
						if ((node_map == null) ) {
							node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
							SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
							node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
							node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
						}
						Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
						if ((node_map_c == null) ) {
							node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
							node_map.getValue1() .putNode(wr_c, node_map_c) ;
							node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
							node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
						}
						MapOfMonitor<ISafeMapIteratorMonitor> itmdMap = node_map_c.getValue1() ;
						destLastMap = itmdMap;
						ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
						destLeaf = node_map_c_i;
					}
					if (((destLeaf == null) || destLeaf instanceof SafeMapIteratorDisableHolder) ) {
						boolean definable = true;
						// D(X) defineTo:1--5 for <c, i>
						if (definable) {
							// FindCode
							MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
							if ((node_c != null) ) {
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
								if ((node_c_i != null) ) {
									SafeMapIteratorMonitor itmdLeaf = node_c_i.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <i>
						if (definable) {
							// FindCode
							Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
							if ((node_i != null) ) {
								SafeMapIteratorMonitor itmdLeaf = node_i.getValue2() ;
								if ((itmdLeaf != null) ) {
									if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
										definable = false;
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, c, i>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c != null) ) {
									ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
									if ((node_map_c_i != null) ) {
										if (((node_map_c_i.getDisable() > sourceMonitor.getTau() ) || ((node_map_c_i.getTau() > 0) && (node_map_c_i.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, i>
						if (definable) {
							// FindCode
							MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
								if ((node_map_i != null) ) {
									ISafeMapIteratorMonitor itmdLeaf = node_map_i.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						if (definable) {
							// D(X) defineTo:6
							SafeMapIteratorMonitor created = (SafeMapIteratorMonitor)sourceMonitor.clone() ;
							created.RVMRef_i = wr_i;
							created.monitorInfo.isFullParam = true;

							destLastMap.putNode(wr_i, created) ;
							// D(X) defineTo:7 for <c, i>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
								if ((node_c == null) ) {
									node_c = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ;
									SafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
								}
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
								if ((node_c_i == null) ) {
									node_c_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									node_c.putNode(wr_i, node_c_i) ;
									node_c_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_c_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <i>
							{
								// InsertMonitor
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
								if ((node_i == null) ) {
									node_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_i_Map.putNode(wr_i, node_i) ;
									node_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map, c>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c == null) ) {
									node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									node_map.getValue1() .putNode(wr_c, node_map_c) ;
									node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
									node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map_c.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map, i>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>(1) ;
									SafeMapIterator_map_i_Map.putNode(wr_map, node_map) ;
								}
								Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
								if ((node_map_i == null) ) {
									node_map_i = new Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>() ;
									node_map.putNode(wr_i, node_map_i) ;
									node_map_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map_i.getValue1() ;
								targetSet.add(created) ;
							}
						}
					}
				}
			}
			sourceSet.eraseRange(numalive) ;
		}
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <>
		SafeMapIteratorMonitor_Set sourceSet = null;
		{
			// FindCode
			SafeMapIteratorMonitor_Set itmdSet = SafeMapIterator___To__map_Map.getValue1() ;
			sourceSet = itmdSet;
		}
		if ((sourceSet != null) ) {
			int numalive = 0;
			int setlen = sourceSet.getSize() ;
			for (int ielem = 0; (ielem < setlen) ;++ielem) {
				SafeMapIteratorMonitor sourceMonitor = sourceSet.get(ielem) ;
				if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_map.get() != null) ) ) {
					sourceSet.set(numalive++, sourceMonitor) ;
					CachedWeakReference wr_map = sourceMonitor.RVMRef_map;
					MapOfMonitor<ISafeMapIteratorMonitor> destLastMap = null;
					ISafeMapIteratorMonitor destLeaf = null;
					{
						// FindOrCreate
						Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
						if ((node_map == null) ) {
							node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
							SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
							node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
							node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
						}
						Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
						if ((node_map_c == null) ) {
							node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
							node_map.getValue1() .putNode(wr_c, node_map_c) ;
							node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
							node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
						}
						MapOfMonitor<ISafeMapIteratorMonitor> itmdMap = node_map_c.getValue1() ;
						destLastMap = itmdMap;
						ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
						destLeaf = node_map_c_i;
					}
					if (((destLeaf == null) || destLeaf instanceof SafeMapIteratorDisableHolder) ) {
						boolean definable = true;
						// D(X) defineTo:1--5 for <c, i>
						if (definable) {
							// FindCode
							MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
							if ((node_c != null) ) {
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
								if ((node_c_i != null) ) {
									SafeMapIteratorMonitor itmdLeaf = node_c_i.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <i>
						if (definable) {
							// FindCode
							Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
							if ((node_i != null) ) {
								SafeMapIteratorMonitor itmdLeaf = node_i.getValue2() ;
								if ((itmdLeaf != null) ) {
									if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
										definable = false;
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, c>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c != null) ) {
									SafeMapIteratorMonitor itmdLeaf = node_map_c.getValue3() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, c, i>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c != null) ) {
									ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
									if ((node_map_c_i != null) ) {
										if (((node_map_c_i.getDisable() > sourceMonitor.getTau() ) || ((node_map_c_i.getTau() > 0) && (node_map_c_i.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, i>
						if (definable) {
							// FindCode
							MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
								if ((node_map_i != null) ) {
									ISafeMapIteratorMonitor itmdLeaf = node_map_i.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						if (definable) {
							// D(X) defineTo:6
							SafeMapIteratorMonitor created = (SafeMapIteratorMonitor)sourceMonitor.clone() ;
							created.RVMRef_c = wr_c;
							created.RVMRef_i = wr_i;
							created.monitorInfo.isFullParam = true;

							destLastMap.putNode(wr_i, created) ;
							// D(X) defineTo:7 for <c, i>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
								if ((node_c == null) ) {
									node_c = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ;
									SafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
								}
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
								if ((node_c_i == null) ) {
									node_c_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									node_c.putNode(wr_i, node_c_i) ;
									node_c_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_c_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <i>
							{
								// InsertMonitor
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
								if ((node_i == null) ) {
									node_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_i_Map.putNode(wr_i, node_i) ;
									node_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map, c>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c == null) ) {
									node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									node_map.getValue1() .putNode(wr_c, node_map_c) ;
									node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
									node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map_c.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map, i>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>(1) ;
									SafeMapIterator_map_i_Map.putNode(wr_map, node_map) ;
								}
								Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
								if ((node_map_i == null) ) {
									node_map_i = new Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>() ;
									node_map.putNode(wr_i, node_map_i) ;
									node_map_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map_i.getValue1() ;
								targetSet.add(created) ;
							}
						}
					}
				}
			}
			sourceSet.eraseRange(numalive) ;
		}
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeMapIteratorMonitor created = new SafeMapIteratorMonitor(SafeMapIterator_timestamp++, null, wr_c, wr_i) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue2(created) ;
		SafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue1() ;
		enclosingSet.add(created) ;
		// D(X) defineNew:5 for <i>
		{
			// InsertMonitor
			Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
			if ((node_i == null) ) {
				node_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
				SafeMapIterator_i_Map.putNode(wr_i, node_i) ;
				node_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
			}
			SafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
			targetSet.add(created) ;
		}
		// D(X) defineNew:5 for <-c, i>
		{
			// InsertMonitor
			SafeMapIteratorMonitor_Set targetSet = SafeMapIterator___To__c_i_Map.getValue1() ;
			targetSet.add(created) ;
		}
		// D(X) defineNew:5 for <c-c, i>
		{
			// InsertMonitor
			Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c__To__c_i_Map.getNodeEquivalent(wr_c) ;
			if ((node_c == null) ) {
				node_c = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
				SafeMapIterator_c__To__c_i_Map.putNode(wr_c, node_c) ;
				node_c.setValue1(new SafeMapIteratorMonitor_Set() ) ;
			}
			SafeMapIteratorMonitor_Set targetSet = node_c.getValue1() ;
			targetSet.add(created) ;
		}
	}
	// D(X) main:6
	SafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	disableUpdatedLeaf.setDisable(SafeMapIterator_timestamp++) ;
}
// D(X) main:8--9
SafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_createIter(c, i);

if ((cachehit == false) ) {
	SafeMapIterator_c_i_Map_cachekey_c = c;
	SafeMapIterator_c_i_Map_cachekey_i = i;
	SafeMapIterator_c_i_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeMapIterator_useIterEvent(Iterator i) {
SafeMapIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_i = null;
Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if ((i == SafeMapIterator_i_Map_cachekey_i) ) {
	matchedEntry = SafeMapIterator_i_Map_cachevalue;
	cachehit = true;
}
else {
	wr_i = new CachedWeakReference(i) ;
	{
		// FindOrCreateEntry
		Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
		if ((node_i == null) ) {
			node_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
			SafeMapIterator_i_Map.putNode(wr_i, node_i) ;
			node_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_i;
	}
}
// D(X) main:1
SafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_i == null) ) {
		wr_i = new CachedWeakReference(i) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <>
		SafeMapIteratorMonitor_Set sourceSet = null;
		{
			// FindCode
			SafeMapIteratorMonitor_Set itmdSet = SafeMapIterator___To__map_c_Map.getValue1() ;
			sourceSet = itmdSet;
		}
		if ((sourceSet != null) ) {
			int numalive = 0;
			int setlen = sourceSet.getSize() ;
			for (int ielem = 0; (ielem < setlen) ;++ielem) {
				SafeMapIteratorMonitor sourceMonitor = sourceSet.get(ielem) ;
				if (((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_c.get() != null) ) && (sourceMonitor.RVMRef_map.get() != null) ) ) {
					sourceSet.set(numalive++, sourceMonitor) ;
					CachedWeakReference wr_c = sourceMonitor.RVMRef_c;
					CachedWeakReference wr_map = sourceMonitor.RVMRef_map;
					MapOfMonitor<ISafeMapIteratorMonitor> destLastMap = null;
					ISafeMapIteratorMonitor destLeaf = null;
					{
						// FindOrCreate
						Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
						if ((node_map == null) ) {
							node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
							SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
							node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
							node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
						}
						Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
						if ((node_map_c == null) ) {
							node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
							node_map.getValue1() .putNode(wr_c, node_map_c) ;
							node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
							node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
						}
						MapOfMonitor<ISafeMapIteratorMonitor> itmdMap = node_map_c.getValue1() ;
						destLastMap = itmdMap;
						ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
						destLeaf = node_map_c_i;
					}
					if (((destLeaf == null) || destLeaf instanceof SafeMapIteratorDisableHolder) ) {
						boolean definable = true;
						// D(X) defineTo:1--5 for <c, i>
						if (definable) {
							// FindCode
							MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
							if ((node_c != null) ) {
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
								if ((node_c_i != null) ) {
									SafeMapIteratorMonitor itmdLeaf = node_c_i.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <i>
						if (definable) {
							// FindCode
							Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
							if ((node_i != null) ) {
								SafeMapIteratorMonitor itmdLeaf = node_i.getValue2() ;
								if ((itmdLeaf != null) ) {
									if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
										definable = false;
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, c, i>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c != null) ) {
									ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
									if ((node_map_c_i != null) ) {
										if (((node_map_c_i.getDisable() > sourceMonitor.getTau() ) || ((node_map_c_i.getTau() > 0) && (node_map_c_i.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, i>
						if (definable) {
							// FindCode
							MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
								if ((node_map_i != null) ) {
									ISafeMapIteratorMonitor itmdLeaf = node_map_i.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						if (definable) {
							// D(X) defineTo:6
							SafeMapIteratorMonitor created = (SafeMapIteratorMonitor)sourceMonitor.clone() ;
							created.RVMRef_i = wr_i;
							created.monitorInfo.isFullParam = true;

							destLastMap.putNode(wr_i, created) ;
							// D(X) defineTo:7 for <c, i>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
								if ((node_c == null) ) {
									node_c = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ;
									SafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
								}
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
								if ((node_c_i == null) ) {
									node_c_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									node_c.putNode(wr_i, node_c_i) ;
									node_c_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_c_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <i>
							{
								// InsertMonitor
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
								if ((node_i == null) ) {
									node_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_i_Map.putNode(wr_i, node_i) ;
									node_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map, c>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c == null) ) {
									node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									node_map.getValue1() .putNode(wr_c, node_map_c) ;
									node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
									node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map_c.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map, i>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>(1) ;
									SafeMapIterator_map_i_Map.putNode(wr_map, node_map) ;
								}
								Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
								if ((node_map_i == null) ) {
									node_map_i = new Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>() ;
									node_map.putNode(wr_i, node_map_i) ;
									node_map_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map_i.getValue1() ;
								targetSet.add(created) ;
							}
						}
					}
				}
			}
			sourceSet.eraseRange(numalive) ;
		}
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <>
		SafeMapIteratorMonitor_Set sourceSet = null;
		{
			// FindCode
			SafeMapIteratorMonitor_Set itmdSet = SafeMapIterator___To__map_Map.getValue1() ;
			sourceSet = itmdSet;
		}
		if ((sourceSet != null) ) {
			int numalive = 0;
			int setlen = sourceSet.getSize() ;
			for (int ielem = 0; (ielem < setlen) ;++ielem) {
				SafeMapIteratorMonitor sourceMonitor = sourceSet.get(ielem) ;
				if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_map.get() != null) ) ) {
					sourceSet.set(numalive++, sourceMonitor) ;
					CachedWeakReference wr_map = sourceMonitor.RVMRef_map;
					Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> destEntry = null;
					ISafeMapIteratorMonitor destLeaf = null;
					{
						// FindOrCreate
						MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
						if ((node_map == null) ) {
							node_map = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>(1) ;
							SafeMapIterator_map_i_Map.putNode(wr_map, node_map) ;
						}
						Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
						if ((node_map_i == null) ) {
							node_map_i = new Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>() ;
							node_map.putNode(wr_i, node_map_i) ;
							node_map_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
						}
						destEntry = node_map_i;
						ISafeMapIteratorMonitor itmdLeaf = node_map_i.getValue2() ;
						destLeaf = itmdLeaf;
					}
					if (((destLeaf == null) || destLeaf instanceof SafeMapIteratorDisableHolder) ) {
						boolean definable = true;
						// D(X) defineTo:1--5 for <i>
						if (definable) {
							// FindCode
							Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
							if ((node_i != null) ) {
								SafeMapIteratorMonitor itmdLeaf = node_i.getValue2() ;
								if ((itmdLeaf != null) ) {
									if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
										definable = false;
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, i>
						if (definable) {
							// FindCode
							MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
								if ((node_map_i != null) ) {
									ISafeMapIteratorMonitor itmdLeaf = node_map_i.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						if (definable) {
							// D(X) defineTo:6
							SafeMapIteratorMonitor created = (SafeMapIteratorMonitor)sourceMonitor.clone() ;
							created.RVMRef_i = wr_i;
							created.monitorInfo.isFullParam = false;

							destEntry.setValue2(created) ;
							// D(X) defineTo:7 for <i>
							{
								// InsertMonitor
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
								if ((node_i == null) ) {
									node_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_i_Map.putNode(wr_i, node_i) ;
									node_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
								targetSet.add(created) ;
							}
						}
					}
				}
			}
			sourceSet.eraseRange(numalive) ;
		}
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeMapIteratorMonitor created = new SafeMapIteratorMonitor(SafeMapIterator_timestamp++, null, null, wr_i) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue2(created) ;
		SafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue1() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	SafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	disableUpdatedLeaf.setDisable(SafeMapIterator_timestamp++) ;
}
// D(X) main:8--9
SafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_useIter(i);

if ((cachehit == false) ) {
	SafeMapIterator_i_Map_cachekey_i = i;
	SafeMapIterator_i_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeMapIterator_updateMapEvent(Map map) {
SafeMapIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_map = null;
Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if ((map == SafeMapIterator_map_Map_cachekey_map) ) {
	matchedEntry = SafeMapIterator_map_Map_cachevalue;
	cachehit = true;
}
else {
	wr_map = new CachedWeakReference(map) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
		if ((node_map == null) ) {
			node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
			SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
			node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
			node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_map;
	}
}
// D(X) main:1
SafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue3() ;
if ((matchedLeaf == null) ) {
	if ((wr_map == null) ) {
		wr_map = new CachedWeakReference(map) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <>
		SafeMapIteratorMonitor_Set sourceSet = null;
		{
			// FindCode
			SafeMapIteratorMonitor_Set itmdSet = SafeMapIterator___To__c_i_Map.getValue1() ;
			sourceSet = itmdSet;
		}
		if ((sourceSet != null) ) {
			int numalive = 0;
			int setlen = sourceSet.getSize() ;
			for (int ielem = 0; (ielem < setlen) ;++ielem) {
				SafeMapIteratorMonitor sourceMonitor = sourceSet.get(ielem) ;
				if (((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_c.get() != null) ) && (sourceMonitor.RVMRef_i.get() != null) ) ) {
					sourceSet.set(numalive++, sourceMonitor) ;
					CachedWeakReference wr_c = sourceMonitor.RVMRef_c;
					CachedWeakReference wr_i = sourceMonitor.RVMRef_i;
					MapOfMonitor<ISafeMapIteratorMonitor> destLastMap = null;
					ISafeMapIteratorMonitor destLeaf = null;
					{
						// FindOrCreate
						Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
						if ((node_map == null) ) {
							node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
							SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
							node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
							node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
						}
						Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
						if ((node_map_c == null) ) {
							node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
							node_map.getValue1() .putNode(wr_c, node_map_c) ;
							node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
							node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
						}
						MapOfMonitor<ISafeMapIteratorMonitor> itmdMap = node_map_c.getValue1() ;
						destLastMap = itmdMap;
						ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
						destLeaf = node_map_c_i;
					}
					if (((destLeaf == null) || destLeaf instanceof SafeMapIteratorDisableHolder) ) {
						boolean definable = true;
						// D(X) defineTo:1--5 for <map>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								SafeMapIteratorMonitor itmdLeaf = node_map.getValue3() ;
								if ((itmdLeaf != null) ) {
									if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
										definable = false;
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, c>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c != null) ) {
									SafeMapIteratorMonitor itmdLeaf = node_map_c.getValue3() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, c, i>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c != null) ) {
									ISafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
									if ((node_map_c_i != null) ) {
										if (((node_map_c_i.getDisable() > sourceMonitor.getTau() ) || ((node_map_c_i.getTau() > 0) && (node_map_c_i.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, i>
						if (definable) {
							// FindCode
							MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
								if ((node_map_i != null) ) {
									ISafeMapIteratorMonitor itmdLeaf = node_map_i.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						if (definable) {
							// D(X) defineTo:6
							SafeMapIteratorMonitor created = (SafeMapIteratorMonitor)sourceMonitor.clone() ;
							created.RVMRef_map = wr_map;
							created.monitorInfo.isFullParam = true;

							destLastMap.putNode(wr_i, created) ;
							// D(X) defineTo:7 for <c, i>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c = SafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
								if ((node_c == null) ) {
									node_c = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ;
									SafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
								}
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
								if ((node_c_i == null) ) {
									node_c_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									node_c.putNode(wr_i, node_c_i) ;
									node_c_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_c_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <i>
							{
								// InsertMonitor
								Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_i = SafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
								if ((node_i == null) ) {
									node_i = new Tuple2<SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_i_Map.putNode(wr_i, node_i) ;
									node_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map, c>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map = SafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									SafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c == null) ) {
									node_map_c = new Tuple3<MapOfMonitor<ISafeMapIteratorMonitor>, SafeMapIteratorMonitor_Set, SafeMapIteratorMonitor>() ;
									node_map.getValue1() .putNode(wr_c, node_map_c) ;
									node_map_c.setValue1(new MapOfMonitor<ISafeMapIteratorMonitor>(2) ) ;
									node_map_c.setValue2(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map_c.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map, i>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map = SafeMapIterator_map_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new MapOfSetMonitor<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>(1) ;
									SafeMapIterator_map_i_Map.putNode(wr_map, node_map) ;
								}
								Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor> node_map_i = node_map.getNodeEquivalent(wr_i) ;
								if ((node_map_i == null) ) {
									node_map_i = new Tuple2<SafeMapIteratorMonitor_Set, ISafeMapIteratorMonitor>() ;
									node_map.putNode(wr_i, node_map_i) ;
									node_map_i.setValue1(new SafeMapIteratorMonitor_Set() ) ;
								}
								SafeMapIteratorMonitor_Set targetSet = node_map_i.getValue1() ;
								targetSet.add(created) ;
							}
						}
					}
				}
			}
			sourceSet.eraseRange(numalive) ;
		}
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeMapIteratorMonitor created = new SafeMapIteratorMonitor(SafeMapIterator_timestamp++, wr_map, null, null) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue3(created) ;
		SafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
		enclosingSet.add(created) ;
		// D(X) defineNew:5 for <-map>
		{
			// InsertMonitor
			SafeMapIteratorMonitor_Set targetSet = SafeMapIterator___To__map_Map.getValue1() ;
			targetSet.add(created) ;
		}
	}
	// D(X) main:6
	SafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
	disableUpdatedLeaf.setDisable(SafeMapIterator_timestamp++) ;
}
// D(X) main:8--9
SafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
stateTransitionedSet.event_updateMap(map);

if ((cachehit == false) ) {
	SafeMapIterator_map_Map_cachekey_map = map;
	SafeMapIterator_map_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeSyncCollection_syncEvent(Object c) {
SafeSyncCollection_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_c = null;
Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> matchedEntry = null;
boolean cachehit = false;
if ((c == SafeSyncCollection_c_Map_cachekey_c) ) {
	matchedEntry = SafeSyncCollection_c_Map_cachevalue;
	cachehit = true;
}
else {
	wr_c = new CachedWeakReference(c) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> node_c = SafeSyncCollection_c_iter_Map.getNodeEquivalent(wr_c) ;
		if ((node_c == null) ) {
			node_c = new Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor>() ;
			SafeSyncCollection_c_iter_Map.putNode(wr_c, node_c) ;
			node_c.setValue1(new MapOfMonitor<ISafeSyncCollectionMonitor>(1) ) ;
			node_c.setValue2(new SafeSyncCollectionMonitor_Set() ) ;
		}
		matchedEntry = node_c;
	}
}
// D(X) main:1
SafeSyncCollectionMonitor matchedLeaf = matchedEntry.getValue3() ;
if ((matchedLeaf == null) ) {
	if ((wr_c == null) ) {
		wr_c = new CachedWeakReference(c) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeSyncCollectionMonitor created = new SafeSyncCollectionMonitor(SafeSyncCollection_timestamp++) ;
		matchedEntry.setValue3(created) ;
		SafeSyncCollectionMonitor_Set enclosingSet = matchedEntry.getValue2() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	SafeSyncCollectionMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
	disableUpdatedLeaf.setDisable(SafeSyncCollection_timestamp++) ;
}
// D(X) main:8--9
SafeSyncCollectionMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
stateTransitionedSet.event_sync(c);

if ((cachehit == false) ) {
	SafeSyncCollection_c_Map_cachekey_c = c;
	SafeSyncCollection_c_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeSyncCollection_syncCreateIterEvent(Object c, Iterator iter) {
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

if (SafeSyncCollection_activated) {
CachedWeakReference wr_c = null;
CachedWeakReference wr_iter = null;
MapOfMonitor<ISafeSyncCollectionMonitor> matchedLastMap = null;
ISafeSyncCollectionMonitor matchedEntry = null;
boolean cachehit = false;
if (((c == SafeSyncCollection_c_iter_Map_cachekey_c) && (iter == SafeSyncCollection_c_iter_Map_cachekey_iter) ) ) {
	matchedEntry = SafeSyncCollection_c_iter_Map_cachevalue;
	cachehit = true;
}
else {
	wr_c = new CachedWeakReference(c) ;
	wr_iter = new CachedWeakReference(iter) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> node_c = SafeSyncCollection_c_iter_Map.getNodeEquivalent(wr_c) ;
		if ((node_c == null) ) {
			node_c = new Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor>() ;
			SafeSyncCollection_c_iter_Map.putNode(wr_c, node_c) ;
			node_c.setValue1(new MapOfMonitor<ISafeSyncCollectionMonitor>(1) ) ;
			node_c.setValue2(new SafeSyncCollectionMonitor_Set() ) ;
		}
		MapOfMonitor<ISafeSyncCollectionMonitor> itmdMap = node_c.getValue1() ;
		matchedLastMap = itmdMap;
		ISafeSyncCollectionMonitor node_c_iter = node_c.getValue1() .getNodeEquivalent(wr_iter) ;
		matchedEntry = node_c_iter;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_c == null) ) {
		wr_c = new CachedWeakReference(c) ;
	}
	if ((wr_iter == null) ) {
		wr_iter = new CachedWeakReference(iter) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <c>
		SafeSyncCollectionMonitor sourceLeaf = null;
		{
			// FindCode
			Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> node_c = SafeSyncCollection_c_iter_Map.getNodeEquivalent(wr_c) ;
			if ((node_c != null) ) {
				SafeSyncCollectionMonitor itmdLeaf = node_c.getValue3() ;
				sourceLeaf = itmdLeaf;
			}
		}
		if ((sourceLeaf != null) ) {
			boolean definable = true;
			// D(X) defineTo:1--5 for <c, iter>
			if (definable) {
				// FindCode
				Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> node_c = SafeSyncCollection_c_iter_Map.getNodeEquivalent(wr_c) ;
				if ((node_c != null) ) {
					ISafeSyncCollectionMonitor node_c_iter = node_c.getValue1() .getNodeEquivalent(wr_iter) ;
					if ((node_c_iter != null) ) {
						if (((node_c_iter.getDisable() > sourceLeaf.getTau() ) || ((node_c_iter.getTau() > 0) && (node_c_iter.getTau() < sourceLeaf.getTau() ) ) ) ) {
							definable = false;
						}
					}
				}
			}
			// D(X) defineTo:1--5 for <iter>
			if (definable) {
				// FindCode
				Tuple2<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor> node_iter = SafeSyncCollection_iter_Map.getNodeEquivalent(wr_iter) ;
				if ((node_iter != null) ) {
					ISafeSyncCollectionMonitor itmdLeaf = node_iter.getValue2() ;
					if ((itmdLeaf != null) ) {
						if (((itmdLeaf.getDisable() > sourceLeaf.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceLeaf.getTau() ) ) ) ) {
							definable = false;
						}
					}
				}
			}
			if (definable) {
				// D(X) defineTo:6
				SafeSyncCollectionMonitor created = (SafeSyncCollectionMonitor)sourceLeaf.clone() ;
				matchedEntry = created;
				matchedLastMap.putNode(wr_iter, created) ;
				// D(X) defineTo:7 for <c>
				{
					// InsertMonitor
					Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> node_c = SafeSyncCollection_c_iter_Map.getNodeEquivalent(wr_c) ;
					if ((node_c == null) ) {
						node_c = new Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor>() ;
						SafeSyncCollection_c_iter_Map.putNode(wr_c, node_c) ;
						node_c.setValue1(new MapOfMonitor<ISafeSyncCollectionMonitor>(1) ) ;
						node_c.setValue2(new SafeSyncCollectionMonitor_Set() ) ;
					}
					SafeSyncCollectionMonitor_Set targetSet = node_c.getValue2() ;
					targetSet.add(created) ;
				}
				// D(X) defineTo:7 for <iter>
				{
					// InsertMonitor
					Tuple2<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor> node_iter = SafeSyncCollection_iter_Map.getNodeEquivalent(wr_iter) ;
					if ((node_iter == null) ) {
						node_iter = new Tuple2<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor>() ;
						SafeSyncCollection_iter_Map.putNode(wr_iter, node_iter) ;
						node_iter.setValue1(new SafeSyncCollectionMonitor_Set() ) ;
					}
					SafeSyncCollectionMonitor_Set targetSet = node_iter.getValue1() ;
					targetSet.add(created) ;
				}
			}
		}
	}
	// D(X) main:6
	if ((matchedEntry == null) ) {
		SafeSyncCollectionDisableHolder holder = new SafeSyncCollectionDisableHolder(-1) ;
		matchedLastMap.putNode(wr_iter, holder) ;
		matchedEntry = holder;
	}
	matchedEntry.setDisable(SafeSyncCollection_timestamp++) ;
}
// D(X) main:8--9
if (matchedEntry instanceof SafeSyncCollectionMonitor) {
	SafeSyncCollectionMonitor monitor = (SafeSyncCollectionMonitor)matchedEntry;
	final SafeSyncCollectionMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_syncCreateIter(c, iter);
if(monitorfinalMonitor.SafeSyncCollectionMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}

	if ((cachehit == false) ) {
		SafeSyncCollection_c_iter_Map_cachekey_c = c;
		SafeSyncCollection_c_iter_Map_cachekey_iter = iter;
		SafeSyncCollection_c_iter_Map_cachevalue = matchedEntry;
	}
}

}

JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeSyncCollection_asyncCreateIterEvent(Object c, Iterator iter) {
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

if (SafeSyncCollection_activated) {
CachedWeakReference wr_c = null;
CachedWeakReference wr_iter = null;
MapOfMonitor<ISafeSyncCollectionMonitor> matchedLastMap = null;
ISafeSyncCollectionMonitor matchedEntry = null;
boolean cachehit = false;
if (((c == SafeSyncCollection_c_iter_Map_cachekey_c) && (iter == SafeSyncCollection_c_iter_Map_cachekey_iter) ) ) {
	matchedEntry = SafeSyncCollection_c_iter_Map_cachevalue;
	cachehit = true;
}
else {
	wr_c = new CachedWeakReference(c) ;
	wr_iter = new CachedWeakReference(iter) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> node_c = SafeSyncCollection_c_iter_Map.getNodeEquivalent(wr_c) ;
		if ((node_c == null) ) {
			node_c = new Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor>() ;
			SafeSyncCollection_c_iter_Map.putNode(wr_c, node_c) ;
			node_c.setValue1(new MapOfMonitor<ISafeSyncCollectionMonitor>(1) ) ;
			node_c.setValue2(new SafeSyncCollectionMonitor_Set() ) ;
		}
		MapOfMonitor<ISafeSyncCollectionMonitor> itmdMap = node_c.getValue1() ;
		matchedLastMap = itmdMap;
		ISafeSyncCollectionMonitor node_c_iter = node_c.getValue1() .getNodeEquivalent(wr_iter) ;
		matchedEntry = node_c_iter;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_c == null) ) {
		wr_c = new CachedWeakReference(c) ;
	}
	if ((wr_iter == null) ) {
		wr_iter = new CachedWeakReference(iter) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <c>
		SafeSyncCollectionMonitor sourceLeaf = null;
		{
			// FindCode
			Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> node_c = SafeSyncCollection_c_iter_Map.getNodeEquivalent(wr_c) ;
			if ((node_c != null) ) {
				SafeSyncCollectionMonitor itmdLeaf = node_c.getValue3() ;
				sourceLeaf = itmdLeaf;
			}
		}
		if ((sourceLeaf != null) ) {
			boolean definable = true;
			// D(X) defineTo:1--5 for <c, iter>
			if (definable) {
				// FindCode
				Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> node_c = SafeSyncCollection_c_iter_Map.getNodeEquivalent(wr_c) ;
				if ((node_c != null) ) {
					ISafeSyncCollectionMonitor node_c_iter = node_c.getValue1() .getNodeEquivalent(wr_iter) ;
					if ((node_c_iter != null) ) {
						if (((node_c_iter.getDisable() > sourceLeaf.getTau() ) || ((node_c_iter.getTau() > 0) && (node_c_iter.getTau() < sourceLeaf.getTau() ) ) ) ) {
							definable = false;
						}
					}
				}
			}
			// D(X) defineTo:1--5 for <iter>
			if (definable) {
				// FindCode
				Tuple2<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor> node_iter = SafeSyncCollection_iter_Map.getNodeEquivalent(wr_iter) ;
				if ((node_iter != null) ) {
					ISafeSyncCollectionMonitor itmdLeaf = node_iter.getValue2() ;
					if ((itmdLeaf != null) ) {
						if (((itmdLeaf.getDisable() > sourceLeaf.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceLeaf.getTau() ) ) ) ) {
							definable = false;
						}
					}
				}
			}
			if (definable) {
				// D(X) defineTo:6
				SafeSyncCollectionMonitor created = (SafeSyncCollectionMonitor)sourceLeaf.clone() ;
				matchedEntry = created;
				matchedLastMap.putNode(wr_iter, created) ;
				// D(X) defineTo:7 for <c>
				{
					// InsertMonitor
					Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor> node_c = SafeSyncCollection_c_iter_Map.getNodeEquivalent(wr_c) ;
					if ((node_c == null) ) {
						node_c = new Tuple3<MapOfMonitor<ISafeSyncCollectionMonitor>, SafeSyncCollectionMonitor_Set, SafeSyncCollectionMonitor>() ;
						SafeSyncCollection_c_iter_Map.putNode(wr_c, node_c) ;
						node_c.setValue1(new MapOfMonitor<ISafeSyncCollectionMonitor>(1) ) ;
						node_c.setValue2(new SafeSyncCollectionMonitor_Set() ) ;
					}
					SafeSyncCollectionMonitor_Set targetSet = node_c.getValue2() ;
					targetSet.add(created) ;
				}
				// D(X) defineTo:7 for <iter>
				{
					// InsertMonitor
					Tuple2<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor> node_iter = SafeSyncCollection_iter_Map.getNodeEquivalent(wr_iter) ;
					if ((node_iter == null) ) {
						node_iter = new Tuple2<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor>() ;
						SafeSyncCollection_iter_Map.putNode(wr_iter, node_iter) ;
						node_iter.setValue1(new SafeSyncCollectionMonitor_Set() ) ;
					}
					SafeSyncCollectionMonitor_Set targetSet = node_iter.getValue1() ;
					targetSet.add(created) ;
				}
			}
		}
	}
	// D(X) main:6
	if ((matchedEntry == null) ) {
		SafeSyncCollectionDisableHolder holder = new SafeSyncCollectionDisableHolder(-1) ;
		matchedLastMap.putNode(wr_iter, holder) ;
		matchedEntry = holder;
	}
	matchedEntry.setDisable(SafeSyncCollection_timestamp++) ;
}
// D(X) main:8--9
if (matchedEntry instanceof SafeSyncCollectionMonitor) {
	SafeSyncCollectionMonitor monitor = (SafeSyncCollectionMonitor)matchedEntry;
	final SafeSyncCollectionMonitor monitorfinalMonitor = monitor;
monitor.Prop_1_event_asyncCreateIter(c, iter);
if(monitorfinalMonitor.SafeSyncCollectionMonitor_Prop_1_Category_match) {
monitorfinalMonitor.Prop_1_handler_match();
}

	if ((cachehit == false) ) {
		SafeSyncCollection_c_iter_Map_cachekey_c = c;
		SafeSyncCollection_c_iter_Map_cachekey_iter = iter;
		SafeSyncCollection_c_iter_Map_cachevalue = matchedEntry;
	}
}

}

JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeSyncCollection_accessIterEvent(Iterator iter) {
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

if (SafeSyncCollection_activated) {
CachedWeakReference wr_iter = null;
Tuple2<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor> matchedEntry = null;
boolean cachehit = false;
if ((iter == SafeSyncCollection_iter_Map_cachekey_iter) ) {
	matchedEntry = SafeSyncCollection_iter_Map_cachevalue;
	cachehit = true;
}
else {
	wr_iter = new CachedWeakReference(iter) ;
	{
		// FindOrCreateEntry
		Tuple2<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor> node_iter = SafeSyncCollection_iter_Map.getNodeEquivalent(wr_iter) ;
		if ((node_iter == null) ) {
			node_iter = new Tuple2<SafeSyncCollectionMonitor_Set, ISafeSyncCollectionMonitor>() ;
			SafeSyncCollection_iter_Map.putNode(wr_iter, node_iter) ;
			node_iter.setValue1(new SafeSyncCollectionMonitor_Set() ) ;
		}
		matchedEntry = node_iter;
	}
}
// D(X) main:1
ISafeSyncCollectionMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_iter == null) ) {
		wr_iter = new CachedWeakReference(iter) ;
	}
	// D(X) main:6
	ISafeSyncCollectionMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	if ((disableUpdatedLeaf == null) ) {
		SafeSyncCollectionDisableHolder holder = new SafeSyncCollectionDisableHolder(-1) ;
		matchedEntry.setValue2(holder) ;
		disableUpdatedLeaf = holder;
	}
	disableUpdatedLeaf.setDisable(SafeSyncCollection_timestamp++) ;
}
// D(X) main:8--9
SafeSyncCollectionMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_accessIter(iter);

if ((cachehit == false) ) {
	SafeSyncCollection_iter_Map_cachekey_iter = iter;
	SafeSyncCollection_iter_Map_cachevalue = matchedEntry;
}

}

JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeSyncMap_syncEvent(Map syncMap) {
SafeSyncMap_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_syncMap = null;
Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> matchedEntry = null;
boolean cachehit = false;
if ((syncMap == SafeSyncMap_syncMap_Map_cachekey_syncMap) ) {
	matchedEntry = SafeSyncMap_syncMap_Map_cachevalue;
	cachehit = true;
}
else {
	wr_syncMap = new CachedWeakReference(syncMap) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
		if ((node_syncMap == null) ) {
			node_syncMap = new Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor>() ;
			SafeSyncMap_syncMap_mapSet_iter_Map.putNode(wr_syncMap, node_syncMap) ;
			node_syncMap.setValue1(new MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ) ;
			node_syncMap.setValue2(new SafeSyncMapMonitor_Set() ) ;
		}
		matchedEntry = node_syncMap;
	}
}
// D(X) main:1
SafeSyncMapMonitor matchedLeaf = matchedEntry.getValue3() ;
if ((matchedLeaf == null) ) {
	if ((wr_syncMap == null) ) {
		wr_syncMap = new CachedWeakReference(syncMap) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		SafeSyncMapMonitor created = new SafeSyncMapMonitor(SafeSyncMap_timestamp++, wr_syncMap) ;
		matchedEntry.setValue3(created) ;
		SafeSyncMapMonitor_Set enclosingSet = matchedEntry.getValue2() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	SafeSyncMapMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
	disableUpdatedLeaf.setDisable(SafeSyncMap_timestamp++) ;
}
// D(X) main:8--9
SafeSyncMapMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
stateTransitionedSet.event_sync(syncMap);

if ((cachehit == false) ) {
	SafeSyncMap_syncMap_Map_cachekey_syncMap = syncMap;
	SafeSyncMap_syncMap_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeSyncMap_createSetEvent(Map syncMap, Set mapSet) {
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

if (SafeSyncMap_activated) {
CachedWeakReference wr_syncMap = null;
CachedWeakReference wr_mapSet = null;
Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> matchedEntry = null;
boolean cachehit = false;
if (((mapSet == SafeSyncMap_syncMap_mapSet_Map_cachekey_mapSet) && (syncMap == SafeSyncMap_syncMap_mapSet_Map_cachekey_syncMap) ) ) {
	matchedEntry = SafeSyncMap_syncMap_mapSet_Map_cachevalue;
	cachehit = true;
}
else {
	wr_syncMap = new CachedWeakReference(syncMap) ;
	wr_mapSet = new CachedWeakReference(mapSet) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
		if ((node_syncMap == null) ) {
			node_syncMap = new Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor>() ;
			SafeSyncMap_syncMap_mapSet_iter_Map.putNode(wr_syncMap, node_syncMap) ;
			node_syncMap.setValue1(new MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ) ;
			node_syncMap.setValue2(new SafeSyncMapMonitor_Set() ) ;
		}
		Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_syncMap_mapSet = node_syncMap.getValue1() .getNodeEquivalent(wr_mapSet) ;
		if ((node_syncMap_mapSet == null) ) {
			node_syncMap_mapSet = new Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
			node_syncMap.getValue1() .putNode(wr_mapSet, node_syncMap_mapSet) ;
			node_syncMap_mapSet.setValue1(new MapOfMonitor<ISafeSyncMapMonitor>(2) ) ;
			node_syncMap_mapSet.setValue2(new SafeSyncMapMonitor_Set() ) ;
		}
		matchedEntry = node_syncMap_mapSet;
	}
}
// D(X) main:1
ISafeSyncMapMonitor matchedLeaf = matchedEntry.getValue3() ;
if ((matchedLeaf == null) ) {
	if ((wr_syncMap == null) ) {
		wr_syncMap = new CachedWeakReference(syncMap) ;
	}
	if ((wr_mapSet == null) ) {
		wr_mapSet = new CachedWeakReference(mapSet) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <syncMap>
		SafeSyncMapMonitor sourceLeaf = null;
		{
			// FindCode
			Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
			if ((node_syncMap != null) ) {
				SafeSyncMapMonitor itmdLeaf = node_syncMap.getValue3() ;
				sourceLeaf = itmdLeaf;
			}
		}
		if ((sourceLeaf != null) ) {
			boolean definable = true;
			// D(X) defineTo:1--5 for <syncMap, mapSet>
			if (definable) {
				// FindCode
				Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
				if ((node_syncMap != null) ) {
					Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_syncMap_mapSet = node_syncMap.getValue1() .getNodeEquivalent(wr_mapSet) ;
					if ((node_syncMap_mapSet != null) ) {
						ISafeSyncMapMonitor itmdLeaf = node_syncMap_mapSet.getValue3() ;
						if ((itmdLeaf != null) ) {
							if (((itmdLeaf.getDisable() > sourceLeaf.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceLeaf.getTau() ) ) ) ) {
								definable = false;
							}
						}
					}
				}
			}
			if (definable) {
				// D(X) defineTo:6
				SafeSyncMapMonitor created = (SafeSyncMapMonitor)sourceLeaf.clone() ;
				matchedEntry.setValue3(created) ;
				matchedLeaf = created;
				SafeSyncMapMonitor_Set enclosingSet = matchedEntry.getValue2() ;
				enclosingSet.add(created) ;
				// D(X) defineTo:7 for <syncMap>
				{
					// InsertMonitor
					Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
					if ((node_syncMap == null) ) {
						node_syncMap = new Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor>() ;
						SafeSyncMap_syncMap_mapSet_iter_Map.putNode(wr_syncMap, node_syncMap) ;
						node_syncMap.setValue1(new MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ) ;
						node_syncMap.setValue2(new SafeSyncMapMonitor_Set() ) ;
					}
					SafeSyncMapMonitor_Set targetSet = node_syncMap.getValue2() ;
					targetSet.add(created) ;
				}
				// D(X) defineTo:7 for <mapSet-syncMap, mapSet>
				{
					// InsertMonitor
					Tuple2<SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_mapSet = SafeSyncMap_mapSet__To__syncMap_mapSet_Map.getNodeEquivalent(wr_mapSet) ;
					if ((node_mapSet == null) ) {
						node_mapSet = new Tuple2<SafeSyncMapMonitor_Set, SafeSyncMapMonitor>() ;
						SafeSyncMap_mapSet__To__syncMap_mapSet_Map.putNode(wr_mapSet, node_mapSet) ;
						node_mapSet.setValue1(new SafeSyncMapMonitor_Set() ) ;
					}
					SafeSyncMapMonitor_Set targetSet = node_mapSet.getValue1() ;
					targetSet.add(created) ;
				}
			}
		}
	}
	// D(X) main:6
	ISafeSyncMapMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
	if ((disableUpdatedLeaf == null) ) {
		SafeSyncMapDisableHolder holder = new SafeSyncMapDisableHolder(-1) ;
		matchedEntry.setValue3(holder) ;
		disableUpdatedLeaf = holder;
	}
	disableUpdatedLeaf.setDisable(SafeSyncMap_timestamp++) ;
}
// D(X) main:8--9
SafeSyncMapMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
stateTransitionedSet.event_createSet(syncMap, mapSet);

if ((cachehit == false) ) {
	SafeSyncMap_syncMap_mapSet_Map_cachekey_mapSet = mapSet;
	SafeSyncMap_syncMap_mapSet_Map_cachekey_syncMap = syncMap;
	SafeSyncMap_syncMap_mapSet_Map_cachevalue = matchedEntry;
}

}

JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeSyncMap_syncCreateIterEvent(Set mapSet, Iterator iter) {
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

if (SafeSyncMap_activated) {
CachedWeakReference wr_iter = null;
CachedWeakReference wr_mapSet = null;
Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> matchedEntry = null;
boolean cachehit = false;
if (((iter == SafeSyncMap_mapSet_iter_Map_cachekey_iter) && (mapSet == SafeSyncMap_mapSet_iter_Map_cachekey_mapSet) ) ) {
	matchedEntry = SafeSyncMap_mapSet_iter_Map_cachevalue;
	cachehit = true;
}
else {
	wr_mapSet = new CachedWeakReference(mapSet) ;
	wr_iter = new CachedWeakReference(iter) ;
	{
		// FindOrCreateEntry
		MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet = SafeSyncMap_mapSet_iter_Map.getNodeEquivalent(wr_mapSet) ;
		if ((node_mapSet == null) ) {
			node_mapSet = new MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ;
			SafeSyncMap_mapSet_iter_Map.putNode(wr_mapSet, node_mapSet) ;
		}
		Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet_iter = node_mapSet.getNodeEquivalent(wr_iter) ;
		if ((node_mapSet_iter == null) ) {
			node_mapSet_iter = new Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
			node_mapSet.putNode(wr_iter, node_mapSet_iter) ;
			node_mapSet_iter.setValue1(new SafeSyncMapMonitor_Set() ) ;
		}
		matchedEntry = node_mapSet_iter;
	}
}
// D(X) main:1
ISafeSyncMapMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_mapSet == null) ) {
		wr_mapSet = new CachedWeakReference(mapSet) ;
	}
	if ((wr_iter == null) ) {
		wr_iter = new CachedWeakReference(iter) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <mapSet>
		SafeSyncMapMonitor_Set sourceSet = null;
		{
			// FindCode
			Tuple2<SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_mapSet = SafeSyncMap_mapSet__To__syncMap_mapSet_Map.getNodeEquivalent(wr_mapSet) ;
			if ((node_mapSet != null) ) {
				SafeSyncMapMonitor_Set itmdSet = node_mapSet.getValue1() ;
				sourceSet = itmdSet;
			}
		}
		if ((sourceSet != null) ) {
			int numalive = 0;
			int setlen = sourceSet.getSize() ;
			for (int ielem = 0; (ielem < setlen) ;++ielem) {
				SafeSyncMapMonitor sourceMonitor = sourceSet.get(ielem) ;
				if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_syncMap.get() != null) ) ) {
					sourceSet.set(numalive++, sourceMonitor) ;
					CachedWeakReference wr_syncMap = sourceMonitor.RVMRef_syncMap;
					MapOfMonitor<ISafeSyncMapMonitor> destLastMap = null;
					ISafeSyncMapMonitor destLeaf = null;
					{
						// FindOrCreate
						Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
						if ((node_syncMap == null) ) {
							node_syncMap = new Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor>() ;
							SafeSyncMap_syncMap_mapSet_iter_Map.putNode(wr_syncMap, node_syncMap) ;
							node_syncMap.setValue1(new MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ) ;
							node_syncMap.setValue2(new SafeSyncMapMonitor_Set() ) ;
						}
						Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_syncMap_mapSet = node_syncMap.getValue1() .getNodeEquivalent(wr_mapSet) ;
						if ((node_syncMap_mapSet == null) ) {
							node_syncMap_mapSet = new Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
							node_syncMap.getValue1() .putNode(wr_mapSet, node_syncMap_mapSet) ;
							node_syncMap_mapSet.setValue1(new MapOfMonitor<ISafeSyncMapMonitor>(2) ) ;
							node_syncMap_mapSet.setValue2(new SafeSyncMapMonitor_Set() ) ;
						}
						MapOfMonitor<ISafeSyncMapMonitor> itmdMap = node_syncMap_mapSet.getValue1() ;
						destLastMap = itmdMap;
						ISafeSyncMapMonitor node_syncMap_mapSet_iter = node_syncMap_mapSet.getValue1() .getNodeEquivalent(wr_iter) ;
						destLeaf = node_syncMap_mapSet_iter;
					}
					if (((destLeaf == null) || destLeaf instanceof SafeSyncMapDisableHolder) ) {
						boolean definable = true;
						// D(X) defineTo:1--5 for <iter>
						if (definable) {
							// FindCode
							Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_iter = SafeSyncMap_iter_Map.getNodeEquivalent(wr_iter) ;
							if ((node_iter != null) ) {
								ISafeSyncMapMonitor itmdLeaf = node_iter.getValue2() ;
								if ((itmdLeaf != null) ) {
									if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
										definable = false;
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <mapSet, iter>
						if (definable) {
							// FindCode
							MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet = SafeSyncMap_mapSet_iter_Map.getNodeEquivalent(wr_mapSet) ;
							if ((node_mapSet != null) ) {
								Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet_iter = node_mapSet.getNodeEquivalent(wr_iter) ;
								if ((node_mapSet_iter != null) ) {
									ISafeSyncMapMonitor itmdLeaf = node_mapSet_iter.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <syncMap, mapSet, iter>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
							if ((node_syncMap != null) ) {
								Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_syncMap_mapSet = node_syncMap.getValue1() .getNodeEquivalent(wr_mapSet) ;
								if ((node_syncMap_mapSet != null) ) {
									ISafeSyncMapMonitor node_syncMap_mapSet_iter = node_syncMap_mapSet.getValue1() .getNodeEquivalent(wr_iter) ;
									if ((node_syncMap_mapSet_iter != null) ) {
										if (((node_syncMap_mapSet_iter.getDisable() > sourceMonitor.getTau() ) || ((node_syncMap_mapSet_iter.getTau() > 0) && (node_syncMap_mapSet_iter.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						if (definable) {
							// D(X) defineTo:6
							SafeSyncMapMonitor created = (SafeSyncMapMonitor)sourceMonitor.clone() ;
							destLastMap.putNode(wr_iter, created) ;
							// D(X) defineTo:7 for <iter>
							{
								// InsertMonitor
								Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_iter = SafeSyncMap_iter_Map.getNodeEquivalent(wr_iter) ;
								if ((node_iter == null) ) {
									node_iter = new Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
									SafeSyncMap_iter_Map.putNode(wr_iter, node_iter) ;
									node_iter.setValue1(new SafeSyncMapMonitor_Set() ) ;
								}
								SafeSyncMapMonitor_Set targetSet = node_iter.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <mapSet, iter>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet = SafeSyncMap_mapSet_iter_Map.getNodeEquivalent(wr_mapSet) ;
								if ((node_mapSet == null) ) {
									node_mapSet = new MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ;
									SafeSyncMap_mapSet_iter_Map.putNode(wr_mapSet, node_mapSet) ;
								}
								Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet_iter = node_mapSet.getNodeEquivalent(wr_iter) ;
								if ((node_mapSet_iter == null) ) {
									node_mapSet_iter = new Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
									node_mapSet.putNode(wr_iter, node_mapSet_iter) ;
									node_mapSet_iter.setValue1(new SafeSyncMapMonitor_Set() ) ;
								}
								SafeSyncMapMonitor_Set targetSet = node_mapSet_iter.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <syncMap>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
								if ((node_syncMap == null) ) {
									node_syncMap = new Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor>() ;
									SafeSyncMap_syncMap_mapSet_iter_Map.putNode(wr_syncMap, node_syncMap) ;
									node_syncMap.setValue1(new MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ) ;
									node_syncMap.setValue2(new SafeSyncMapMonitor_Set() ) ;
								}
								SafeSyncMapMonitor_Set targetSet = node_syncMap.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <syncMap, mapSet>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
								if ((node_syncMap == null) ) {
									node_syncMap = new Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor>() ;
									SafeSyncMap_syncMap_mapSet_iter_Map.putNode(wr_syncMap, node_syncMap) ;
									node_syncMap.setValue1(new MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ) ;
									node_syncMap.setValue2(new SafeSyncMapMonitor_Set() ) ;
								}
								Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_syncMap_mapSet = node_syncMap.getValue1() .getNodeEquivalent(wr_mapSet) ;
								if ((node_syncMap_mapSet == null) ) {
									node_syncMap_mapSet = new Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
									node_syncMap.getValue1() .putNode(wr_mapSet, node_syncMap_mapSet) ;
									node_syncMap_mapSet.setValue1(new MapOfMonitor<ISafeSyncMapMonitor>(2) ) ;
									node_syncMap_mapSet.setValue2(new SafeSyncMapMonitor_Set() ) ;
								}
								SafeSyncMapMonitor_Set targetSet = node_syncMap_mapSet.getValue2() ;
								targetSet.add(created) ;
							}
						}
					}
				}
			}
			sourceSet.eraseRange(numalive) ;
		}
	}
	// D(X) main:6
	ISafeSyncMapMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	if ((disableUpdatedLeaf == null) ) {
		SafeSyncMapDisableHolder holder = new SafeSyncMapDisableHolder(-1) ;
		matchedEntry.setValue2(holder) ;
		disableUpdatedLeaf = holder;
	}
	disableUpdatedLeaf.setDisable(SafeSyncMap_timestamp++) ;
}
// D(X) main:8--9
SafeSyncMapMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_syncCreateIter(mapSet, iter);

if ((cachehit == false) ) {
	SafeSyncMap_mapSet_iter_Map_cachekey_iter = iter;
	SafeSyncMap_mapSet_iter_Map_cachekey_mapSet = mapSet;
	SafeSyncMap_mapSet_iter_Map_cachevalue = matchedEntry;
}

}

JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeSyncMap_asyncCreateIterEvent(Set mapSet, Iterator iter) {
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

if (SafeSyncMap_activated) {
CachedWeakReference wr_iter = null;
CachedWeakReference wr_mapSet = null;
Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> matchedEntry = null;
boolean cachehit = false;
if (((iter == SafeSyncMap_mapSet_iter_Map_cachekey_iter) && (mapSet == SafeSyncMap_mapSet_iter_Map_cachekey_mapSet) ) ) {
	matchedEntry = SafeSyncMap_mapSet_iter_Map_cachevalue;
	cachehit = true;
}
else {
	wr_mapSet = new CachedWeakReference(mapSet) ;
	wr_iter = new CachedWeakReference(iter) ;
	{
		// FindOrCreateEntry
		MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet = SafeSyncMap_mapSet_iter_Map.getNodeEquivalent(wr_mapSet) ;
		if ((node_mapSet == null) ) {
			node_mapSet = new MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ;
			SafeSyncMap_mapSet_iter_Map.putNode(wr_mapSet, node_mapSet) ;
		}
		Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet_iter = node_mapSet.getNodeEquivalent(wr_iter) ;
		if ((node_mapSet_iter == null) ) {
			node_mapSet_iter = new Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
			node_mapSet.putNode(wr_iter, node_mapSet_iter) ;
			node_mapSet_iter.setValue1(new SafeSyncMapMonitor_Set() ) ;
		}
		matchedEntry = node_mapSet_iter;
	}
}
// D(X) main:1
ISafeSyncMapMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_mapSet == null) ) {
		wr_mapSet = new CachedWeakReference(mapSet) ;
	}
	if ((wr_iter == null) ) {
		wr_iter = new CachedWeakReference(iter) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <mapSet>
		SafeSyncMapMonitor_Set sourceSet = null;
		{
			// FindCode
			Tuple2<SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_mapSet = SafeSyncMap_mapSet__To__syncMap_mapSet_Map.getNodeEquivalent(wr_mapSet) ;
			if ((node_mapSet != null) ) {
				SafeSyncMapMonitor_Set itmdSet = node_mapSet.getValue1() ;
				sourceSet = itmdSet;
			}
		}
		if ((sourceSet != null) ) {
			int numalive = 0;
			int setlen = sourceSet.getSize() ;
			for (int ielem = 0; (ielem < setlen) ;++ielem) {
				SafeSyncMapMonitor sourceMonitor = sourceSet.get(ielem) ;
				if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_syncMap.get() != null) ) ) {
					sourceSet.set(numalive++, sourceMonitor) ;
					CachedWeakReference wr_syncMap = sourceMonitor.RVMRef_syncMap;
					MapOfMonitor<ISafeSyncMapMonitor> destLastMap = null;
					ISafeSyncMapMonitor destLeaf = null;
					{
						// FindOrCreate
						Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
						if ((node_syncMap == null) ) {
							node_syncMap = new Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor>() ;
							SafeSyncMap_syncMap_mapSet_iter_Map.putNode(wr_syncMap, node_syncMap) ;
							node_syncMap.setValue1(new MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ) ;
							node_syncMap.setValue2(new SafeSyncMapMonitor_Set() ) ;
						}
						Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_syncMap_mapSet = node_syncMap.getValue1() .getNodeEquivalent(wr_mapSet) ;
						if ((node_syncMap_mapSet == null) ) {
							node_syncMap_mapSet = new Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
							node_syncMap.getValue1() .putNode(wr_mapSet, node_syncMap_mapSet) ;
							node_syncMap_mapSet.setValue1(new MapOfMonitor<ISafeSyncMapMonitor>(2) ) ;
							node_syncMap_mapSet.setValue2(new SafeSyncMapMonitor_Set() ) ;
						}
						MapOfMonitor<ISafeSyncMapMonitor> itmdMap = node_syncMap_mapSet.getValue1() ;
						destLastMap = itmdMap;
						ISafeSyncMapMonitor node_syncMap_mapSet_iter = node_syncMap_mapSet.getValue1() .getNodeEquivalent(wr_iter) ;
						destLeaf = node_syncMap_mapSet_iter;
					}
					if (((destLeaf == null) || destLeaf instanceof SafeSyncMapDisableHolder) ) {
						boolean definable = true;
						// D(X) defineTo:1--5 for <iter>
						if (definable) {
							// FindCode
							Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_iter = SafeSyncMap_iter_Map.getNodeEquivalent(wr_iter) ;
							if ((node_iter != null) ) {
								ISafeSyncMapMonitor itmdLeaf = node_iter.getValue2() ;
								if ((itmdLeaf != null) ) {
									if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
										definable = false;
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <mapSet, iter>
						if (definable) {
							// FindCode
							MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet = SafeSyncMap_mapSet_iter_Map.getNodeEquivalent(wr_mapSet) ;
							if ((node_mapSet != null) ) {
								Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet_iter = node_mapSet.getNodeEquivalent(wr_iter) ;
								if ((node_mapSet_iter != null) ) {
									ISafeSyncMapMonitor itmdLeaf = node_mapSet_iter.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <syncMap, mapSet, iter>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
							if ((node_syncMap != null) ) {
								Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_syncMap_mapSet = node_syncMap.getValue1() .getNodeEquivalent(wr_mapSet) ;
								if ((node_syncMap_mapSet != null) ) {
									ISafeSyncMapMonitor node_syncMap_mapSet_iter = node_syncMap_mapSet.getValue1() .getNodeEquivalent(wr_iter) ;
									if ((node_syncMap_mapSet_iter != null) ) {
										if (((node_syncMap_mapSet_iter.getDisable() > sourceMonitor.getTau() ) || ((node_syncMap_mapSet_iter.getTau() > 0) && (node_syncMap_mapSet_iter.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						if (definable) {
							// D(X) defineTo:6
							SafeSyncMapMonitor created = (SafeSyncMapMonitor)sourceMonitor.clone() ;
							destLastMap.putNode(wr_iter, created) ;
							// D(X) defineTo:7 for <iter>
							{
								// InsertMonitor
								Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_iter = SafeSyncMap_iter_Map.getNodeEquivalent(wr_iter) ;
								if ((node_iter == null) ) {
									node_iter = new Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
									SafeSyncMap_iter_Map.putNode(wr_iter, node_iter) ;
									node_iter.setValue1(new SafeSyncMapMonitor_Set() ) ;
								}
								SafeSyncMapMonitor_Set targetSet = node_iter.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <mapSet, iter>
							{
								// InsertMonitor
								MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet = SafeSyncMap_mapSet_iter_Map.getNodeEquivalent(wr_mapSet) ;
								if ((node_mapSet == null) ) {
									node_mapSet = new MapOfSetMonitor<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ;
									SafeSyncMap_mapSet_iter_Map.putNode(wr_mapSet, node_mapSet) ;
								}
								Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_mapSet_iter = node_mapSet.getNodeEquivalent(wr_iter) ;
								if ((node_mapSet_iter == null) ) {
									node_mapSet_iter = new Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
									node_mapSet.putNode(wr_iter, node_mapSet_iter) ;
									node_mapSet_iter.setValue1(new SafeSyncMapMonitor_Set() ) ;
								}
								SafeSyncMapMonitor_Set targetSet = node_mapSet_iter.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <syncMap>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
								if ((node_syncMap == null) ) {
									node_syncMap = new Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor>() ;
									SafeSyncMap_syncMap_mapSet_iter_Map.putNode(wr_syncMap, node_syncMap) ;
									node_syncMap.setValue1(new MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ) ;
									node_syncMap.setValue2(new SafeSyncMapMonitor_Set() ) ;
								}
								SafeSyncMapMonitor_Set targetSet = node_syncMap.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <syncMap, mapSet>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor> node_syncMap = SafeSyncMap_syncMap_mapSet_iter_Map.getNodeEquivalent(wr_syncMap) ;
								if ((node_syncMap == null) ) {
									node_syncMap = new Tuple3<MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, SafeSyncMapMonitor>() ;
									SafeSyncMap_syncMap_mapSet_iter_Map.putNode(wr_syncMap, node_syncMap) ;
									node_syncMap.setValue1(new MapOfAll<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>(1) ) ;
									node_syncMap.setValue2(new SafeSyncMapMonitor_Set() ) ;
								}
								Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_syncMap_mapSet = node_syncMap.getValue1() .getNodeEquivalent(wr_mapSet) ;
								if ((node_syncMap_mapSet == null) ) {
									node_syncMap_mapSet = new Tuple3<MapOfMonitor<ISafeSyncMapMonitor>, SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
									node_syncMap.getValue1() .putNode(wr_mapSet, node_syncMap_mapSet) ;
									node_syncMap_mapSet.setValue1(new MapOfMonitor<ISafeSyncMapMonitor>(2) ) ;
									node_syncMap_mapSet.setValue2(new SafeSyncMapMonitor_Set() ) ;
								}
								SafeSyncMapMonitor_Set targetSet = node_syncMap_mapSet.getValue2() ;
								targetSet.add(created) ;
							}
						}
					}
				}
			}
			sourceSet.eraseRange(numalive) ;
		}
	}
	// D(X) main:6
	ISafeSyncMapMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	if ((disableUpdatedLeaf == null) ) {
		SafeSyncMapDisableHolder holder = new SafeSyncMapDisableHolder(-1) ;
		matchedEntry.setValue2(holder) ;
		disableUpdatedLeaf = holder;
	}
	disableUpdatedLeaf.setDisable(SafeSyncMap_timestamp++) ;
}
// D(X) main:8--9
SafeSyncMapMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_asyncCreateIter(mapSet, iter);

if ((cachehit == false) ) {
	SafeSyncMap_mapSet_iter_Map_cachekey_iter = iter;
	SafeSyncMap_mapSet_iter_Map_cachekey_mapSet = mapSet;
	SafeSyncMap_mapSet_iter_Map_cachevalue = matchedEntry;
}

}

JavaMOPAgent_1_RVMLock.unlock();
}

public static final void SafeSyncMap_accessIterEvent(Iterator iter) {
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

if (SafeSyncMap_activated) {
CachedWeakReference wr_iter = null;
Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> matchedEntry = null;
boolean cachehit = false;
if ((iter == SafeSyncMap_iter_Map_cachekey_iter) ) {
	matchedEntry = SafeSyncMap_iter_Map_cachevalue;
	cachehit = true;
}
else {
	wr_iter = new CachedWeakReference(iter) ;
	{
		// FindOrCreateEntry
		Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor> node_iter = SafeSyncMap_iter_Map.getNodeEquivalent(wr_iter) ;
		if ((node_iter == null) ) {
			node_iter = new Tuple2<SafeSyncMapMonitor_Set, ISafeSyncMapMonitor>() ;
			SafeSyncMap_iter_Map.putNode(wr_iter, node_iter) ;
			node_iter.setValue1(new SafeSyncMapMonitor_Set() ) ;
		}
		matchedEntry = node_iter;
	}
}
// D(X) main:1
ISafeSyncMapMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_iter == null) ) {
		wr_iter = new CachedWeakReference(iter) ;
	}
	// D(X) main:6
	ISafeSyncMapMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	if ((disableUpdatedLeaf == null) ) {
		SafeSyncMapDisableHolder holder = new SafeSyncMapDisableHolder(-1) ;
		matchedEntry.setValue2(holder) ;
		disableUpdatedLeaf = holder;
	}
	disableUpdatedLeaf.setDisable(SafeSyncMap_timestamp++) ;
}
// D(X) main:8--9
SafeSyncMapMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_accessIter(iter);

if ((cachehit == false) ) {
	SafeSyncMap_iter_Map_cachekey_iter = iter;
	SafeSyncMap_iter_Map_cachevalue = matchedEntry;
}

}

JavaMOPAgent_1_RVMLock.unlock();
}

public static final void UnsafeIterator_createEvent(Collection c, Iterator i) {
UnsafeIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_c = null;
CachedWeakReference wr_i = null;
MapOfMonitor<UnsafeIteratorMonitor> matchedLastMap = null;
UnsafeIteratorMonitor matchedEntry = null;
boolean cachehit = false;
if (((c == UnsafeIterator_c_i_Map_cachekey_c) && (i == UnsafeIterator_c_i_Map_cachekey_i) ) ) {
	matchedEntry = UnsafeIterator_c_i_Map_cachevalue;
	cachehit = true;
}
else {
	wr_c = new CachedWeakReference(c) ;
	wr_i = new CachedWeakReference(i) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> node_c = UnsafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
		if ((node_c == null) ) {
			node_c = new Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>() ;
			UnsafeIterator_c_i_Map.putNode(wr_c, node_c) ;
			node_c.setValue1(new MapOfMonitor<UnsafeIteratorMonitor>(1) ) ;
			node_c.setValue2(new UnsafeIteratorMonitor_Set() ) ;
		}
		MapOfMonitor<UnsafeIteratorMonitor> itmdMap = node_c.getValue1() ;
		matchedLastMap = itmdMap;
		UnsafeIteratorMonitor node_c_i = node_c.getValue1() .getNodeEquivalent(wr_i) ;
		matchedEntry = node_c_i;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_c == null) ) {
		wr_c = new CachedWeakReference(c) ;
	}
	if ((wr_i == null) ) {
		wr_i = new CachedWeakReference(i) ;
	}
	if ((matchedEntry == null) ) {
		// D(X) main:4
		UnsafeIteratorMonitor created = new UnsafeIteratorMonitor(UnsafeIterator_timestamp++) ;
		matchedEntry = created;
		matchedLastMap.putNode(wr_i, created) ;
		// D(X) defineNew:5 for <c>
		{
			// InsertMonitor
			Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> node_c = UnsafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
			if ((node_c == null) ) {
				node_c = new Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>() ;
				UnsafeIterator_c_i_Map.putNode(wr_c, node_c) ;
				node_c.setValue1(new MapOfMonitor<UnsafeIteratorMonitor>(1) ) ;
				node_c.setValue2(new UnsafeIteratorMonitor_Set() ) ;
			}
			UnsafeIteratorMonitor_Set targetSet = node_c.getValue2() ;
			targetSet.add(created) ;
		}
		// D(X) defineNew:5 for <i>
		{
			// InsertMonitor
			Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> node_i = UnsafeIterator_i_Map.getNodeEquivalent(wr_i) ;
			if ((node_i == null) ) {
				node_i = new Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>() ;
				UnsafeIterator_i_Map.putNode(wr_i, node_i) ;
				node_i.setValue1(new UnsafeIteratorMonitor_Set() ) ;
			}
			UnsafeIteratorMonitor_Set targetSet = node_i.getValue1() ;
			targetSet.add(created) ;
		}
	}
	// D(X) main:6
	matchedEntry.setDisable(UnsafeIterator_timestamp++) ;
}
// D(X) main:8--9
final UnsafeIteratorMonitor matchedEntryfinalMonitor = matchedEntry;
matchedEntry.Prop_1_event_create(c, i);
if(matchedEntryfinalMonitor.UnsafeIteratorMonitor_Prop_1_Category_match) {
matchedEntryfinalMonitor.Prop_1_handler_match();
}

if ((cachehit == false) ) {
	UnsafeIterator_c_i_Map_cachekey_c = c;
	UnsafeIterator_c_i_Map_cachekey_i = i;
	UnsafeIterator_c_i_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void UnsafeIterator_updatesourceEvent(Collection c) {
UnsafeIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_c = null;
Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if ((c == UnsafeIterator_c_Map_cachekey_c) ) {
	matchedEntry = UnsafeIterator_c_Map_cachevalue;
	cachehit = true;
}
else {
	wr_c = new CachedWeakReference(c) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> node_c = UnsafeIterator_c_i_Map.getNodeEquivalent(wr_c) ;
		if ((node_c == null) ) {
			node_c = new Tuple3<MapOfMonitor<UnsafeIteratorMonitor>, UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>() ;
			UnsafeIterator_c_i_Map.putNode(wr_c, node_c) ;
			node_c.setValue1(new MapOfMonitor<UnsafeIteratorMonitor>(1) ) ;
			node_c.setValue2(new UnsafeIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_c;
	}
}
// D(X) main:1
UnsafeIteratorMonitor matchedLeaf = matchedEntry.getValue3() ;
if ((matchedLeaf == null) ) {
	if ((wr_c == null) ) {
		wr_c = new CachedWeakReference(c) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		UnsafeIteratorMonitor created = new UnsafeIteratorMonitor(UnsafeIterator_timestamp++) ;
		matchedEntry.setValue3(created) ;
		UnsafeIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	UnsafeIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
	disableUpdatedLeaf.setDisable(UnsafeIterator_timestamp++) ;
}
// D(X) main:8--9
UnsafeIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
stateTransitionedSet.event_updatesource(c);

if ((cachehit == false) ) {
	UnsafeIterator_c_Map_cachekey_c = c;
	UnsafeIterator_c_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void UnsafeIterator_nextEvent(Iterator i) {
UnsafeIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_i = null;
Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if ((i == UnsafeIterator_i_Map_cachekey_i) ) {
	matchedEntry = UnsafeIterator_i_Map_cachevalue;
	cachehit = true;
}
else {
	wr_i = new CachedWeakReference(i) ;
	{
		// FindOrCreateEntry
		Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor> node_i = UnsafeIterator_i_Map.getNodeEquivalent(wr_i) ;
		if ((node_i == null) ) {
			node_i = new Tuple2<UnsafeIteratorMonitor_Set, UnsafeIteratorMonitor>() ;
			UnsafeIterator_i_Map.putNode(wr_i, node_i) ;
			node_i.setValue1(new UnsafeIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_i;
	}
}
// D(X) main:1
UnsafeIteratorMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_i == null) ) {
		wr_i = new CachedWeakReference(i) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		UnsafeIteratorMonitor created = new UnsafeIteratorMonitor(UnsafeIterator_timestamp++) ;
		matchedEntry.setValue2(created) ;
		UnsafeIteratorMonitor_Set enclosingSet = matchedEntry.getValue1() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	UnsafeIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	disableUpdatedLeaf.setDisable(UnsafeIterator_timestamp++) ;
}
// D(X) main:8--9
UnsafeIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_next(i);

if ((cachehit == false) ) {
	UnsafeIterator_i_Map_cachekey_i = i;
	UnsafeIterator_i_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void UnsafeMapIterator_createCollEvent(Map map, Collection c) {
UnsafeMapIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_c = null;
CachedWeakReference wr_map = null;
Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if (((c == UnsafeMapIterator_map_c_Map_cachekey_c) && (map == UnsafeMapIterator_map_c_Map_cachekey_map) ) ) {
	matchedEntry = UnsafeMapIterator_map_c_Map_cachevalue;
	cachehit = true;
}
else {
	wr_map = new CachedWeakReference(map) ;
	wr_c = new CachedWeakReference(c) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
		if ((node_map == null) ) {
			node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
			UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
			node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
			node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
		}
		Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
		if ((node_map_c == null) ) {
			node_map_c = new Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
			node_map.getValue1() .putNode(wr_c, node_map_c) ;
			node_map_c.setValue1(new MapOfMonitor<IUnsafeMapIteratorMonitor>(2) ) ;
			node_map_c.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_map_c;
	}
}
// D(X) main:1
UnsafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue3() ;
if ((matchedLeaf == null) ) {
	if ((wr_map == null) ) {
		wr_map = new CachedWeakReference(map) ;
	}
	if ((wr_c == null) ) {
		wr_c = new CachedWeakReference(c) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		UnsafeMapIteratorMonitor created = new UnsafeMapIteratorMonitor(UnsafeMapIterator_timestamp++, wr_map, wr_c, null) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue3(created) ;
		UnsafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
		enclosingSet.add(created) ;
		// D(X) defineNew:5 for <map>
		{
			// InsertMonitor
			Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
			if ((node_map == null) ) {
				node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
				UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
				node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
				node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
			}
			UnsafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
			targetSet.add(created) ;
		}
		// D(X) defineNew:5 for <c-map, c>
		{
			// InsertMonitor
			Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c = UnsafeMapIterator_c__To__map_c_Map.getNodeEquivalent(wr_c) ;
			if ((node_c == null) ) {
				node_c = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
				UnsafeMapIterator_c__To__map_c_Map.putNode(wr_c, node_c) ;
				node_c.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
			}
			UnsafeMapIteratorMonitor_Set targetSet = node_c.getValue1() ;
			targetSet.add(created) ;
		}
	}
	// D(X) main:6
	UnsafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
	disableUpdatedLeaf.setDisable(UnsafeMapIterator_timestamp++) ;
}
// D(X) main:8--9
UnsafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
stateTransitionedSet.event_createColl(map, c);

if ((cachehit == false) ) {
	UnsafeMapIterator_map_c_Map_cachekey_c = c;
	UnsafeMapIterator_map_c_Map_cachekey_map = map;
	UnsafeMapIterator_map_c_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void UnsafeMapIterator_createIterEvent(Collection c, Iterator i) {
UnsafeMapIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_c = null;
CachedWeakReference wr_i = null;
Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if (((c == UnsafeMapIterator_c_i_Map_cachekey_c) && (i == UnsafeMapIterator_c_i_Map_cachekey_i) ) ) {
	matchedEntry = UnsafeMapIterator_c_i_Map_cachevalue;
	cachehit = true;
}
else {
	wr_c = new CachedWeakReference(c) ;
	wr_i = new CachedWeakReference(i) ;
	{
		// FindOrCreateEntry
		MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c = UnsafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
		if ((node_c == null) ) {
			node_c = new MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ;
			UnsafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
		}
		Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
		if ((node_c_i == null) ) {
			node_c_i = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
			node_c.putNode(wr_i, node_c_i) ;
			node_c_i.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_c_i;
	}
}
// D(X) main:1
UnsafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_c == null) ) {
		wr_c = new CachedWeakReference(c) ;
	}
	if ((wr_i == null) ) {
		wr_i = new CachedWeakReference(i) ;
	}
	{
		// D(X) createNewMonitorStates:4 when Dom(theta'') = <c>
		UnsafeMapIteratorMonitor_Set sourceSet = null;
		{
			// FindCode
			Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c = UnsafeMapIterator_c__To__map_c_Map.getNodeEquivalent(wr_c) ;
			if ((node_c != null) ) {
				UnsafeMapIteratorMonitor_Set itmdSet = node_c.getValue1() ;
				sourceSet = itmdSet;
			}
		}
		if ((sourceSet != null) ) {
			int numalive = 0;
			int setlen = sourceSet.getSize() ;
			for (int ielem = 0; (ielem < setlen) ;++ielem) {
				UnsafeMapIteratorMonitor sourceMonitor = sourceSet.get(ielem) ;
				if ((!sourceMonitor.isTerminated() && (sourceMonitor.RVMRef_map.get() != null) ) ) {
					sourceSet.set(numalive++, sourceMonitor) ;
					CachedWeakReference wr_map = sourceMonitor.RVMRef_map;
					MapOfMonitor<IUnsafeMapIteratorMonitor> destLastMap = null;
					IUnsafeMapIteratorMonitor destLeaf = null;
					{
						// FindOrCreate
						Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
						if ((node_map == null) ) {
							node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
							UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
							node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
							node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
						}
						Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
						if ((node_map_c == null) ) {
							node_map_c = new Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
							node_map.getValue1() .putNode(wr_c, node_map_c) ;
							node_map_c.setValue1(new MapOfMonitor<IUnsafeMapIteratorMonitor>(2) ) ;
							node_map_c.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
						}
						MapOfMonitor<IUnsafeMapIteratorMonitor> itmdMap = node_map_c.getValue1() ;
						destLastMap = itmdMap;
						IUnsafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
						destLeaf = node_map_c_i;
					}
					if (((destLeaf == null) || destLeaf instanceof UnsafeMapIteratorDisableHolder) ) {
						boolean definable = true;
						// D(X) defineTo:1--5 for <c, i>
						if (definable) {
							// FindCode
							MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c = UnsafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
							if ((node_c != null) ) {
								Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
								if ((node_c_i != null) ) {
									UnsafeMapIteratorMonitor itmdLeaf = node_c_i.getValue2() ;
									if ((itmdLeaf != null) ) {
										if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <i>
						if (definable) {
							// FindCode
							Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_i = UnsafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
							if ((node_i != null) ) {
								UnsafeMapIteratorMonitor itmdLeaf = node_i.getValue2() ;
								if ((itmdLeaf != null) ) {
									if (((itmdLeaf.getDisable() > sourceMonitor.getTau() ) || ((itmdLeaf.getTau() > 0) && (itmdLeaf.getTau() < sourceMonitor.getTau() ) ) ) ) {
										definable = false;
									}
								}
							}
						}
						// D(X) defineTo:1--5 for <map, c, i>
						if (definable) {
							// FindCode
							Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
							if ((node_map != null) ) {
								Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c != null) ) {
									IUnsafeMapIteratorMonitor node_map_c_i = node_map_c.getValue1() .getNodeEquivalent(wr_i) ;
									if ((node_map_c_i != null) ) {
										if (((node_map_c_i.getDisable() > sourceMonitor.getTau() ) || ((node_map_c_i.getTau() > 0) && (node_map_c_i.getTau() < sourceMonitor.getTau() ) ) ) ) {
											definable = false;
										}
									}
								}
							}
						}
						if (definable) {
							// D(X) defineTo:6
							UnsafeMapIteratorMonitor created = (UnsafeMapIteratorMonitor)sourceMonitor.clone() ;
							created.RVMRef_i = wr_i;
							created.monitorInfo.isFullParam = true;

							destLastMap.putNode(wr_i, created) ;
							// D(X) defineTo:7 for <c, i>
							{
								// InsertMonitor
								MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c = UnsafeMapIterator_c_i_Map.getNodeEquivalent(wr_c) ;
								if ((node_c == null) ) {
									node_c = new MapOfSetMonitor<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ;
									UnsafeMapIterator_c_i_Map.putNode(wr_c, node_c) ;
								}
								Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_c_i = node_c.getNodeEquivalent(wr_i) ;
								if ((node_c_i == null) ) {
									node_c_i = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
									node_c.putNode(wr_i, node_c_i) ;
									node_c_i.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
								}
								UnsafeMapIteratorMonitor_Set targetSet = node_c_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <i>
							{
								// InsertMonitor
								Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_i = UnsafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
								if ((node_i == null) ) {
									node_i = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
									UnsafeMapIterator_i_Map.putNode(wr_i, node_i) ;
									node_i.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
								}
								UnsafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
									UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
								}
								UnsafeMapIteratorMonitor_Set targetSet = node_map.getValue2() ;
								targetSet.add(created) ;
							}
							// D(X) defineTo:7 for <map, c>
							{
								// InsertMonitor
								Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
								if ((node_map == null) ) {
									node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
									UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
									node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
									node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
								}
								Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map_c = node_map.getValue1() .getNodeEquivalent(wr_c) ;
								if ((node_map_c == null) ) {
									node_map_c = new Tuple3<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
									node_map.getValue1() .putNode(wr_c, node_map_c) ;
									node_map_c.setValue1(new MapOfMonitor<IUnsafeMapIteratorMonitor>(2) ) ;
									node_map_c.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
								}
								UnsafeMapIteratorMonitor_Set targetSet = node_map_c.getValue2() ;
								targetSet.add(created) ;
							}
						}
					}
				}
			}
			sourceSet.eraseRange(numalive) ;
		}
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		UnsafeMapIteratorMonitor created = new UnsafeMapIteratorMonitor(UnsafeMapIterator_timestamp++, null, wr_c, wr_i) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue2(created) ;
		UnsafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue1() ;
		enclosingSet.add(created) ;
		// D(X) defineNew:5 for <i>
		{
			// InsertMonitor
			Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_i = UnsafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
			if ((node_i == null) ) {
				node_i = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
				UnsafeMapIterator_i_Map.putNode(wr_i, node_i) ;
				node_i.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
			}
			UnsafeMapIteratorMonitor_Set targetSet = node_i.getValue1() ;
			targetSet.add(created) ;
		}
	}
	// D(X) main:6
	UnsafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	disableUpdatedLeaf.setDisable(UnsafeMapIterator_timestamp++) ;
}
// D(X) main:8--9
UnsafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_createIter(c, i);

if ((cachehit == false) ) {
	UnsafeMapIterator_c_i_Map_cachekey_c = c;
	UnsafeMapIterator_c_i_Map_cachekey_i = i;
	UnsafeMapIterator_c_i_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void UnsafeMapIterator_useIterEvent(Iterator i) {
UnsafeMapIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_i = null;
Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if ((i == UnsafeMapIterator_i_Map_cachekey_i) ) {
	matchedEntry = UnsafeMapIterator_i_Map_cachevalue;
	cachehit = true;
}
else {
	wr_i = new CachedWeakReference(i) ;
	{
		// FindOrCreateEntry
		Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_i = UnsafeMapIterator_i_Map.getNodeEquivalent(wr_i) ;
		if ((node_i == null) ) {
			node_i = new Tuple2<UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
			UnsafeMapIterator_i_Map.putNode(wr_i, node_i) ;
			node_i.setValue1(new UnsafeMapIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_i;
	}
}
// D(X) main:1
UnsafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue2() ;
if ((matchedLeaf == null) ) {
	if ((wr_i == null) ) {
		wr_i = new CachedWeakReference(i) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		UnsafeMapIteratorMonitor created = new UnsafeMapIteratorMonitor(UnsafeMapIterator_timestamp++, null, null, wr_i) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue2(created) ;
		UnsafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue1() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	UnsafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue2() ;
	disableUpdatedLeaf.setDisable(UnsafeMapIterator_timestamp++) ;
}
// D(X) main:8--9
UnsafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue1() ;
stateTransitionedSet.event_useIter(i);

if ((cachehit == false) ) {
	UnsafeMapIterator_i_Map_cachekey_i = i;
	UnsafeMapIterator_i_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

public static final void UnsafeMapIterator_updateMapEvent(Map map) {
UnsafeMapIterator_activated = true;
while (!JavaMOPAgent_1_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_map = null;
Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> matchedEntry = null;
boolean cachehit = false;
if ((map == UnsafeMapIterator_map_Map_cachekey_map) ) {
	matchedEntry = UnsafeMapIterator_map_Map_cachevalue;
	cachehit = true;
}
else {
	wr_map = new CachedWeakReference(map) ;
	{
		// FindOrCreateEntry
		Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor> node_map = UnsafeMapIterator_map_c_i_Map.getNodeEquivalent(wr_map) ;
		if ((node_map == null) ) {
			node_map = new Tuple3<MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>() ;
			UnsafeMapIterator_map_c_i_Map.putNode(wr_map, node_map) ;
			node_map.setValue1(new MapOfAll<MapOfMonitor<IUnsafeMapIteratorMonitor>, UnsafeMapIteratorMonitor_Set, UnsafeMapIteratorMonitor>(1) ) ;
			node_map.setValue2(new UnsafeMapIteratorMonitor_Set() ) ;
		}
		matchedEntry = node_map;
	}
}
// D(X) main:1
UnsafeMapIteratorMonitor matchedLeaf = matchedEntry.getValue3() ;
if ((matchedLeaf == null) ) {
	if ((wr_map == null) ) {
		wr_map = new CachedWeakReference(map) ;
	}
	if ((matchedLeaf == null) ) {
		// D(X) main:4
		UnsafeMapIteratorMonitor created = new UnsafeMapIteratorMonitor(UnsafeMapIterator_timestamp++, wr_map, null, null) ;
		created.monitorInfo = new com.runtimeverification.rvmonitor.java.rt.RVMMonitorInfo();
created.monitorInfo.isFullParam = false;

		matchedEntry.setValue3(created) ;
		UnsafeMapIteratorMonitor_Set enclosingSet = matchedEntry.getValue2() ;
		enclosingSet.add(created) ;
	}
	// D(X) main:6
	UnsafeMapIteratorMonitor disableUpdatedLeaf = matchedEntry.getValue3() ;
	disableUpdatedLeaf.setDisable(UnsafeMapIterator_timestamp++) ;
}
// D(X) main:8--9
UnsafeMapIteratorMonitor_Set stateTransitionedSet = matchedEntry.getValue2() ;
stateTransitionedSet.event_updateMap(map);

if ((cachehit == false) ) {
	UnsafeMapIterator_map_Map_cachekey_map = map;
	UnsafeMapIterator_map_Map_cachevalue = matchedEntry;
}


JavaMOPAgent_1_RVMLock.unlock();
}

}


public aspect JavaMOPAgent_1MonitorAspect implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
	public JavaMOPAgent_1MonitorAspect(){
		Runtime.getRuntime().addShutdownHook(new JavaMOPAgent_1_DummyHookThread());
	}

	// Declarations for the Lock
	static ReentrantLock JavaMOPAgent_1_MOPLock = new ReentrantLock();
	static Condition JavaMOPAgent_1_MOPLock_cond = JavaMOPAgent_1_MOPLock.newCondition();

	pointcut MOP_CommonPointCut() : !within(com.runtimeverification.rvmonitor.java.rt.RVMObject+) && !adviceexecution() && BaseAspect.notwithin();
	pointcut SafeSyncCollection_accessIter(Iterator iter) : (call(* Iterator.*(..)) && target(iter)) && MOP_CommonPointCut();
	before (Iterator iter) : SafeSyncCollection_accessIter(iter) {
		//SafeSyncMap_accessIter
		JavaMOPAgent_1RuntimeMonitor.SafeSyncMap_accessIterEvent(iter);
		//SafeSyncCollection_accessIter
		JavaMOPAgent_1RuntimeMonitor.SafeSyncCollection_accessIterEvent(iter);
	}

	pointcut SafeFileWriter_write(FileWriter f) : (call(* write(..)) && target(f)) && MOP_CommonPointCut();
	before (FileWriter f) : SafeFileWriter_write(f) {
		JavaMOPAgent_1RuntimeMonitor.SafeFileWriter_writeEvent(f);
	}

	pointcut SafeFile_begin() : (execution(* *.*(..))) && MOP_CommonPointCut();
	before () : SafeFile_begin() {
		Thread t = Thread.currentThread();
		JavaMOPAgent_1RuntimeMonitor.SafeFile_beginEvent(t);
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
		//UnsafeIterator_next
		JavaMOPAgent_1RuntimeMonitor.UnsafeIterator_nextEvent(i);
		//SafeMapIterator_useIter
		JavaMOPAgent_1RuntimeMonitor.SafeMapIterator_useIterEvent(i);
		//SafeIterator_next
		JavaMOPAgent_1RuntimeMonitor.SafeIterator_nextEvent(i);
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
		//HasNext_create
		JavaMOPAgent_1RuntimeMonitor.HasNext_createEvent(c, i);
		//SafeIterator_create
		JavaMOPAgent_1RuntimeMonitor.SafeIterator_createEvent(c, i);
		//UnsafeIterator_create
		JavaMOPAgent_1RuntimeMonitor.UnsafeIterator_createEvent(c, i);
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

	pointcut SafeFile_open() : (call(FileReader.new(..))) && MOP_CommonPointCut();
	after () returning (FileReader f) : SafeFile_open() {
		Thread t = Thread.currentThread();
		JavaMOPAgent_1RuntimeMonitor.SafeFile_openEvent(t, f);
	}

	pointcut SafeFile_close(FileReader f) : (call(* FileReader.close(..)) && target(f)) && MOP_CommonPointCut();
	after (FileReader f) : SafeFile_close(f) {
		Thread t = Thread.currentThread();
		JavaMOPAgent_1RuntimeMonitor.SafeFile_closeEvent(f, t);
	}

	pointcut SafeFile_end() : (execution(* *.*(..))) && MOP_CommonPointCut();
	after () : SafeFile_end() {
		Thread t = Thread.currentThread();
		JavaMOPAgent_1RuntimeMonitor.SafeFile_endEvent(t);
	}

	pointcut SafeFileWriter_open() : (call(FileWriter.new(..))) && MOP_CommonPointCut();
	after () returning (FileWriter f) : SafeFileWriter_open() {
		JavaMOPAgent_1RuntimeMonitor.SafeFileWriter_openEvent(f);
	}

	pointcut SafeFileWriter_close(FileWriter f) : (call(* close(..)) && target(f)) && MOP_CommonPointCut();
	after (FileWriter f) : SafeFileWriter_close(f) {
		JavaMOPAgent_1RuntimeMonitor.SafeFileWriter_closeEvent(f);
	}

	pointcut SafeIterator_updatesource(Collection c) : ((call(* Collection+.remove*(..)) || call(* Collection+.add*(..))) && target(c)) && MOP_CommonPointCut();
	after (Collection c) : SafeIterator_updatesource(c) {
		//SafeIterator_updatesource
		JavaMOPAgent_1RuntimeMonitor.SafeIterator_updatesourceEvent(c);
		//UnsafeIterator_updatesource
		JavaMOPAgent_1RuntimeMonitor.UnsafeIterator_updatesourceEvent(c);
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
