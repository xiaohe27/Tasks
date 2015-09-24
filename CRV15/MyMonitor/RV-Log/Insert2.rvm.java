package rvm;

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

}


