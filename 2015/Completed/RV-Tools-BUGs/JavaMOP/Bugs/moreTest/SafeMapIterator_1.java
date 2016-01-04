// Copyright (c) 2002-2014 JavaMOP Team. All Rights Reserved.
import java.util.*;

public class SafeMapIterator_1 {
    public static void main(String[] args){
        try{
            Map<String, String> testMap = new HashMap<String,String>();
            testMap.put("Foo", "Bar");
            Set<String> keys = testMap.keySet(); //one createColl event
		Iterator i = keys.iterator();

	    Set<String> keys2 = testMap.keySet(); //should have two createColl events fired here
            //Iterator i = keys.iterator();
           // System.out.println(i.next());
	  
        }
        catch(Exception e){
            System.out.println("java found the problem too");
        }
    }
}

/**
1) at first, only map m
2) after keySet() is called, an event (m,c) is gen, we have (m) and (m,c)
3) c.iterator(), event is (c,i), monitor (c,i) and (m,c,i) will be updated. so two prints
4) i.next(): monitor (i), (c,i), (m,i) and (m,c,i) will be updated. so four times
*/
