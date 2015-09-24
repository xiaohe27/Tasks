Insert2(String data) {
static LinkedList<Insert2RawMonitor> monitorList = new LinkedList<>();

static void check(long time){
        int size=monitorList.size();

        while(!monitorList.isEmpty()){
        Insert2RawMonitor monitor = monitorList.getFirst();
        if(monitor.deadline>time)
        return;

        if(monitor.ok)
           monitorList.removeFirst();

        else{
        System.out.println("expected data is not inserted into db3 before time " + );
        }
        }
        }

private boolean ok;

private long deadline;

    event insert(String user, String db, String p, String data, long time)
	{
		if (db != null && db.equals("db2"))
		{
            this.deadline = time+60;

        monitorList.add(this);

        check(time);
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


