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
memb.add(new JzonElement(22));

memb.add(new JzonElement(5));


	}
}

class JzonElement
{
	public int val;

	public JzonElement(int val) {this.val = val;}
}
