package test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

/**
 * Created by xiaohe on 12/11/15.
 */
public class Worker extends Thread {

    private FilePath outputPath;
    public Worker(String name, Path outputPath) {
        super(name);
        this.outputPath = new FilePath(outputPath);
    }

    @Override
    public void run() {
        String content = "Testing..." + System.getProperty("line.separator");

        while (true) {
            try {
                Path path = this.outputPath.getOutputPath();
                Files.write(path, content.getBytes(), StandardOpenOption.APPEND);
                Thread.sleep(1500);
            } catch (IOException e) {
                e.printStackTrace();
                System.exit(0);
            } catch (InterruptedException e) {
                e.printStackTrace();
                System.exit(1);
            }
        }
    }
}
