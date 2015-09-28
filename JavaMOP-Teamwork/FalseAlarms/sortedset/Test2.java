import java.util.*;

public class Test2 
{
	public static void main(String[] args) 
	{
Comparator COMP = 
	new Comparator() {
@Override
	public int compare(Object o1,
            Object o2) {return 0;}
};


//		Set memb = 
SortedSet memb =
			new TreeSet <JzonElement> (COMP);
//  new TreeSet <JzonElement> ();

//memb.add("crash!");
memb.add("...");

Collection<JzonElement> aList = new ArrayList<JzonElement>();
aList.add(new JzonElement(5));
aList.add(new JzonElement(7));

memb.addAll(aList);

memb.add(new JzonElement(7));

memb.add("...");

Iterator it = memb.iterator();
while(it.hasNext())
{System.out.println(it.next());}

System.out.println("There are " + memb.size() + " items in the set.");

	}
}

class JzonElement
{
	public int val;

	public JzonElement(int val) {this.val = val;}
}
