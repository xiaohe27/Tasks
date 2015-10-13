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
long createTime;
boolean insertedToDB1;
boolean allPastNotInsertedToDB2;

public Record(long cTime) {
this.createTime = cTime;

this.insertedToDB1 = withinBackwardBound(cTime, ins_db1_time);
this.allPastNotInsertedToDB2 = !withinBackwardBound(cTime, ins_db2_time);
}
}

private long ins_db1_time = -1;
private long ins_db2_time = -1;
private long del_db2_time = -1;

private ArrayList<Record> del_db1_records = new ArrayList<>();

public static final String DB1 = "db1";
public static final String DB2 = "db2";

creation event insert(String user, String db, String p, String data, long time)
{
    check(time);

}

creation event delete (String user,String db,String p,String data, long time) 
{
    check(time);
    
    if (db.equals(DB1)) {
	this.del_db1_records.add(new Record(time));
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









