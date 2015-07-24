
import java.util.*;

public class Main {
    static int numOfRounds;
    static int numOfViolationsCandidates;
    static int RANGE;
    //the RANGE for violation index: 0 ~ RANGE

    static int[] indexOfUpdateMapInMiddle;
    static Iterator[] badIterArr;
    static int index4BadIter = 0;

    private static void init() {
        RANGE = numOfViolationsCandidates > 0 ? numOfRounds / numOfViolationsCandidates : -1;

        indexOfUpdateMapInMiddle = genRandomViolationIterNum();


        badIterArr = new Iterator[numOfViolationsCandidates > 0 ? numOfViolationsCandidates : 0];
    }



    private static int[] genRandomViolationIterNum() {
        if (RANGE <= 0) {
            return new int[0];
        }

        Random random = new Random(System.currentTimeMillis());


        int[] indexArr = new int[numOfViolationsCandidates];

        for (int i = 0; i < indexArr.length; i++) {
            indexArr[i] = random.nextInt(RANGE);
        }

        return indexArr;
    }


    private static String printArr(Object[] arr) {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < arr.length; i++) {
            sb.append(System.identityHashCode(arr[i]) + " :: ");
        }

        sb.append("]");
        return sb.toString();
    }

    private static String printArr(int[] arr) {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < arr.length; i++) {
            sb.append(arr[i] + " ");
        }

        sb.append("]");
        return sb.toString();
    }

    /**
     * Gen traces.
     * @param args first arg is num of rounds, 2nd is num of violations + 1.
     * There will be one case which looks like going to violate, but finally not.
     */
    public static void main(String[] args) {
        if (args.length != 2) {
            System.exit(0);
        } else {
            numOfRounds = Integer.parseInt(args[0]);
            numOfViolationsCandidates = Integer.parseInt(args[1]);

            init();
        }


        if (RANGE == 0)
            System.exit(0); //we do not want every record violates the property.


        System.out.print("event, Map, Collection, Iterator\r\n");

        for (int i = 0; i < numOfRounds; i++) {

            Map<String, String> testMap = new HashMap<String,String>();
            testMap.put("key"+i,"val"+i); //update map

            Set<String> keys = testMap.keySet(); //create collection

            Iterator iterator = keys.iterator(); //create iterator


            if (isChosen(i)) {
                testMap.put("breaker" + i, "borked" + i); //update the map to make violations
                badIterArr[index4BadIter++] = iterator;
            }

            else {
                try {
                    iterator.next();
                } catch (ConcurrentModificationException cme) {

                }
            }
        }

        System.err.println("code2.Bad Iterators: " + printArr(badIterArr));

        if (numOfViolationsCandidates <= 0) {
            System.err.println("NO Violation, the whole trace is Valid!");
        }

        Random random = new Random(System.currentTimeMillis());
        int violationIndex = random.nextInt(badIterArr.length);

        System.err.println("The single violation is No." + violationIndex);

        try {
            badIterArr[violationIndex].next(); //invoke the only violation
        } catch (ConcurrentModificationException e) {
            
        }


    }


    private static boolean isChosen(int i) {

        int blockIndex = i / RANGE;
        if (blockIndex >= indexOfUpdateMapInMiddle.length)
            return false;

        return numOfViolationsCandidates > 0 && (i % RANGE) == (indexOfUpdateMapInMiddle[blockIndex]);
    }
}
