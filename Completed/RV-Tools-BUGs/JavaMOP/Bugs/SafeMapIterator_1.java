// Copyright (c) 2002-2014 JavaMOP Team. All Rights Reserved.
import java.util.*;

public class SafeMapIterator_1 {
    public static void main(String[] args){
        try{
            Map<String, String> testMap = new HashMap<String,String>();
            testMap.put("Foo", "Bar");
            Set<String> keys = testMap.keySet();
            Iterator i = keys.iterator();
            System.out.println(i.next());

	    Map<String, String> testMap2 = new HashMap<String,String>();
	    testMap2.put("MyKey", "MyVal");
	    Set<String> keys2 = testMap2.keySet();
            Iterator i2 = keys2.iterator();
	    	    testMap2.put("MyKey", "MyVal");
            System.out.println(i2.next());
        }
        catch(Exception e){
            System.out.println("java found the problem too");
        }
    }
}
