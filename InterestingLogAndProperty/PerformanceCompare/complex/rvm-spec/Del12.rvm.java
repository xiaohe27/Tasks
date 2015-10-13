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
final long createTime;

    boolean delDataFromDB2;
final boolean insertedToDB1;
final boolean allPastNotInsertedToDB2;

    boolean alwaysNotInsertedToDB2;

public Record(long cTime) {
this.createTime = cTime;

this.delDataFromDB2 = (cTime == del_db2_time);
this.insertedToDB1 = withinBackwardBound(cTime, ins_db1_time);
this.allPastNotInsertedToDB2 = !withinBackwardBound(cTime, ins_db2_time);

this.alwaysNotInsertedToDB2 = (cTime != ins_db2_time);
}

    public boolean isSAT () {
	return delDataFromDB2 || (insertedToDB1 && allPastNotInsertedToDB2 && alwaysNotInsertedToDB2);
    }
    
}

public static check(long time) {
    
}

private long monitorInitTime;

private long ins_db1_time = -1;
private long ins_db2_time = -1;
private long del_db2_time = -1;

private ArrayList<Record> del_db1_records = new ArrayList<>();

private static final ArrayList<Del12Monitor> monitors = new ArrayList<>();


public static final String DB1 = "db1";
public static final String DB2 = "db2";
public static final String UNKNOWN = "[unknown]";




creation event insert(String user, String db, String p, String data, long time)
{
    check(time);

    if (UNKNOWN.equals(data)) {return;}

}

creation event delete (String user,String db,String p,String data, long time) 
{
    check(time);

     if (UNKNOWN.equals(data)) {return;}
    
    if (db.equals(DB1)) {
	
	this.del_db1_records.add(new Record(time));

	if (!monitors.contains(this))
       {
	   monitors.add(this);
	   this.monitorInitTime = time;
	}

    } else if (db.equals(DB2)) {
	this.del_db2_time = time;

	//update: all the records within [0, timeBound) in the past can be satisfied now. 
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









