import java.util.*;

public class Test 
{
	public static void main(String[] args) 
	{
Comparator<Entry<String, JzonElement>> COMP = 
	new Comparator<Entry<String, JzonElement>>() {

};


		Set<Entry<String, JzonElement>> memb = 
			new TreeSet <Entry<String, JzonElement>>  (COMP);
memb.add(new JzonElement(2));

	}
}

class JzonElement
{
	public int val;

	public JzonElement(int val) {this.val = val;}
}
