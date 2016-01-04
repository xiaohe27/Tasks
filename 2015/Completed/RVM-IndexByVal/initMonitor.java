public void eventMethod(String arg1, String arg2, ..., String argN) {

	int N = someKnownNum;
	String[] indexArr = initArr;	
	HashMap<n string... Monitor> curMap = someMapWithTopLevelInitialized;
	Monitor curMonitor = null;
	boolean succ = false;

	for (int i=1; i< N; i++)
	{
	HashMap<N-i string, Monitor> tmpMap = curMap.get(arg_i);
	if(tmpMap != null) {
		curMap = tmpMap;
	}

	else {
		curMonitor = new Monitor();
		HashMap<N-i string, Monitor> n_iMap = createSubMap(argi+1,...,argN,curMonitor);
		curMap.put(arg_i, n_iMap);
		succ = true;
		break;
	}
	}

	if(!succ) { //for the last index
		curMonitor = curMap.get(arg_N);
		if (curMonitor == null) {
			curMonitor = new Monitor();
			curMap.put(arg_N, curMonitor);
		}
	}

	//cur working on:

	//update monitor

	//OK: createSubMap is real function that implemented in the application, 
	//NOT the generated code!

}

HashMap createSubMap(String[] indexArr, com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor monitor);
