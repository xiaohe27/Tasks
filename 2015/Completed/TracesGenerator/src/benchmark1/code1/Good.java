package code1;

import common.GoodTest;

import java.util.*;

/**
 * Created by xiaohe on 3/16/15.
 */
public class Good extends GoodTest {


    @Override
    public void run1() {
        Map<String, String> testMap = new HashMap<String,String>();
        testMap.put("key"+ testID,"val"+ testID); //update map

        Set<String> keys = testMap.keySet(); //create collection

        Iterator iterator = keys.iterator(); //create iterator

        iterator.next(); //use iterator
    }

    @Override
    public void run2() {
        Map<String, String> testMap = new HashMap<String,String>();
        testMap.put("key"+ testID,"val"+ testID); //update map

        Set<String> keys = testMap.keySet(); //create collection

        Iterator iterator = keys.iterator(); //create iterator

        testMap.remove("key" + testID, "val" + testID); //update map

    }

    @Override
    public void run3() {
        Map<String, String> testMap = new HashMap<String,String>();
        testMap.put("key"+ testID,"val"+ testID); //update map

        Collection<String> keys = new ArrayList<>(); //create collection, not an event
        keys.add("key"+ testID);

        Iterator iterator = keys.iterator(); //create iterator

        testMap.remove("key"+ testID,"val"+ testID); //update map
        iterator.next(); //use iterator
    }


}
