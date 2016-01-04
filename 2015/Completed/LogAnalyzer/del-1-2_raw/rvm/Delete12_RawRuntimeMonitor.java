package rvm;
import rvm.LogEntryExtractor;
import rvm.LogReader;
import java.lang.Comparable;
import java.lang.Override;
import java.util.ArrayList;
import java.util.HashSet;
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

final class Delete12_RawRawMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<Delete12_RawRawMonitor> {

Delete12_RawRawMonitor_Set(){
this.size = 0;
this.elements = new Delete12_RawRawMonitor[4];
}
final void event_delete(String user, String db, String p, String data) {
int numAlive = 0 ;
for(int i = 0; i < this.size; i++){
Delete12_RawRawMonitor monitor = this.elements[i];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

monitor.event_delete(user, db, p, data);
}
}
for(int i = numAlive; i < this.size; i++){
this.elements[i] = null;
}
size = numAlive;
}
final void event_insert(String user, String db, String p, String data) {
int numAlive = 0 ;
for(int i = 0; i < this.size; i++){
Delete12_RawRawMonitor monitor = this.elements[i];
if(!monitor.isTerminated()){
elements[numAlive] = monitor;
numAlive++;

monitor.event_insert(user, db, p, data);
}
}
for(int i = numAlive; i < this.size; i++){
this.elements[i] = null;
}
size = numAlive;
}
}

class Delete12_RawRawMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
protected Object clone() {
try {
Delete12_RawRawMonitor ret = (Delete12_RawRawMonitor) super.clone();
return ret;
}
catch (CloneNotSupportedException e) {
throw new InternalError(e.toString());
}
}


//cache the index of monitors to achieve indexing by value (temporal fix)
protected static HashMap<String,String> indexMap = new HashMap<>();
private State curState = State.Start;
private long ts;
private String user;
private boolean e4Holds;
private boolean e7Holds;

private static enum State {
    //C1 is the first condition on the r.h.s of the implication
    //C2_1, C2_2 refer the two sub-formulas inside the second condition
    //The order of these states should NOT be changed.
    Start, Check, Unsafe, Safe,
    C1Fail, C2_1Pass, C2_2Pass,
    C2Fail, C1Fail_AND_C2_1Pass, C1Fail_AND_C2_2Pass
}

/**
 * Base on the values of the events' arguments, the monitor's state may be updated to different
 * new states. To represent this process using fsm, we can first analyze the event arguments,
 * then we can summarize a list of more accurate events, with which we can build the full
 * transition functions.
 * <p/>
 * Different accurate events are described here:
 * E1: the event that makes monitor enter State.Check state.
 * E2: the event that makes C1 hold.
 * E3: the event that makes C1 NOT hold.
 * E4: the event that makes C2_1 hold.
 * E5: the event that makes C2_1 NOT hold.
 * E6: the event that makes C2_2 hold.
 * E7: the event that makes C2_2 NOT hold.
 * The int arrays with name 'Ei' below are transition functions.
 * For example, array E1 is in fact a function that maps its index (input state) to value
 * (output state resulting from updating input state via event E1).
 */
private static State[] E1 = new State[]{State.Check,State.Check,State.Unsafe,State.Safe,State.C1Fail,State.C2_1Pass,State.C2_2Pass,State.C2Fail,
        State.C1Fail_AND_C2_1Pass,State.C1Fail_AND_C2_2Pass};

private static State[] E2 = new State[]{State.Start,State.Safe,State.Unsafe,State.Safe,State.Safe,State.Safe,State.Safe,State.Safe,State.Safe,State.Safe};

private static State[] E3 = new State[]{State.Start,State.C1Fail,State.Unsafe,State.Safe,State.C1Fail,State.C1Fail_AND_C2_1Pass,
        State.C1Fail_AND_C2_2Pass,State.Unsafe,State.C1Fail_AND_C2_1Pass,State.C1Fail_AND_C2_2Pass};

private static State[] E4 = new State[]{State.Start,State.C2_1Pass,State.Unsafe,State.Safe,State.C1Fail_AND_C2_1Pass,State.C2_1Pass,
        State.Safe,State.C2Fail,State.C1Fail_AND_C2_1Pass,State.Safe};

private static State[] E5 = new State[]{State.Start,State.C2Fail,State.Unsafe,State.Safe,State.Unsafe,State.C2Fail,State.C2Fail,
        State.C2Fail,State.Unsafe,State.Unsafe};

private static State[] E6 = new State[]{State.Start,State.C2_2Pass,State.Unsafe,State.Safe,State.C1Fail_AND_C2_2Pass,State.Safe,
        State.C2_2Pass,State.C2Fail,State.Safe,State.C1Fail_AND_C2_2Pass};

private static State[] E7 = new State[]{State.Start,State.C2Fail,State.Unsafe,State.Safe,State.Unsafe,State.C2Fail,State.C2Fail,
        State.C2Fail,State.Unsafe,State.Unsafe};



 private void resetState() {
    this.curState = State.Start;
 }


/**
 * This data structure represents a record that describes which user deletes what data at what time.
 */
public static class DeleteRecord implements Comparable<DeleteRecord> {
    public final long ts;
    public final String user;
    public final String deleteData;

    public DeleteRecord(long ts, String user, String deleteData) {
        this.ts = ts;
        this.user = user;
        this.deleteData = deleteData;
    }

    public boolean equals(DeleteRecord other) {
        if (other == null)
            return false;
        if (this.ts != other.ts)
            return false;

        return (this.user.equals(other.user) &&
                this.deleteData.equals(other.deleteData));
    }

    public String print() {
        return "@" + ts + " delete (" + user + ", db1, " + deleteData + ")\n";
    }

    @Override
    public int compareTo(DeleteRecord other) {
        return (int) (this.ts - other.ts);
    }
}


    public static void printAllViolations() {
        ArrayList<DeleteRecord> listOfViolations = new ArrayList<>();

        for (String ref :  indexMap.keySet()) {
            Delete12_RawRawMonitor monitor = Delete12_RawRuntimeMonitor.Delete12_Raw_data_Map.getNodeWithStrongRef(ref);
            if (monitor != null && monitor.curState != State.Start) {
                listOfViolations.add(new DeleteRecord(monitor.ts, monitor.user, ref));
            }
        }

        listOfViolations.sort(new Comparator<DeleteRecord>() {
            @Override
            public int compare(DeleteRecord o1, DeleteRecord o2) {
                return (int) (o1.ts - o2.ts);
            }
        });

        for (int i = 0; i < listOfViolations.size(); i++) {
            System.out.println(listOfViolations.get(i).print());
        }
    }


@Override
public final int getState() {
return -1;
}

final boolean event_delete(String user, String db, String p, String data) {
RVM_lastevent = 0;
{
        if (data.equals("unknown")) //Unknown data does not affect the state of monitor at all
            return true;


        if (db.equals("db1")) {
            //E1 occurs
            this.curState = E1[this.curState.ordinal()];

            this.ts = LogEntryExtractor.TimeStamp;
            this.user = user;

        } else if (db.equals("db2")) {
            //E2 occurs
            this.curState = E2[this.curState.ordinal()];
        } else {
        }

    

        if (this.e4Holds) {
            this.curState = E4[this.curState.ordinal()];
        }

        if (this.e7Holds) {
            this.curState = E7[this.curState.ordinal()];
        }
        // record the violation entry
        if (this.curState == State.Unsafe)
            System.out.println("@" + LogEntryExtractor.TimeStamp + " delete (" + user + ", db1, " +
            data + ")");

        if (this.curState == State.Unsafe || this.curState == State.Safe){
            this.resetState();
        }
}
return true;
}

final boolean event_insert(String user, String db, String p, String data) {
RVM_lastevent = 1;
{
        if (data.equals("unknown"))
            return true;

        if (db.equals("db1")) {
            //E4 occurs, cond 2-1 begins to hold
            this.curState = E4[this.curState.ordinal()];
            this.e4Holds = true;
        } else if (db.equals("db2")) {
            //E7 occurs, cond 2-2 does not hold now
            this.curState = E7[this.curState.ordinal()];
            this.e7Holds = true;
        }
    

        if (this.e4Holds) {
            this.curState = E4[this.curState.ordinal()];
        }

        if (this.e7Holds) {
            this.curState = E7[this.curState.ordinal()];
        }
        // record the violation entry
        if (this.curState == State.Unsafe)
            System.out.println("@" + LogEntryExtractor.TimeStamp + " delete (" + user + ", db1, " +
            data + ")");

        if (this.curState == State.Unsafe || this.curState == State.Safe){
            this.resetState();
        }
}
return true;
}

final void reset() {
RVM_lastevent = -1;
}

// RVMRef_data was suppressed to reduce memory overhead


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
//delete
return;
case 1:
//insert
return;
}
return;
}


}

public final class Delete12_RawRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager Delete12_RawMapManager;
static {
Delete12_RawMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
Delete12_RawMapManager.start();
}

// Declarations for the Lock 
static final ReentrantLock Delete12_Raw_RVMLock = new ReentrantLock();
static final Condition Delete12_Raw_RVMLock_cond = Delete12_Raw_RVMLock.newCondition();

private static boolean Delete12_Raw_activated = false;

// Declarations for Indexing Trees 
private static Object Delete12_Raw_data_Map_cachekey_data;
private static Delete12_RawRawMonitor Delete12_Raw_data_Map_cachevalue;
protected static final MapOfMonitor<Delete12_RawRawMonitor> Delete12_Raw_data_Map = new MapOfMonitor<Delete12_RawRawMonitor>(0) ;


public static int cleanUp() {
int collected = 0;
// indexing trees
collected += Delete12_Raw_data_Map.cleanUpUnnecessaryMappings();
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

public static final void deleteEvent(String user, String db, String p, String data) {
if (Delete12_RawRawMonitor.indexMap.get(data) == null) {
                Delete12_RawRawMonitor.indexMap.put(data,data);
            } else
            data = Delete12_RawRawMonitor.indexMap.get(data);

Delete12_Raw_activated = true;
while (!Delete12_Raw_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_data = null;
MapOfMonitor<Delete12_RawRawMonitor> matchedLastMap = null;
Delete12_RawRawMonitor matchedEntry = null;
boolean cachehit = false;
if ((data == Delete12_Raw_data_Map_cachekey_data) ) {
	matchedEntry = Delete12_Raw_data_Map_cachevalue;
	cachehit = true;
}
else {
	wr_data = new CachedWeakReference(data) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<Delete12_RawRawMonitor> itmdMap = Delete12_Raw_data_Map;
		matchedLastMap = itmdMap;
		Delete12_RawRawMonitor node_data = Delete12_Raw_data_Map.getNodeEquivalent(wr_data) ;
		matchedEntry = node_data;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_data == null) ) {
		wr_data = new CachedWeakReference(data) ;
	}
	// D(X) main:4
	Delete12_RawRawMonitor created = new Delete12_RawRawMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_data, created) ;
}
// D(X) main:8--9
matchedEntry.event_delete(user, db, p, data);

if ((cachehit == false) ) {
	Delete12_Raw_data_Map_cachekey_data = data;
	Delete12_Raw_data_Map_cachevalue = matchedEntry;
}


Delete12_Raw_RVMLock.unlock();
}

public static final void insertEvent(String user, String db, String p, String data) {
if (Delete12_RawRawMonitor.indexMap.get(data) == null) {
                Delete12_RawRawMonitor.indexMap.put(data,data);
            } else
            data = Delete12_RawRawMonitor.indexMap.get(data);

Delete12_Raw_activated = true;
while (!Delete12_Raw_RVMLock.tryLock()) {
Thread.yield();
}

CachedWeakReference wr_data = null;
MapOfMonitor<Delete12_RawRawMonitor> matchedLastMap = null;
Delete12_RawRawMonitor matchedEntry = null;
boolean cachehit = false;
if ((data == Delete12_Raw_data_Map_cachekey_data) ) {
	matchedEntry = Delete12_Raw_data_Map_cachevalue;
	cachehit = true;
}
else {
	wr_data = new CachedWeakReference(data) ;
	{
		// FindOrCreateEntry
		MapOfMonitor<Delete12_RawRawMonitor> itmdMap = Delete12_Raw_data_Map;
		matchedLastMap = itmdMap;
		Delete12_RawRawMonitor node_data = Delete12_Raw_data_Map.getNodeEquivalent(wr_data) ;
		matchedEntry = node_data;
	}
}
// D(X) main:1
if ((matchedEntry == null) ) {
	if ((wr_data == null) ) {
		wr_data = new CachedWeakReference(data) ;
	}
	// D(X) main:4
	Delete12_RawRawMonitor created = new Delete12_RawRawMonitor() ;
	matchedEntry = created;
	matchedLastMap.putNode(wr_data, created) ;
}
// D(X) main:8--9
matchedEntry.event_insert(user, db, p, data);

if ((cachehit == false) ) {
	Delete12_Raw_data_Map_cachekey_data = data;
	Delete12_Raw_data_Map_cachevalue = matchedEntry;
}


Delete12_Raw_RVMLock.unlock();
}

}
