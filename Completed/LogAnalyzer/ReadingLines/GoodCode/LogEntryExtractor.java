package log;

import reg.RegHelper;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.CharBuffer;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Matcher;

/**
 * Serves as lexer and parser for log file.
 */
public class LogEntryExtractor {

    /**
     * Given a table name, return the list of types that represent the types for each column (table schema).
     */
    private HashMap<String, Integer[]> TableCol;
    private File logFile;
    private Scanner scan;
//    private CharBuffer charBuffer;

    private RegHelper regHelper;
    private long fileSize;
    private FileChannel fileChannel;
    private int numOfLoads = 0;
    public static final int BuffSize = 50 * 1024;

    //    private ByteBuffer mbb = ByteBuffer.allocateDirect(BuffSize);
    private MappedByteBuffer mbb;

    public LogEntryExtractor(HashMap<String, Integer[]> tableCol, File logFile) throws IOException {
        this.TableCol = tableCol;
        this.logFile = logFile;
        this.regHelper = new RegHelper(tableCol);
        this.init();
    }

//    public LogEntryExtractor(HashMap<String, Integer[]> tableCol) {
//        this.TableCol = tableCol;
//        InputStreamReader isReader = new InputStreamReader(System.in);
//        scan = new Scanner(new BufferedReader(isReader));
//    }


    /**
     * Create a CharSequence from a file using nio's methods.
     * The code is copied directly from the Internet:
     * http://www.java2s.com/Code/Java/File-Input-Output/ApplyingRegularExpressionsontheContentsofaFile.htm
     *
     * @param file
     * @return
     * @throws IOException
     */
    public static CharSequence fromFile(File file) throws IOException {
        FileInputStream fis = new FileInputStream(file);
        FileChannel fc = fis.getChannel();
        return fromFile_Range(file, 0, fc.size());
    }

    public static CharSequence fromFile_Range(File file, long start, long len) throws IOException {
        FileInputStream fis = new FileInputStream(file);
        FileChannel fc = fis.getChannel();
        // Create a read-only CharBuffer on the file
        MappedByteBuffer bbuf = fc.map(FileChannel.MapMode.READ_ONLY, start, len);
        CharBuffer cbuf = Charset.forName("8859_1").newDecoder().decode(bbuf);
        System.out.println("Is mapped byte buffer direct? " + bbuf.isDirect());

        System.out.println("Is char buffer direct? " + cbuf.isDirect());
        return cbuf;
    }

    public static MappedByteBuffer fromFileToByteBuffer(File file) throws IOException {
//        FileInputStream fis = new FileInputStream(file);
//        FileChannel fc = fis.getChannel();
        RandomAccessFile raf = new RandomAccessFile(file.getAbsolutePath(), "r");
        FileChannel fc = raf.getChannel();
        // Create a read-only CharBuffer on the file
        MappedByteBuffer bbuf = fc.map(FileChannel.MapMode.READ_ONLY, 0, fc.size());
        System.out.println("Is mapped byte buffer direct? " + bbuf.isDirect());
        System.out.println("Is mbb loaded? " + bbuf.isLoaded());
        return bbuf;
    }

    private int loadByteBuffer() throws IOException {
//        this.mbb= this.fileChannel.map(FileChannel.MapMode.READ_WRITE, (numOfLoads++) * BuffSize, BuffSize);
        return this.fileChannel.read(this.mbb);
    }

    private void init() throws IOException {
//        FileInputStream fis = new FileInputStream(this.logFile);
//        this.fileChannel = fis.getChannel();
//        this.fileSize = this.fileChannel.size();
        this.mbb = fromFileToByteBuffer(this.logFile);

//        this.charBuffer = Charset.forName("8859_1").newDecoder().decode(mappedByteBuffer);
//        System.out.println("CharBuffer is direct? " + this.charBuffer.isDirect());
    }


    public String getLine() throws IOException {
        String line = "";
        while (true) {
            while (this.mbb.hasRemaining()) {
                char c = (char) this.mbb.get();
                line += c;
                if (c == '\n') {
                    return line;
                }
            }

            this.mbb.clear();
            int retCode = this.loadByteBuffer();
            if (retCode == -1)
                break;
            this.mbb.flip();

        }

        if (line.equals(""))
            line = null;
        return line;
    }

    public void start() throws IOException {
        long numOfLogEntries = 0;
        int numOfLines = 0;
        int numOfBytes = 0;
        byte newLine = (byte) '\n';
        int index = 0;

        int bufSiz = 60;
        byte[] bytes = new byte[bufSiz];
        while (this.mbb.hasRemaining()) {
//            byte b=this.mbb.get();
            bytes[index++] = this.mbb.get();
            if (bytes[index - 1] == newLine) {
                numOfLines++;
                String str = new String(bytes, 0, index);
                bytes = new byte[bufSiz];
                index = 0;
//                String line= this.mbb.get
            }
//            numOfBytes++;
        }
//        String line = "";
//        this.loadByteBuffer();
//        this.mbb.flip();
//        while ((line= this.getLine()) != null){
//            numOfLines++;
//        }
//        String line=null;
////        BufferedReader br=new BufferedReader(new FileReader(this.logFile));
//        BufferedReader br= Files.newBufferedReader(this.logFile.toPath(), Charset.forName("8859_1"));

//        while (( line = br.readLine()) != null){
//            numOfLines++;
//        }
//        while (this.mbb.hasRemaining()) {
////            String line= this.getLine();
//                char c = (char) this.mbb.get();
//                line += c;
//                if (c == '\n') {
//                    numOfLines++;
//                    line="";
//                }
////            System.out.println(line+"!");
//        }
        System.out.println("There are " + numOfLines + " lines");
    }

    /**
     * Just test whether the efficiency can be improved.
     */
    public void start_matcherBuggy() throws IOException {
        long numOfLogEntries = 0;
        int endIndex = 0; //get the end index of the last match
        CharSequence cs = fromFile(this.logFile);
        Matcher matcher = RegHelper.TimeStampPat.matcher(cs);

        while (matcher.find()) {
            String ts = matcher.group(1);    //get the timestamp
            System.out.println("ts is " + ts);

            matcher.usePattern(RegHelper.StringPat);  // try to find event name

            List<LogEntry.Event> eventList = new ArrayList<>();
            while (matcher.find()) {
                String eventName = matcher.group(1); //get the event name
                System.out.println("We found the new event : " + eventName);

                matcher.usePattern(this.regHelper.eventTupleRegEx.get(eventName));

                System.out.println("The event " + eventName + "'s tuple's pattern is " +
                        this.regHelper.eventTupleRegEx.get(eventName));

                Integer[] argTypes = TableCol.get(eventName);
                Object[] argsInTuple = new Object[argTypes.length];

                while (matcher.find()) {     //continuously find the tuples of the table
                    System.out.println("We found the tuple " + matcher.group(0));

                    for (int i = 0; i < argsInTuple.length; i++) {
                        String dataI = matcher.group(i + 1);

                        switch (argTypes[i]) {
                            case RegHelper.INT_TYPE:
                                argsInTuple[i] = Integer.parseInt(dataI);
                                break;


                            case RegHelper.FLOAT_TYPE:
                                argsInTuple[i] = Float.parseFloat(dataI);
                                break;


                            case RegHelper.STRING_TYPE:
                                argsInTuple[i] = dataI;
                                break;
                        }
                    }

                    eventList.add(new LogEntry.Event
                            (eventName, argsInTuple));
                    endIndex = matcher.end();
                }

                matcher.reset(cs.subSequence(endIndex, cs.length()));
                matcher.usePattern(RegHelper.StringPat);  // try to find next event name
            }

            LogEntry logEntry = new LogEntry(ts, eventList);
            System.out.println(logEntry.toString());
            numOfLogEntries++;
            matcher.usePattern(RegHelper.TimeStampPat);
        }

        System.out.println("There are " + numOfLogEntries + " log entries!");
    }
}
