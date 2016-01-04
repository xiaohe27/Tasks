package benchmark5;

import java.util.*;

public class Main {
    static int numOfRounds;
    static int numOfViolations;
    static int RANGE;
    //the RANGE for violation index: 0 ~ RANGE

    static int[] indexOfBadEventsStart;
    static int[] indexOfViolationEvents;
    static Iterator[] badIterArr;
    static int index4SpecialCaseNotViolate;
    static int index4BadIter = 0;

    private static void init() {
        RANGE = numOfViolations > 0 ? numOfRounds / numOfViolations : -1;

        indexOfBadEventsStart = genRandomViolationIterNum();

        indexOfViolationEvents = genViolationIndex();

        badIterArr = new Iterator[numOfViolations > 0 ? numOfViolations : 0];
        if (numOfViolations > 1) {
            Random random = new Random(System.currentTimeMillis());
            index4SpecialCaseNotViolate = random.nextInt(numOfViolations);
        }
    }

    private static int[] genViolationIndex() {
        if (RANGE <= 0) {
            return new int[0];
        }

        Random random = new Random(System.currentTimeMillis());

        // map the index of iter creation to that of bad iter usage.
        int[] fireViolationArr = new int[numOfViolations];
        for (int i = 0; i < fireViolationArr.length; i++) {
            int violationStartPos = i * RANGE + indexOfBadEventsStart[i];
            fireViolationArr[i] = (violationStartPos + 1 + random.nextInt
                    (numOfRounds - violationStartPos - 1));

            if (fireViolationArr[i] >= numOfRounds)
                fireViolationArr[i] = numOfRounds - 1;
        }

        return fireViolationArr;
    }


    private static int[] genRandomViolationIterNum() {
        if (RANGE <= 0) {
            return new int[0];
        }

        Random random = new Random(System.currentTimeMillis());


        int[] indexArr = new int[numOfViolations];

        for (int i = 0; i < indexArr.length; i++) {
            indexArr[i] = random.nextInt(RANGE);
        }

        return indexArr;
    }

    private static void fireViolationEvents(int comingIndex) {
        for (int i = 0; i < indexOfViolationEvents.length; i++) {
            if (i == index4SpecialCaseNotViolate)
                continue;

            if (indexOfViolationEvents[i] == comingIndex) {
                try {
                    badIterArr[i].next();
                } catch (ConcurrentModificationException cme) {

                }
            }
        }
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
            numOfViolations = Integer.parseInt(args[1]);

            init();
            System.err.println("Special exemption case:" + index4SpecialCaseNotViolate);
        }


        if (RANGE == 0)
            System.exit(0); //we do not want every record violates the property.


        System.out.print("event, Map, Collection, Iterator\r\n");

        for (int i = 0; i < numOfRounds; i++) {

            //fire the previous bad iterator's next methods to trigger the violation
            fireViolationEvents(i);

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
    }


    private static boolean isChosen(int i) {
        int blockIndex = i / RANGE;
        if (blockIndex >= indexOfBadEventsStart.length)
            return false;

        return numOfViolations > 0 && (i % RANGE) == (indexOfBadEventsStart[blockIndex]);
    }
}
