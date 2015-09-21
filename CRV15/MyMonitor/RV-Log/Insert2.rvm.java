package rvm;

/**
* Try the approach of meta-event (manually do the code instrumentation).
* The event with more params will be analyzed and then,
* according to the value of specific field, trigger the 
* corresponding event methods with fewer parameters.

* Another possible approach would be using AspectJ to instrument the log reader,
* so that the right event method will be invoked inside the advice. That approach
* is semi-automated and will be tried on the same property, in another (.mop) file. 
*/
Insert2(String data) {
static 

static void updateTime(long time) {}

static void check(long time) {}

    event insert(String user, String db, String p, String data, long time)
	{
		if (db != null && db.equals("db2"))
		{
			timer.put(data, time+60);
		} 

		if (db != null && db.equals("db3"))
		{
			
		} 
	}


event select (String user,String b,String c,String d, long time) {}

event update (String user,String b,String c,String d, long time) {}

event delete (String user,String b,String c,String d, long time) {}

event script_start (String user, long time) {}

event script_end (String user, long time) {}

event script_svn (String user,String b,String c,int d,int e, long time) {}

event script_md5 (String user,String b, long time) {}

event commit (String user,int b, long time) {}

/*
	ltl:
		insert2DB2 => <>insert2DB3

	@fail
	{System.err.println("The data is not propagated to db3 after inserting to db2.");}
*/
}


