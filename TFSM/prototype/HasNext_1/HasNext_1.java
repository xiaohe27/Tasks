
package HasNext_1;

import java.util.*;

public class HasNext_1 {
	public static void main(String[] args){
		Scanner scanner = new Scanner(System.in);
		Vector<Integer> v = new Vector<Integer>();

		v.add(1);
		v.add(2);
		v.add(4);
		v.add(8);

		Iterator i = v.iterator();
		int sum = 0;

		while (i.hasNext()) {
			rvm.HasNextRuntimeMonitor.hasnextEvent(i, System.currentTimeMillis());

			System.out.println("Press 'Enter' to receive 'next' event");
			scanner.nextLine();

		    rvm.HasNextRuntimeMonitor.nextEvent(i, System.currentTimeMillis());
		    sum += (Integer)i.next();

			System.out.println("Press 'Enter' to receive 'hasnext' event");
			scanner.nextLine();
		}


		System.out.println("sum: " + sum);
	}
}

