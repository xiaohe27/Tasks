import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

/**
 * Created by xiaohe on 1/31/15.
 */
public class RandomNumGen {

    public static final int size= 100000000;

    public static void main(String[] args) throws IOException {


        Random ran= new Random();
        int limit = 5000000;


        FileWriter fw=new FileWriter("/home/xiaohe/workspace/DATA/Random/randomNums.dat");

        BufferedWriter bw = new BufferedWriter(fw);


        for (int i = 0; i < size; i++) {
            bw.write(String.valueOf(ran.nextInt(limit)));
            bw.write(" ");
        }


        if (bw != null) {
            bw.close();
        }

    }
}
