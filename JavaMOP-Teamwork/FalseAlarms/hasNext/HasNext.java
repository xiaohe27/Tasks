// Copyright (c) 2002-2014 JavaMOP Team. All Rights Reserved.

import java.util.*;

public class HasNext {
    public static void main(String[] args){
        Vector<Integer> v = new Vector<Integer>();
        
        v.add(1);
        v.add(2);
        v.add(4);
        v.add(8);
        
        final Iterator<Integer> i = v.iterator();
        int sum = 0;
        
		sum += i.next();

        while(i.hasNext()){
            sum += i.next();
        }
        
        System.out.println("sum: " + sum);
    }
}
