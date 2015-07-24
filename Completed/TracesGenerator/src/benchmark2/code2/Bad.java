package code2;// Copyright (c) 2002-2014 JavaMOP Team. All Rights Reserved.

import common.BadTest;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Bad extends BadTest {

    @Override
    public void run1() {
        FileWriter fw_1=null;
        FileWriter fw_2=null;
        FileWriter fw_3=null;
        FileWriter fw_4=null;
        FileWriter fw_5=null;
        try{
            fw_1 = new FileWriter(File.createTempFile(testID + "javamoptest1", ".tmp"));
            fw_2 = new FileWriter(File.createTempFile(testID + "javamoptest2", ".tmp"));
            fw_3 = new FileWriter(File.createTempFile(testID + "javamoptest3", ".tmp"));
            fw_4 = new FileWriter(File.createTempFile(testID + "javamoptest4", ".tmp"));
            fw_5 = new FileWriter(File.createTempFile(testID + "javamoptest5", ".tmp"));

            fw_1.write("testing\n");
            fw_2.write("testing\n");
            fw_3.write("testing\n");
            fw_4.write("testing\n");
            fw_5.write("testing\n");

            fw_1.write("testing\n");
            fw_2.write("testing\n");
            fw_4.write("testing\n");
            fw_5.write("testing\n");

            fw_1.write("testing\n");
            fw_3.write("testing\n");
            fw_5.write("testing\n");

            fw_1.close();
            fw_2.close();
            fw_3.close();
            fw_4.close();
            fw_5.close();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        try{
            fw_1.write("testing\n");
        } catch (Exception e) {
        }
        try{
            fw_2.write("testing\n");
        } catch (Exception e) {
        }
        try{
            fw_4.write("testing\n");
        } catch (Exception e) {
        }
    }

    @Override
    public void run2() {
        FileWriter fw = null;
        try {
            fw = new FileWriter(File.createTempFile(testID + "javamoptest1", ".tmp"));
            fw.close();

            fw.write("testing");

        } catch (IOException e) {
            System.err.println(e.getMessage());
        }
    }

    @Override
    public void run3() {
        FileWriter fw1 = null;
        FileWriter fw2 = null;

        try {
            fw2 = new FileWriter(File.createTempFile(testID + "javamoptest2", ".tmp"));

            fw2.write("testing\n");
            fw2.write("testing\n");
            fw2.close();

            fw1 = new FileWriter(File.createTempFile(testID + "javamoptest1", ".tmp"));
            fw1.close();

            fw2.write("testing\n");

        } catch (IOException e) {
            System.err.println(e.getMessage());
        }
    }
}
