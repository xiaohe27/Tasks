import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Created by xiaohe on 1/31/15.
 */
public class CompareIntParsing {
    public void parseIntByDigits(byte[] number) {
        int numOfInts=0;
        int result = 0;

        for (int i = 0; i < number.length; i++) {

            byte b = number[i];
            if (b > 47 && b < 58) {
                result *= 10;

                switch (b) {
                    case 48: //0
                        break;

                    case 49: //1
                        result += 1;
                        break;

                    case 50: //2
                        result += 2;
                        break;

                    case 51: //3
                        result += 3;
                        break;

                    case 52: //4
                        result += 4;
                        break;

                    case 53: //5
                        result += 5;
                        break;

                    case 54: //6
                        result += 6;
                        break;

                    case 55: //7
                        result += 7;
                        break;

                    case 56: //8
                        result += 8;
                        break;

                    case 57: //9
                        result += 9;
                        break;


                }
            } else {
                numOfInts++;
            }
        }

        System.out.println("totally "+numOfInts);
    }

    public void parseIntByStdLib(byte[] number) {
        int numOfInts = 0;
        int start=0;
        int len=0;

        for (int i = 0; i < number.length; i++) {
            byte b = number[i];
            if (b > 47 && b < 58) {
                len++;

            } else {
                Integer.parseInt(new String(number, start, len));
                numOfInts++;

                start = i + 1;
                len = 0;
            }
        }

        System.out.println("totally "+numOfInts);
    }


    public static void main(String[] args) throws IOException {
        CompareIntParsing cip=new CompareIntParsing();

        Path path= Paths.get("/home/xiaohe/workspace/DATA/Random/randomNums.dat");

        byte[] data = Files.readAllBytes(path);

        long startTime= System.currentTimeMillis();
        cip.parseIntByDigits(data);
        long totalT= System.currentTimeMillis() - startTime;
        System.out.println("It takes method parseIntByDigits "+ totalT +" ms to parse "+RandomNumGen.size+" ints");

        //std lib
        startTime = System.currentTimeMillis();
        cip.parseIntByStdLib(data);
        totalT = System.currentTimeMillis() - startTime;
        System.out.println("It takes method parseIntByStdLib "+ totalT + " ms to parse "+RandomNumGen.size+" ints");

    }
}
