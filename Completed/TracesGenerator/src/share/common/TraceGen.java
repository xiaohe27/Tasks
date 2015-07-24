package common;


public class TraceGen {
    int numOfRounds;
    int numOfViolationsCandidates;
    int RANGE;
    //the RANGE for violation index: 0 ~ RANGE


    TestCase goodTest;
    TestCase badTest;

    public TraceGen(int numOfRounds, int numOfViolationsCandidates, GoodTest goodTest, BadTest
            badTest) {
        this.numOfRounds = numOfRounds;
        this.numOfViolationsCandidates = numOfViolationsCandidates;
        this.goodTest = goodTest;
        this.badTest = badTest;

        init();
    }

    private void init() {
        RANGE = numOfViolationsCandidates > 0 ? numOfRounds / numOfViolationsCandidates : -1;

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


    public void genTraces(String header) {

        if (RANGE == 0)
            System.exit(0); //we do not want every record violates the property.


        System.out.print(header);

        int num1 = (numOfRounds) / 3;
        int num2 = num1;
        int num3 = numOfRounds - num1 * 2 - 1;
        System.err.println("GoodTest expectation! Run1 and Run2 : " + num1 +
                            "; Run3 : " + (numOfViolationsCandidates > 0 ? num3 : (num3 + 1)));
        // num1 + num2 + num3 = numOfRounds - 1
        //use three threads to gen the traces
        //one thread responsible for generation of one pattern
        Thread worker1 = new Thread(new MyWorker(num1, 0, 1));
        Thread worker2 = new Thread(new MyWorker(num2, num1, 2));
        Thread worker3 = new Thread(new MyWorker(num3, num1 + num2, 3));

        worker1.start();
        worker2.start();
        worker3.start();

        try {
            worker1.join();
            worker2.join();
            worker3.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        //now numOfRounds - 1 iterations have been completed by worker 1 and 2.
        //generate the last iteration which will cause violation if it is expected.
        if (numOfViolationsCandidates > 0)
            badTest.run(numOfRounds - 1); //run the single violation at the end
        else
            goodTest.run(numOfRounds - 1, 3);     //run the run3() method of goodTest

        System.err.println("Actually executed GoodTests: ");
        for (int i = 0; i < 3; i++) {
            System.err.println("Test " + (i + 1) + ": " + goodTest.getGoodStatsArr()[i]);
        }

        System.err.println("BadTests: ");
        for (int i = 0; i < 3; i++) {
            System.err.println("Test " + (i + 1) + ": " + badTest.getBadStatsArr()[i]);
        }
    }

    class MyWorker implements Runnable {
        int numOfTasks;
        int offset;
        int runMethodId;

        private MyWorker(int numOfIter, int offset) {
            this(numOfIter, offset, -1);
        }

        public MyWorker(int numOfIter, int offset, int runMethodId) {
            this.numOfTasks = numOfIter;
            this.offset = offset;
            this.runMethodId = runMethodId;
        }

        @Override
        public void run() {
            if (this.runMethodId <= 0) // randomly select a run method
            {
                for (int i = 0; i < numOfTasks; i++) {
                    //System.err.println((i+offset) + " starts!");
                    goodTest.run(i + offset);
//                System.err.println((i+offset) + " finishes!");
                }

            } else {
                switch (this.runMethodId) {
                    case 1:
                        for (int i = 0; i < numOfTasks; i++) {
                    goodTest.run(i + offset, 1);
                        }
                        break;

                    case 2:
                        for (int i = 0; i < numOfTasks; i++) {
                    goodTest.run(i + offset, 2);
                        }
                        break;

                    case 3:
                        for (int i = 0; i < numOfTasks; i++) {
                    goodTest.run(i + offset, 3);
                        }
                        break;
                }
            }
        }
    }

}
