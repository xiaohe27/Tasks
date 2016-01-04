package code3;

import common.GoodTest;

import java.util.Iterator;
import java.util.Vector;

/**
 * Created by xiaohe on 3/16/15.
 */
public class Good extends GoodTest {


    @Override
    public void run1() { //hasnexttrue next
        Vector<Integer> v = new Vector<Integer>();

        v.add(1 + super.testID);
        v.add(2 + super.testID);
        v.add(4 + super.testID);
        v.add(8 + super.testID);

        Iterator i = v.iterator();

        int sum = 0;

        while(i.hasNext()){
            sum += (Integer)i.next();
        }

    }

    @Override
    public void run2() { //hasnexttrue hasnexttrue next
        Vector<Integer> v = new Vector<Integer>();

        v.add(1 + super.testID);
        v.add(2 + super.testID);
        v.add(4 + super.testID);
        v.add(8 + super.testID);

        Iterator i = v.iterator();

        int sum = 0;

        while(i.hasNext() && i.hasNext()){
            sum += (Integer)i.next();
        }

    }

    @Override
    public void run3() { // hasnexttrue hasNextFalse from another obj, then next
        Vector<Integer> v = new Vector<Integer>();
        Vector<Integer> v2 = new Vector<Integer>();

        v.add(1 + super.testID);
        v.add(2 + super.testID);
        v.add(4 + super.testID);
        v.add(8 + super.testID);

        Iterator i = v.iterator();
        Iterator i2 = v2.iterator();

        int counter = 0;
        i.hasNext();
        i2.hasNext();

        i.next();

    }


}
