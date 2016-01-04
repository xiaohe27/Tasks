import java.util.Collection;
import java.util.HashMap;

/**
 * Created by xiaohe on 3/19/15.
 */
public class Test {
    public static void main(String[] args) {
        HashMap<String, String> map = new HashMap<>();
        map.put("test", "t1");

        Collection keySet1 = map.keySet();
        Collection keySet2 = map.keySet();

        System.out.println(keySet1);


        map.put("test2", "t2");

        System.out.println("Two key sets are equal: "+(keySet1 == keySet2));
        System.out.println(keySet1);

        Collection keySet3 = map.keySet();

        System.out.println("They become different? " + (keySet1 != keySet3));
        System.out.println("Two key sets are equal: "+(keySet1 == keySet3));

        System.out.println(keySet1);

    }
}
