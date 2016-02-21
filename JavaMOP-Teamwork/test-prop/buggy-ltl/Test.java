
public class Test{

public static void main(String[] args) {

//rvm.ABeforeBRuntimeMonitor.aEvent("str0");
//rvm.ABeforeBRuntimeMonitor.bEvent(5);
//rvm.ABeforeBRuntimeMonitor.aEvent("str1");


//rvm.ABeforeBRuntimeMonitor.aEvent("str0", 5); //ok
rvm.ABeforeBRuntimeMonitor.bEvent(5); //ok

rvm.ABeforeBRuntimeMonitor.aEvent("str0", new Integer(2000));
rvm.ABeforeBRuntimeMonitor.bEvent(2001);

//rvm.ABeforeBRuntimeMonitor.aEvent("str1");
}
}
