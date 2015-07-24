import rvm.UnsafeMapIteratorRuntimeMonitor;

public class Test{
public static void main(String[] args) {
	UnsafeMapIteratorRuntimeMonitor.updateMapEvent("306612792");

	UnsafeMapIteratorRuntimeMonitor.createCollEvent("306612792", "447212746");

	UnsafeMapIteratorRuntimeMonitor.createIterEvent("447212746", "1496355635");

	UnsafeMapIteratorRuntimeMonitor.updateMapEvent("306612792");

	UnsafeMapIteratorRuntimeMonitor.useIterEvent("1496355635");
    
}
}
