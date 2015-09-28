import java.util.*;

public class Test 
{
	public static void main(String[] args) 
	{
Comparator<JzonElement> COMP = 
	new Comparator<JzonElement>() {
@Override
	public int compare(JzonElement o1,
            JzonElement o2) {return o1.val - o2.val;}
};


		Set<JzonElement> memb = 
			new TreeSet <JzonElement> (COMP);
//  new TreeSet <JzonElement> ();

//memb.add(new JzonElement(22));

Collection<JzonElement> aList = new ArrayList<JzonElement>();
aList.add(new JzonElement(5));
aList.add(new JzonElement(7));

memb.addAll(aList);

System.out.println("No err found");
	}
}

class JzonElement
{
	public int val;

	public JzonElement(int val) {this.val = val;}
}
