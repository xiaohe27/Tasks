package test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.nio.file.StandardOpenOption;

/**
 * Created by xiaohe on 12/11/15.
 */
public class Worker extends Thread {
    private Path outputPath;

    public Worker(String name, Path outputPath) {
        super(name);
        this.outputPath = outputPath;
    }

    @Override
    public void run() {
        String content = "Testing..." + System.getProperty("line.separator");

        while (true) {
            try {
                Files.write(this.outputPath, content.getBytes(), StandardOpenOption.APPEND);
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
