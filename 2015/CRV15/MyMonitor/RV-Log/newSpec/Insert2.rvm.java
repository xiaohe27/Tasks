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
        System.err.println("expected data '" + monitor.dat + "' is not inserted into db3 before time " + monitor.deadline);
	System.exit(1);
        }
        }
        }

private boolean ok;

private long deadline;
private String dat;

    event insert(String user, String db, String p, String data, long time)
	{
        check(time);

		if (db != null && db.equals("db2"))
		{
	    this.ok = false;
            this.deadline = time+60;
	    this.dat = data;

        monitorList.add(this);
		}

		if (db != null && db.equals("db3"))
		{
		    ok = true;	
		} 
	}


event select (String user,String b,String c,String d, long time) {        check(time);}

event update (String user,String b,String c,String d, long time) {        check(time);}

event delete (String user,String b,String c,String d, long time) {        check(time);}

event script_start (String user, long time) {        check(time);}

event script_end (String user, long time) {        check(time);}

event script_svn (String user,String b,String c,int d,int e, long time) {        check(time);}

event script_md5 (String user,String b, long time) {        check(time);}

event commit (String user,int b, long time) {        check(time);}

}


