package common;


/**
 * Created by xiaohe on 3/18/15.
 */
public class RunTest {
    public static void main(String[] args) {
        int numOfRounds = 0;
        int numOfViolationsCandidates = 0;
        int benchmarkNum = 0;

        if (args.length != 3) {
            System.exit(0);
        } else {
            numOfRounds = Integer.parseInt(args[0]);
            numOfViolationsCandidates = Integer.parseInt(args[1]);

            benchmarkNum = Integer.parseInt(args[2]);
        }

        GoodTest gt = null;
        BadTest bt = null;
        String header = null;

        switch (benchmarkNum) {
            case 1 :
                gt = new code1.Good();
                bt = new code1.Bad();
                header = "event, Map, Collection, Iterator\r\n";
                break;

            case 2 :
                gt = new code2.Good();
                bt = new code2.Bad();
                header = "event, FileWriter\r\n";
                break;

            case 3 :
                gt = new code3.Good();
                bt = new code3.Bad();
                header = "event, Iterator, bool\r\n";
                break;
        }

        TraceGen traceGen = new TraceGen(numOfRounds, numOfViolationsCandidates, gt, bt);

        traceGen.genTraces(header);
    }
}
