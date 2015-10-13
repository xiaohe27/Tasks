package rvm;
import java.io.*;
import java.util.*;


Del12(String data) {

public static final timeBound = 30 * 60 * 60; // 30h = 30 * 60 * 60 seconds.

public static boolean withinForwardBound(long baseT, long curT) {
    return curT >= baseT && curT < baseT + timeBound;
}

public static boolean withinBackwardBound(long baseT, long curT) {
    return curT >= 0 &&  curT > baseT - timeBound && curT <= baseT;
}



public static class Record {
final long dueTime;

    boolean delDataFromDB2;
final boolean insertedToDB1;
final boolean allPastNotInsertedToDB2;

    boolean alwaysNotInsertedToDB2;

public Record(long cTime) {
this.dueTime = cTime + timeBound;

this.delDataFromDB2 = (cTime == del_db2_time);
this.insertedToDB1 = withinBackwardBound(cTime, ins_db1_time);
this.allPastNotInsertedToDB2 = !withinBackwardBound(cTime, ins_db2_time);

this.alwaysNotInsertedToDB2 = (cTime != ins_db2_time);
}

    public boolean isSAT () {
	return delDataFromDB2 || (insertedToDB1 && allPastNotInsertedToDB2 && alwaysNotInsertedToDB2);
    }

    public String toString() {
	return "Del " + data + " from db1 @" + (dueTime - timeBound) + "\n"; 
    }
    
}

public static void check(long time) {
    for (int i = 0; i < monitors.size(); i++) {
	Del2Monitor monitor = monitors.get(i);
	
	if (time < monitor.firstDueTime) {return;}

	monitor.checkLocalRecords(time);

	if (monitor.del_db1_records.isEmpty()) {
	    monitors.remove(i);
	    i--;
	} 
    }
}

private long firstDueTime;

private long ins_db1_time = -1;
private long ins_db2_time = -1;
private long del_db2_time = -1;

//for debugging purpose.
private String data;

private ArrayList<Record> del_db1_records = new ArrayList<>();

private static final ArrayList<Del12Monitor> monitors = new ArrayList<>();


public static final String DB1 = "db1";
public static final String DB2 = "db2";
public static final String UNKNOWN = "[unknown]";


public void checkLocalRecords(long curT) {
    for (int i = 0; i < this.del_db1_records.size(); i++) {
	Record record = this.del_db1_records.get(i);
	boolean due = (curT >= record.dueTime);

	if (due) {
	    if (record.isSAT()) {
		this.del_db1_records.remove(i);
		i--;
	    }
	    
	    else {
		System.err.println("Property violated!");
		System.err.println(record);
		System.exit(2);
	    }
	}

	else {return;}
    }

}

private void  update_del_db2(long time) {
    //in time interval (time-timeBound, time], deleteDataFromDB2 is satisfied.
    //delDataFromDB2
    for (int i = 0; i < this.del_db1_records.size(); i++) {
	Record record = this.del_db1_records.get(i);

	if (time < record.dueTime) {
	    for (int j = i; j < this.del_db1_records.size(); j++) {	       
		this.del_db1_records[j].delDataFromDB2 = true;
	    }
	    return;
	}
    }
}


private void  update_ins_db2(long time) {
    //in time interval (time-timeBound, time],  alwaysNotInsertedToDB2 is falsified.
    // alwaysNotInsertedToDB2
    for (int i = 0; i < this.del_db1_records.size(); i++) {
	Record record = this.del_db1_records.get(i);

	if (time < record.dueTime) {
	    for (int j = i; j < this.del_db1_records.size(); j++) {	       
		this.del_db1_records[j].alwaysNotInsertedToDB2 = false;
	    }
	    return;
	}
    }
}


creation event insert(String user, String db, String p, String data, long time)
{
    check(time);

    if (UNKNOWN.equals(data)) {return;}

    if (DB1.equals(db)) {
	this. ins_db1_time = time;
    } else if (DB2.equals(db)) {
	this.ins_db2_time = time;
	this.update_ins_db2(time);
    }

}

creation event delete (String user,String db,String p,String data, long time) 
{
    check(time);

     if (UNKNOWN.equals(data)) {return;}

     //can be removed to improve efficiency.
     this.data = data;
     
    
    if (db.equals(DB1)) {
	
	this.del_db1_records.add(new Record(time));

	if (!monitors.contains(this))
       {
	   monitors.add(this);
	   this.firstDueTime = time + timeBound;
	}

    } else if (db.equals(DB2)) {
	this.del_db2_time = time;

	//update: all the records within [0, timeBound) in the past can be satisfied now.
	update_del_db2(time);
    }

    
}


//update time, goint to be static event.
event select (String user,String b,String c,String d, long time) {        check(time);}

event update (String user,String b,String c,String d, long time) {        check(time);}


event script_start (String user, long time) {        check(time);}

event script_end (String user, long time) {        check(time);}

event script_svn (String user,String b,String c,int d,int e, long time) {        check(time);}

event script_md5 (String user,String b, long time) {        check(time);}

event commit (String user,int b, long time) {        check(time);}

ltl: true
	@fail
	{System.err.println("...");}

}









