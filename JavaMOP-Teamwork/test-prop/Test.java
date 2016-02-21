
public class Test{

public static void main(String[] args) {

Integer i = new Integer(5);

String s= "a";
//rvm.ABeforeBRuntimeMonitor.cEvent(s);
//rvm.ABeforeBRuntimeMonitor.cEvent(s); //event seq c c will make fsm go to fail state.

rvm.ABeforeBRuntimeMonitor.cEvent("str1"); //<c1>:s3

rvm.ABeforeBRuntimeMonitor.cEvent("str2"); //<c2>:s3

rvm.ABeforeBRuntimeMonitor.bEvent(i); //3 matches of state s2 here: <b1>:s2, <b1,c1>:s2, <b1,c2>:s2

System.out.println("Add another b event");
rvm.ABeforeBRuntimeMonitor.bEvent(7); //still 3 matches of state s2, indicating the monitors indexed by <c1> and <c2> are still there
//<b2>:s2, <b2,c1>:s2, <b2,c2>:s2

}
}
