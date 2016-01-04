package rvm;
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

final class InsertRawMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<InsertRawMonitor> {

	InsertRawMonitor_Set(){
		this.size = 0;
		this.elements = new InsertRawMonitor[4];
	}
	final void event_insert(String user, String db, String p, String data) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			InsertRawMonitor monitor = this.elements[i];
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
final class MoreRawMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<MoreRawMonitor> {

	MoreRawMonitor_Set(){
		this.size = 0;
		this.elements = new MoreRawMonitor[4];
	}
	final void event_select(String user, String b, String c, String d) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			MoreRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_select(user, b, c, d);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_update(String user, String b, String c, String d) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			MoreRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_update(user, b, c, d);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_delete(String user, String b, String c, String d) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			MoreRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_delete(user, b, c, d);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_script_start(String user) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			MoreRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_script_start(user);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_script_end(String user) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			MoreRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_script_end(user);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_script_svn(String user, String b, String c, int d, int e) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			MoreRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_script_svn(user, b, c, d, e);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_script_md5(String user, String b) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			MoreRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_script_md5(user, b);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_commit(String user, int b) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			MoreRawMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				monitor.event_commit(user, b);
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
}
final class PubMonitor_Set extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractMonitorSet<PubMonitor> {

	PubMonitor_Set(){
		this.size = 0;
		this.elements = new PubMonitor[4];
	}
	final void event_publish(Integer report) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			PubMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final PubMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_publish(report);
				if(monitorfinalMonitor.Prop_1_Category_violation) {
					monitorfinalMonitor.Prop_1_handler_violation();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
	final void event_approve(Integer report) {
		int numAlive = 0 ;
		for(int i = 0; i < this.size; i++){
			PubMonitor monitor = this.elements[i];
			if(!monitor.isTerminated()){
				elements[numAlive] = monitor;
				numAlive++;

				final PubMonitor monitorfinalMonitor = monitor;
				monitor.Prop_1_event_approve(report);
				if(monitorfinalMonitor.Prop_1_Category_violation) {
					monitorfinalMonitor.Prop_1_handler_violation();
				}
			}
		}
		for(int i = numAlive; i < this.size; i++){
			this.elements[i] = null;
		}
		size = numAlive;
	}
}

class InsertRawMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
	protected static long Insert_Monitor_num = 0;
	protected static long Insert_CollectedMonitor_num = 0;
	protected static long Insert_TerminatedMonitor_num = 0;
	protected static long Insert_insert_num = 0;

	public static long getTotalMonitorCount() {
		return Insert_Monitor_num;
	}
	public static long getCollectedMonitorCount() {
		return Insert_CollectedMonitor_num;
	}
	public static long getTerminatedMonitorCount() {
		return Insert_TerminatedMonitor_num;
	}
	public static Map<String, Long> getEventCounters() {
		HashMap<String, Long> eventCounters = new HashMap<String, Long>();
		eventCounters.put("insert", Insert_insert_num);
		return eventCounters;
	}
	public static Map<String, Long> getCategoryCounters() {
		HashMap<String, Long> categoryCounters = new HashMap<String, Long>();
		return categoryCounters;
	}

	protected Object clone() {
		Insert_Monitor_num++;
		try {
			InsertRawMonitor ret = (InsertRawMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	public static boolean hasViolation;

	public InsertRawMonitor() {
		Insert_Monitor_num++;
		}@Override
		public final int getState() {
			return -1;
		}

		final boolean event_insert(String user, String db, String p, String data) {
			RVM_lastevent = 0;
			{
				if (db.equals("db2") && !user.equals("script1")) {
					hasViolation = true;
				}
			}
			return true;
		}

		final void reset() {
			RVM_lastevent = -1;
		}

		// RVMRef_user was suppressed to reduce memory overhead
		// RVMRef_db was suppressed to reduce memory overhead

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
				//insert
				return;
			}
			return;
		}

		protected void finalize() throws Throwable {
			try {
				Insert_CollectedMonitor_num++;
			} finally {
				super.finalize();
			}
		}

	}
	class MoreRawMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractSynchronizedMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
		protected static long More_Monitor_num = 0;
		protected static long More_CollectedMonitor_num = 0;
		protected static long More_TerminatedMonitor_num = 0;
		protected static long More_script_end_num = 0;
		protected static long More_script_svn_num = 0;
		protected static long More_select_num = 0;
		protected static long More_commit_num = 0;
		protected static long More_update_num = 0;
		protected static long More_delete_num = 0;
		protected static long More_script_md5_num = 0;
		protected static long More_script_start_num = 0;

		public static long getTotalMonitorCount() {
			return More_Monitor_num;
		}
		public static long getCollectedMonitorCount() {
			return More_CollectedMonitor_num;
		}
		public static long getTerminatedMonitorCount() {
			return More_TerminatedMonitor_num;
		}
		public static Map<String, Long> getEventCounters() {
			HashMap<String, Long> eventCounters = new HashMap<String, Long>();
			eventCounters.put("script_end", More_script_end_num);
			eventCounters.put("script_svn", More_script_svn_num);
			eventCounters.put("select", More_select_num);
			eventCounters.put("commit", More_commit_num);
			eventCounters.put("update", More_update_num);
			eventCounters.put("delete", More_delete_num);
			eventCounters.put("script_md5", More_script_md5_num);
			eventCounters.put("script_start", More_script_start_num);
			return eventCounters;
		}
		public static Map<String, Long> getCategoryCounters() {
			HashMap<String, Long> categoryCounters = new HashMap<String, Long>();
			return categoryCounters;
		}

		protected Object clone() {
			More_Monitor_num++;
			try {
				MoreRawMonitor ret = (MoreRawMonitor) super.clone();
				return ret;
			}
			catch (CloneNotSupportedException e) {
				throw new InternalError(e.toString());
			}
		}

		public static boolean hasViolation;

		public MoreRawMonitor() {
			More_Monitor_num++;
			}@Override
			public final int getState() {
				return -1;
			}

			final boolean event_select(String user, String b, String c, String d) {
				RVM_lastevent = 0;
				{}
				return true;
			}

			final boolean event_update(String user, String b, String c, String d) {
				RVM_lastevent = 1;
				{}
				return true;
			}

			final boolean event_delete(String user, String b, String c, String d) {
				RVM_lastevent = 2;
				{}
				return true;
			}

			final boolean event_script_start(String user) {
				RVM_lastevent = 3;
				{}
				return true;
			}

			final boolean event_script_end(String user) {
				RVM_lastevent = 4;
				{}
				return true;
			}

			final boolean event_script_svn(String user, String b, String c, int d, int e) {
				RVM_lastevent = 5;
				{}
				return true;
			}

			final boolean event_script_md5(String user, String b) {
				RVM_lastevent = 6;
				{}
				return true;
			}

			final boolean event_commit(String user, int b) {
				RVM_lastevent = 7;
				{}
				return true;
			}

			final void reset() {
				RVM_lastevent = -1;
			}

			// RVMRef_user was suppressed to reduce memory overhead

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
					//select
					return;
					case 1:
					//update
					return;
					case 2:
					//delete
					return;
					case 3:
					//script_start
					return;
					case 4:
					//script_end
					return;
					case 5:
					//script_svn
					return;
					case 6:
					//script_md5
					return;
					case 7:
					//commit
					return;
				}
				return;
			}

			protected void finalize() throws Throwable {
				try {
					More_CollectedMonitor_num++;
				} finally {
					super.finalize();
				}
			}

		}
		class PubMonitor extends com.runtimeverification.rvmonitor.java.rt.tablebase.AbstractAtomicMonitor implements Cloneable, com.runtimeverification.rvmonitor.java.rt.RVMObject {
			protected Object clone() {
				Pub_Monitor_num++;
				try {
					PubMonitor ret = (PubMonitor) super.clone();
					return ret;
				}
				catch (CloneNotSupportedException e) {
					throw new InternalError(e.toString());
				}
			}

			public static boolean hasViolation;

			protected static long Pub_Monitor_num = 0;
			protected static long Pub_CollectedMonitor_num = 0;
			protected static long Pub_TerminatedMonitor_num = 0;
			protected static long Pub_approve_num = 0;
			protected static long Pub_publish_num = 0;
			protected static long Pub_1_violation_num = 0;

			static final int Prop_1_transition_publish[] = {1, 3, 2, 3};;
			static final int Prop_1_transition_approve[] = {2, 3, 2, 3};;

			volatile boolean Prop_1_Category_violation = false;

			private final AtomicInteger pairValue;

			PubMonitor() {
				this.pairValue = new AtomicInteger(this.calculatePairValue(-1, 0) ) ;

				Pub_Monitor_num++;
			}

			public static long getTotalMonitorCount() {
				return Pub_Monitor_num;
			}
			public static long getCollectedMonitorCount() {
				return Pub_CollectedMonitor_num;
			}
			public static long getTerminatedMonitorCount() {
				return Pub_TerminatedMonitor_num;
			}
			public static Map<String, Long> getEventCounters() {
				HashMap<String, Long> eventCounters = new HashMap<String, Long>();
				eventCounters.put("approve", Pub_approve_num);
				eventCounters.put("publish", Pub_publish_num);
				return eventCounters;
			}
			public static Map<String, Long> getCategoryCounters() {
				HashMap<String, Long> categoryCounters = new HashMap<String, Long>();
				categoryCounters.put("violation", Pub_1_violation_num);
				return categoryCounters;
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

			final boolean Prop_1_event_publish(Integer report) {
				{

				}

				int nextstate = this.handleEvent(0, Prop_1_transition_publish) ;
				this.Prop_1_Category_violation = nextstate == 1;

				return true;
			}

			final boolean Prop_1_event_approve(Integer report) {
				{

				}

				int nextstate = this.handleEvent(1, Prop_1_transition_approve) ;
				this.Prop_1_Category_violation = nextstate == 1;

				return true;
			}

			final void Prop_1_handler_violation (){
				if(Prop_1_Category_violation) {
					Pub_1_violation_num++;
				}
				{
					hasViolation = true;}

				}

				final void reset() {
					this.pairValue.set(this.calculatePairValue(-1, 0) ) ;

					Prop_1_Category_violation = false;
				}

				// RVMRef_report was suppressed to reduce memory overhead

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
						//publish
						return;
						case 1:
						//approve
						return;
					}
					return;
				}

				protected void finalize() throws Throwable {
					try {
						Pub_CollectedMonitor_num++;
					} finally {
						super.finalize();
					}
				}
				public static int getNumberOfEvents() {
					return 2;
				}

				public static int getNumberOfStates() {
					return 4;
				}

			}

			public final class newRuntimeMonitor implements com.runtimeverification.rvmonitor.java.rt.RVMObject {
				private static com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager newMapManager;
				static {
					newMapManager = new com.runtimeverification.rvmonitor.java.rt.map.RVMMapManager();
					newMapManager.start();
				}

				// Declarations for the Lock
				static final ReentrantLock new_RVMLock = new ReentrantLock();
				static final Condition new_RVMLock_cond = new_RVMLock.newCondition();

				private static boolean Insert_activated = false;
				private static boolean More_activated = false;
				private static boolean Pub_activated = false;

				// Declarations for Indexing Trees
				private static Object Insert_user_db_Map_cachekey_db;
				private static Object Insert_user_db_Map_cachekey_user;
				private static InsertRawMonitor Insert_user_db_Map_cachevalue;
				private static final MapOfMap<MapOfMonitor<InsertRawMonitor>> Insert_user_db_Map = new MapOfMap<MapOfMonitor<InsertRawMonitor>>(0) ;

				private static Object More_user_Map_cachekey_user;
				private static MoreRawMonitor More_user_Map_cachevalue;
				private static final MapOfMonitor<MoreRawMonitor> More_user_Map = new MapOfMonitor<MoreRawMonitor>(0) ;

				private static Object Pub_report_Map_cachekey_report;
				private static PubMonitor Pub_report_Map_cachevalue;
				private static final MapOfMonitor<PubMonitor> Pub_report_Map = new MapOfMonitor<PubMonitor>(0) ;

				public static int cleanUp() {
					int collected = 0;
					// indexing trees
					collected += Insert_user_db_Map.cleanUpUnnecessaryMappings();
					collected += More_user_Map.cleanUpUnnecessaryMappings();
					collected += Pub_report_Map.cleanUpUnnecessaryMappings();
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

				public static final void insertEvent(String user, String db, String p, String data) {
					Insert_activated = true;
					while (!new_RVMLock.tryLock()) {
						Thread.yield();
					}

					InsertRawMonitor.Insert_insert_num++;

					CachedWeakReference wr_user = null;
					CachedWeakReference wr_db = null;
					MapOfMonitor<InsertRawMonitor> matchedLastMap = null;
					InsertRawMonitor matchedEntry = null;
					boolean cachehit = false;
					if (((db == Insert_user_db_Map_cachekey_db) && (user == Insert_user_db_Map_cachekey_user) ) ) {
						matchedEntry = Insert_user_db_Map_cachevalue;
						cachehit = true;
					}
					else {
						wr_user = new CachedWeakReference(user) ;
						wr_db = new CachedWeakReference(db) ;
						{
							// FindOrCreateEntry
							MapOfMonitor<InsertRawMonitor> node_user = Insert_user_db_Map.getNodeEquivalent(wr_user) ;
							if ((node_user == null) ) {
								node_user = new MapOfMonitor<InsertRawMonitor>(1) ;
								Insert_user_db_Map.putNode(wr_user, node_user) ;
							}
							matchedLastMap = node_user;
							InsertRawMonitor node_user_db = node_user.getNodeEquivalent(wr_db) ;
							matchedEntry = node_user_db;
						}
					}
					// D(X) main:1
					if ((matchedEntry == null) ) {
						if ((wr_user == null) ) {
							wr_user = new CachedWeakReference(user) ;
						}
						if ((wr_db == null) ) {
							wr_db = new CachedWeakReference(db) ;
						}
						// D(X) main:4
						InsertRawMonitor created = new InsertRawMonitor() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_db, created) ;
					}
					// D(X) main:8--9
					matchedEntry.event_insert(user, db, p, data);

					if ((cachehit == false) ) {
						Insert_user_db_Map_cachekey_db = db;
						Insert_user_db_Map_cachekey_user = user;
						Insert_user_db_Map_cachevalue = matchedEntry;
					}

					new_RVMLock.unlock();
				}

				public static final void publishEvent(Integer report) {
					Pub_activated = true;
					while (!new_RVMLock.tryLock()) {
						Thread.yield();
					}

					PubMonitor.Pub_publish_num++;

					CachedWeakReference wr_report = null;
					MapOfMonitor<PubMonitor> matchedLastMap = null;
					PubMonitor matchedEntry = null;
					boolean cachehit = false;
					if ((report == Pub_report_Map_cachekey_report) ) {
						matchedEntry = Pub_report_Map_cachevalue;
						cachehit = true;
					}
					else {
						wr_report = new CachedWeakReference(report) ;
						{
							// FindOrCreateEntry
							MapOfMonitor<PubMonitor> itmdMap = Pub_report_Map;
							matchedLastMap = itmdMap;
							PubMonitor node_report = Pub_report_Map.getNodeEquivalent(wr_report) ;
							matchedEntry = node_report;
						}
					}
					// D(X) main:1
					if ((matchedEntry == null) ) {
						if ((wr_report == null) ) {
							wr_report = new CachedWeakReference(report) ;
						}
						// D(X) main:4
						PubMonitor created = new PubMonitor() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_report, created) ;
					}
					// D(X) main:8--9
					final PubMonitor matchedEntryfinalMonitor = matchedEntry;
					matchedEntry.Prop_1_event_publish(report);
					if(matchedEntryfinalMonitor.Prop_1_Category_violation) {
						matchedEntryfinalMonitor.Prop_1_handler_violation();
					}

					if ((cachehit == false) ) {
						Pub_report_Map_cachekey_report = report;
						Pub_report_Map_cachevalue = matchedEntry;
					}

					new_RVMLock.unlock();
				}

				public static final void approveEvent(Integer report) {
					Pub_activated = true;
					while (!new_RVMLock.tryLock()) {
						Thread.yield();
					}

					PubMonitor.Pub_approve_num++;

					CachedWeakReference wr_report = null;
					MapOfMonitor<PubMonitor> matchedLastMap = null;
					PubMonitor matchedEntry = null;
					boolean cachehit = false;
					if ((report == Pub_report_Map_cachekey_report) ) {
						matchedEntry = Pub_report_Map_cachevalue;
						cachehit = true;
					}
					else {
						wr_report = new CachedWeakReference(report) ;
						{
							// FindOrCreateEntry
							MapOfMonitor<PubMonitor> itmdMap = Pub_report_Map;
							matchedLastMap = itmdMap;
							PubMonitor node_report = Pub_report_Map.getNodeEquivalent(wr_report) ;
							matchedEntry = node_report;
						}
					}
					// D(X) main:1
					if ((matchedEntry == null) ) {
						if ((wr_report == null) ) {
							wr_report = new CachedWeakReference(report) ;
						}
						// D(X) main:4
						PubMonitor created = new PubMonitor() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_report, created) ;
					}
					// D(X) main:8--9
					final PubMonitor matchedEntryfinalMonitor = matchedEntry;
					matchedEntry.Prop_1_event_approve(report);
					if(matchedEntryfinalMonitor.Prop_1_Category_violation) {
						matchedEntryfinalMonitor.Prop_1_handler_violation();
					}

					if ((cachehit == false) ) {
						Pub_report_Map_cachekey_report = report;
						Pub_report_Map_cachevalue = matchedEntry;
					}

					new_RVMLock.unlock();
				}

				public static final void selectEvent(String user, String b, String c, String d) {
					More_activated = true;
					while (!new_RVMLock.tryLock()) {
						Thread.yield();
					}

					MoreRawMonitor.More_select_num++;

					CachedWeakReference wr_user = null;
					MapOfMonitor<MoreRawMonitor> matchedLastMap = null;
					MoreRawMonitor matchedEntry = null;
					boolean cachehit = false;
					if ((user == More_user_Map_cachekey_user) ) {
						matchedEntry = More_user_Map_cachevalue;
						cachehit = true;
					}
					else {
						wr_user = new CachedWeakReference(user) ;
						{
							// FindOrCreateEntry
							MapOfMonitor<MoreRawMonitor> itmdMap = More_user_Map;
							matchedLastMap = itmdMap;
							MoreRawMonitor node_user = More_user_Map.getNodeEquivalent(wr_user) ;
							matchedEntry = node_user;
						}
					}
					// D(X) main:1
					if ((matchedEntry == null) ) {
						if ((wr_user == null) ) {
							wr_user = new CachedWeakReference(user) ;
						}
						// D(X) main:4
						MoreRawMonitor created = new MoreRawMonitor() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_user, created) ;
					}
					// D(X) main:8--9
					matchedEntry.event_select(user, b, c, d);

					if ((cachehit == false) ) {
						More_user_Map_cachekey_user = user;
						More_user_Map_cachevalue = matchedEntry;
					}

					new_RVMLock.unlock();
				}

				public static final void updateEvent(String user, String b, String c, String d) {
					More_activated = true;
					while (!new_RVMLock.tryLock()) {
						Thread.yield();
					}

					MoreRawMonitor.More_update_num++;

					CachedWeakReference wr_user = null;
					MapOfMonitor<MoreRawMonitor> matchedLastMap = null;
					MoreRawMonitor matchedEntry = null;
					boolean cachehit = false;
					if ((user == More_user_Map_cachekey_user) ) {
						matchedEntry = More_user_Map_cachevalue;
						cachehit = true;
					}
					else {
						wr_user = new CachedWeakReference(user) ;
						{
							// FindOrCreateEntry
							MapOfMonitor<MoreRawMonitor> itmdMap = More_user_Map;
							matchedLastMap = itmdMap;
							MoreRawMonitor node_user = More_user_Map.getNodeEquivalent(wr_user) ;
							matchedEntry = node_user;
						}
					}
					// D(X) main:1
					if ((matchedEntry == null) ) {
						if ((wr_user == null) ) {
							wr_user = new CachedWeakReference(user) ;
						}
						// D(X) main:4
						MoreRawMonitor created = new MoreRawMonitor() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_user, created) ;
					}
					// D(X) main:8--9
					matchedEntry.event_update(user, b, c, d);

					if ((cachehit == false) ) {
						More_user_Map_cachekey_user = user;
						More_user_Map_cachevalue = matchedEntry;
					}

					new_RVMLock.unlock();
				}

				public static final void deleteEvent(String user, String b, String c, String d) {
					More_activated = true;
					while (!new_RVMLock.tryLock()) {
						Thread.yield();
					}

					MoreRawMonitor.More_delete_num++;

					CachedWeakReference wr_user = null;
					MapOfMonitor<MoreRawMonitor> matchedLastMap = null;
					MoreRawMonitor matchedEntry = null;
					boolean cachehit = false;
					if ((user == More_user_Map_cachekey_user) ) {
						matchedEntry = More_user_Map_cachevalue;
						cachehit = true;
					}
					else {
						wr_user = new CachedWeakReference(user) ;
						{
							// FindOrCreateEntry
							MapOfMonitor<MoreRawMonitor> itmdMap = More_user_Map;
							matchedLastMap = itmdMap;
							MoreRawMonitor node_user = More_user_Map.getNodeEquivalent(wr_user) ;
							matchedEntry = node_user;
						}
					}
					// D(X) main:1
					if ((matchedEntry == null) ) {
						if ((wr_user == null) ) {
							wr_user = new CachedWeakReference(user) ;
						}
						// D(X) main:4
						MoreRawMonitor created = new MoreRawMonitor() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_user, created) ;
					}
					// D(X) main:8--9
					matchedEntry.event_delete(user, b, c, d);

					if ((cachehit == false) ) {
						More_user_Map_cachekey_user = user;
						More_user_Map_cachevalue = matchedEntry;
					}

					new_RVMLock.unlock();
				}

				public static final void script_startEvent(String user) {
					More_activated = true;
					while (!new_RVMLock.tryLock()) {
						Thread.yield();
					}

					MoreRawMonitor.More_script_start_num++;

					CachedWeakReference wr_user = null;
					MapOfMonitor<MoreRawMonitor> matchedLastMap = null;
					MoreRawMonitor matchedEntry = null;
					boolean cachehit = false;
					if ((user == More_user_Map_cachekey_user) ) {
						matchedEntry = More_user_Map_cachevalue;
						cachehit = true;
					}
					else {
						wr_user = new CachedWeakReference(user) ;
						{
							// FindOrCreateEntry
							MapOfMonitor<MoreRawMonitor> itmdMap = More_user_Map;
							matchedLastMap = itmdMap;
							MoreRawMonitor node_user = More_user_Map.getNodeEquivalent(wr_user) ;
							matchedEntry = node_user;
						}
					}
					// D(X) main:1
					if ((matchedEntry == null) ) {
						if ((wr_user == null) ) {
							wr_user = new CachedWeakReference(user) ;
						}
						// D(X) main:4
						MoreRawMonitor created = new MoreRawMonitor() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_user, created) ;
					}
					// D(X) main:8--9
					matchedEntry.event_script_start(user);

					if ((cachehit == false) ) {
						More_user_Map_cachekey_user = user;
						More_user_Map_cachevalue = matchedEntry;
					}

					new_RVMLock.unlock();
				}

				public static final void script_endEvent(String user) {
					More_activated = true;
					while (!new_RVMLock.tryLock()) {
						Thread.yield();
					}

					MoreRawMonitor.More_script_end_num++;

					CachedWeakReference wr_user = null;
					MapOfMonitor<MoreRawMonitor> matchedLastMap = null;
					MoreRawMonitor matchedEntry = null;
					boolean cachehit = false;
					if ((user == More_user_Map_cachekey_user) ) {
						matchedEntry = More_user_Map_cachevalue;
						cachehit = true;
					}
					else {
						wr_user = new CachedWeakReference(user) ;
						{
							// FindOrCreateEntry
							MapOfMonitor<MoreRawMonitor> itmdMap = More_user_Map;
							matchedLastMap = itmdMap;
							MoreRawMonitor node_user = More_user_Map.getNodeEquivalent(wr_user) ;
							matchedEntry = node_user;
						}
					}
					// D(X) main:1
					if ((matchedEntry == null) ) {
						if ((wr_user == null) ) {
							wr_user = new CachedWeakReference(user) ;
						}
						// D(X) main:4
						MoreRawMonitor created = new MoreRawMonitor() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_user, created) ;
					}
					// D(X) main:8--9
					matchedEntry.event_script_end(user);

					if ((cachehit == false) ) {
						More_user_Map_cachekey_user = user;
						More_user_Map_cachevalue = matchedEntry;
					}

					new_RVMLock.unlock();
				}

				public static final void script_svnEvent(String user, String b, String c, int d, int e) {
					More_activated = true;
					while (!new_RVMLock.tryLock()) {
						Thread.yield();
					}

					MoreRawMonitor.More_script_svn_num++;

					CachedWeakReference wr_user = null;
					MapOfMonitor<MoreRawMonitor> matchedLastMap = null;
					MoreRawMonitor matchedEntry = null;
					boolean cachehit = false;
					if ((user == More_user_Map_cachekey_user) ) {
						matchedEntry = More_user_Map_cachevalue;
						cachehit = true;
					}
					else {
						wr_user = new CachedWeakReference(user) ;
						{
							// FindOrCreateEntry
							MapOfMonitor<MoreRawMonitor> itmdMap = More_user_Map;
							matchedLastMap = itmdMap;
							MoreRawMonitor node_user = More_user_Map.getNodeEquivalent(wr_user) ;
							matchedEntry = node_user;
						}
					}
					// D(X) main:1
					if ((matchedEntry == null) ) {
						if ((wr_user == null) ) {
							wr_user = new CachedWeakReference(user) ;
						}
						// D(X) main:4
						MoreRawMonitor created = new MoreRawMonitor() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_user, created) ;
					}
					// D(X) main:8--9
					matchedEntry.event_script_svn(user, b, c, d, e);

					if ((cachehit == false) ) {
						More_user_Map_cachekey_user = user;
						More_user_Map_cachevalue = matchedEntry;
					}

					new_RVMLock.unlock();
				}

				public static final void script_md5Event(String user, String b) {
					More_activated = true;
					while (!new_RVMLock.tryLock()) {
						Thread.yield();
					}

					MoreRawMonitor.More_script_md5_num++;

					CachedWeakReference wr_user = null;
					MapOfMonitor<MoreRawMonitor> matchedLastMap = null;
					MoreRawMonitor matchedEntry = null;
					boolean cachehit = false;
					if ((user == More_user_Map_cachekey_user) ) {
						matchedEntry = More_user_Map_cachevalue;
						cachehit = true;
					}
					else {
						wr_user = new CachedWeakReference(user) ;
						{
							// FindOrCreateEntry
							MapOfMonitor<MoreRawMonitor> itmdMap = More_user_Map;
							matchedLastMap = itmdMap;
							MoreRawMonitor node_user = More_user_Map.getNodeEquivalent(wr_user) ;
							matchedEntry = node_user;
						}
					}
					// D(X) main:1
					if ((matchedEntry == null) ) {
						if ((wr_user == null) ) {
							wr_user = new CachedWeakReference(user) ;
						}
						// D(X) main:4
						MoreRawMonitor created = new MoreRawMonitor() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_user, created) ;
					}
					// D(X) main:8--9
					matchedEntry.event_script_md5(user, b);

					if ((cachehit == false) ) {
						More_user_Map_cachekey_user = user;
						More_user_Map_cachevalue = matchedEntry;
					}

					new_RVMLock.unlock();
				}

				public static final void commitEvent(String user, int b) {
					More_activated = true;
					while (!new_RVMLock.tryLock()) {
						Thread.yield();
					}

					MoreRawMonitor.More_commit_num++;

					CachedWeakReference wr_user = null;
					MapOfMonitor<MoreRawMonitor> matchedLastMap = null;
					MoreRawMonitor matchedEntry = null;
					boolean cachehit = false;
					if ((user == More_user_Map_cachekey_user) ) {
						matchedEntry = More_user_Map_cachevalue;
						cachehit = true;
					}
					else {
						wr_user = new CachedWeakReference(user) ;
						{
							// FindOrCreateEntry
							MapOfMonitor<MoreRawMonitor> itmdMap = More_user_Map;
							matchedLastMap = itmdMap;
							MoreRawMonitor node_user = More_user_Map.getNodeEquivalent(wr_user) ;
							matchedEntry = node_user;
						}
					}
					// D(X) main:1
					if ((matchedEntry == null) ) {
						if ((wr_user == null) ) {
							wr_user = new CachedWeakReference(user) ;
						}
						// D(X) main:4
						MoreRawMonitor created = new MoreRawMonitor() ;
						matchedEntry = created;
						matchedLastMap.putNode(wr_user, created) ;
					}
					// D(X) main:8--9
					matchedEntry.event_commit(user, b);

					if ((cachehit == false) ) {
						More_user_Map_cachekey_user = user;
						More_user_Map_cachevalue = matchedEntry;
					}

					new_RVMLock.unlock();
				}

			}
