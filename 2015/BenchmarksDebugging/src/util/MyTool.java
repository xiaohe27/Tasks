package util;

import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

/**
 * Created by xiaohe on 4/12/15.
 */
public class MyTool {
    private static final String basePath = "/home/xiaohe/TESTING/BenchmarkDebugging_LOGS/";

    BufferedWriter bufferedWriter;

    public MyTool() {
//        Path outputFile = Paths.get(basePath + System.currentTimeMillis() + ".record.log");
//        try {
//            outputFile.toFile().createNewFile();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        try {
//            this.bufferedWriter = Files.newBufferedWriter(outputFile, StandardOpenOption.APPEND);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    public void write2Log(String string) {
//        try {
//            this.bufferedWriter.write(string);
//            this.flush();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    public void flush() throws IOException {
//        this.bufferedWriter.flush();
    }
 }
