package test;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

public class Main {

    private static Path setUpPath(String fileName) throws IOException {
        File file = new File(fileName);
        if (file.exists() == false) {
            file.createNewFile();
        }

        return file.toPath();
    }

    public static void main(String[] args) throws IOException {
        String fileName = "output.txt";
        Path outputPath = setUpPath(fileName);

        Worker worker = new Worker("Tester", outputPath);

        worker.run();
    }
}
