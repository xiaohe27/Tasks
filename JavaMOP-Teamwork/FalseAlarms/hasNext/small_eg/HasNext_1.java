// Copyright (c) 2002-2014 JavaMOP Team. All Rights Reserved.

import java.util.*;

public class HasNext_1 {
final List<Integer> v = new ArrayList<Integer>();
public HasNext_1() {
        v.add(1);
        v.add(22);
        v.add(4);
        v.add(8);

		v.add(1);
        v.add(25);
        v.add(4);
        v.add(8);

		v.add(13);
        v.add(2);
        v.add(4);
        v.add(81);
}

    public static void main(String[] args){
        HasNext_1 m = new HasNext_1();

		m.test();
		m.test();
		m.test();
    }

	public void test() {
        
        Iterator<Integer> i = v.iterator();
        int sum = 0;
 
		sum += i.next();

        while(i.hasNext()){
            sum += i.next();
        }
        
        System.out.println("sum: " + sum);
	}

}
