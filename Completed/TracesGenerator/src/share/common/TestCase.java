package common;

import java.util.Random;

/**
 * Created by xiaohe on 3/16/15.
 */
public abstract class TestCase {
    protected int testID;
    private boolean isGood;

    protected static int[] numOfGoodInvok = new int[3];
    protected static int[] numOfBadInvok = new int[3];

    private Random random = new Random(System.currentTimeMillis());



    public TestCase(boolean isGoodTest) {
        this.isGood = isGoodTest;
    }

    /**
     * randomly select a run method to run.
     * @param id
     */
    public void run(int id) {
        this.testID = id;

        String info = (isGood ? "GoodTest" : "BadTest");
        switch (genRandomInt() + 1) {
            case 1:
//                System.err.println(info + 1);

                run1();

                if (isGood)
                    numOfGoodInvok[0]++;
                else
                    numOfBadInvok[0]++;

                break;

            case 2:
//                System.err.println(info + 2);

                run2();
                if (isGood)
                    numOfGoodInvok[1]++;
                else
                    numOfBadInvok[1]++;
                break;

            case 3:
//                System.err.println(info + 3);

                run3();
                if (isGood)
                    numOfGoodInvok[2]++;
                else
                    numOfBadInvok[2]++;
                break;
        }
    }

    /**
     * Specify the testID of the test and also the run method to run.
     * @param id
     * @param runID
     */
    public void run(int id, int runID) {
        this.testID = id;
        switch (runID) {
            case 1 :
                run1();

		if (isGood)
                    numOfGoodInvok[0]++;
                else
                    numOfBadInvok[0]++;

                break;
            case 2:
                run2();

if (isGood)
                    numOfGoodInvok[1]++;
                else
                    numOfBadInvok[1]++;

                break;
            case 3:
                run3();
if (isGood)
                    numOfGoodInvok[2]++;
                else
                    numOfBadInvok[2]++;

                break;
        }
    }

    public int genRandomInt() {
        return random.nextInt(3);
    }

    public static int[] getGoodStatsArr() {
        return numOfGoodInvok;
    }

    public static int[] getBadStatsArr() {
        return numOfBadInvok;
    }

    public abstract void run1();

    public abstract void run2();

    public abstract void run3();
}
