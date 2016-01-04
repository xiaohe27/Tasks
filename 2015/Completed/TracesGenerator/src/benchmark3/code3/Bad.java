package code3;

import common.BadTest;

import java.util.Iterator;
import java.util.Vector;

/**
 * Created by xiaohe on 3/16/15.
 */
public class Bad extends BadTest {

    @Override
    public void run1() { // next next
        Vector<Integer> v = new Vector<Integer>();

        v.add(1 + super.testID);
        v.add(2 + super.testID);
        v.add(4 + super.testID);
        v.add(8 + super.testID);

        Iterator i = v.iterator();
        int sum = 0;

        if(i.hasNext()){
            sum += (Integer)i.next(); //good, next event
            sum += (Integer)i.next(); //violate property
            //next followed by next instead of hasnexttrue

            sum += (Integer)i.next();
            sum += (Integer)i.next();
        }
    }

    @Override
    public void run2() { //hasnextfalse next
        Vector<Integer> v = new Vector<Integer>();

        v.add(1 + super.testID);
        v.add(2 + super.testID);
        v.add(4 + super.testID);
        v.add(8 + super.testID);

        Iterator i = v.iterator();
        i.hasNext();
        i.next();
        i.hasNext();
        i.next();
        i.hasNext();
        i.next();
        i.hasNext();
        i.next(); //no elements in the vector now.

        try {
            i.hasNext(); //ret false;
            i.next(); //violation
        } catch (Exception e) {

        }
    }

    @Override
    public void run3() {  //hasNextTrue from a different obj
        Vector<Integer> v = new Vector<Integer>();
        v.add(1 + super.testID);
        v.add(2 + super.testID);
        v.add(4 + super.testID);
        v.add(8 + super.testID);

        Vector<Integer> v2 = new Vector<Integer>();
        v2.add(1 + super.testID);
        v2.add(2 + super.testID);


        Iterator it = v.iterator();
        Iterator it2 = v2.iterator();

        if (it.hasNext()) {
            it2.next(); //it2 does not call hasNext before
        }

    }
}
