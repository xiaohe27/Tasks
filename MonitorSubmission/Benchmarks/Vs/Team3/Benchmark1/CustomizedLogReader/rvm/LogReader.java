package rvm;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.nio.BufferUnderflowException;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.regex.Pattern;

import static java.nio.file.Files.newBufferedWriter;
import java.util.HashMap;
import java.util.HashSet;
import rvm.T3B1RuntimeMonitor;

public class LogReader {

    private static HashSet<String> monitoredEventSet = LogReader.initMonitoredEventsSet();
    protected static int maxNumOfParams = 1;
    private static HashMap<String, java.lang.Integer> methodInfo = LogReader.initMethodInfo();

    private static HashSet<String> initMonitoredEventsSet() {
        HashSet<String> setOfEvents = new HashSet<String>();
        setOfEvents.add("c");
        setOfEvents.add("d");
        return setOfEvents;
    }

    public static boolean isMonitoredEvent(String event) {
        return LogReader.monitoredEventSet.contains(event);
    }

    private static HashMap<String, java.lang.Integer> initMethodInfo() {
        HashMap<String, java.lang.Integer> methodInfoTable = new HashMap<String, java.lang.Integer>();
        methodInfoTable.put("c", 1);
        methodInfoTable.put("d", 1);
        return methodInfoTable;
    }

    static class MonitorMethodsInvoker {


        public static void invoke(String eventName, String[] data) {
            switch (eventName) {
                case "c":
                    T3B1RuntimeMonitor.cEvent(Integer.parseInt(data[ 0 ]));
                    break;
                case "d":
                    T3B1RuntimeMonitor.dEvent(Integer.parseInt(data[ 0 ]));
                    break;
            }
        }

    }
    
    public static interface LogExtractor {
        public void startReadingEventsByteByByte() throws IOException, NoSuchMethodException, IllegalAccessException, InvocationTargetException;
    }
    public static void main(String[] args) throws Exception {
        assert args.length == 1 && args[0].endsWith(".log") :
                "The only argument needed is the log file (with .log suffix).";

        Path path2Log = path2Log = Paths.get(args[0]);
        //LogExtractor lee = new LogEntryExtractor(methodInfo, path2Log, 6);
        LogExtractor lee = new LogEntryExtractor_CSV(methodInfo, path2Log, 6);
        lee.startReadingEventsByteByByte();
    }

}
/**
 * Serves as lexer and parser for log file.
 */
class LogEntryExtractor_CSV implements LogReader.LogExtractor {
    /**
     * Use a byte to denote different tokens in the log.
     * -1: init state, or NULL.
     * 0: time stamp;
     * 1: event name;
     * 2: event args;
     * We need to ensure a seq of tokens is accepted only if it is a word in the lang (derivable from the FSM).
     */
    public static final byte NULL_TOKEN = -1;
    public static final byte TS_TOKEN = 0;
    public static final byte EventName_TOKEN = 1;
    public static final byte EventArgs_TOKEN = 2;
    static final int Times = 2;
    static final int OneReadSize = (0xFFFFFFF + 1) * Times; //256MB as the unit size
    //some tokens
    static final byte newLine = (byte) '\n';
    static final byte space = (byte) ' ';
    static final byte tab = (byte) '\t';
    static final byte nl2 = (byte) '\r';
    static final byte space0B = 0x0B;
    static final byte spaceF = (byte) '\f';
    static final byte at = (byte) '@';
    static final byte lpa = (byte) '(';
    static final byte rpa = (byte) ')';
    static final byte comma = (byte) ',';
    static final byte hash = (byte) '#';
    static final byte doubleQuote = (byte) '\"';
    static final byte underscore = (byte) '_';
    static final byte rightBracket = (byte) ']';
    static final byte exclamation = (byte) '!';
    static final byte dot = (byte) '.';
    static final byte minus = (byte) '-';

    private final Charset asciiCharSet = Charset.forName("ISO-8859-1");
    public static long TimeStamp; //we can add the @ symbol when it is ready to be printed
    private String EventName;
    private byte prevToken = NULL_TOKEN;


    private long numOfLogEntries = 0;

    private String logFilePath;
    //    indirect optimal 8kb
//    private static final int DirectBufSizeOptimal4MyHP = 64 * 1024;
    private int BufSize;
    //    private ByteBuffer byteArr;
//    private FileChannel inChannel;
    private byte[] byteArr;
    private MappedByteBuffer mbb;
    private int posInArr;
    private byte[] oldByteArr;
    //if the ending index is less than the starting one, then the starting index comes from the old byte array
    private int paramStartIndex;

    private HashMap<String, Integer> eventArgsMap;
    private long numOfReads;
    private long lastReadSize;
    private long curNumOfReads;
    private FileChannel inChannel;

    private boolean printAll = true; //by default, print all the info of the event if a violation has been found
    private boolean[] unPrintedFields = new boolean[LogReader.maxNumOfParams];

    private boolean TERMINATE;
    /**
    /**
     * Create an obj for log entry extractor.
     *
     * @param eventArgsMap
     * @param logFile
     * @param powOf2TimesKB Multiple of 1024.
     * @throws IOException
     */
    public LogEntryExtractor_CSV(HashMap<String, Integer> eventArgsMap, Path logFile, int powOf2TimesKB)
            throws IOException {
        this.eventArgsMap = eventArgsMap;
        this.logFilePath = logFile.toString();
        this.BufSize = (int) (Math.pow(2, powOf2TimesKB)) * 1024;
        this.byteArr = new byte[this.BufSize];
        this.oldByteArr = new byte[this.BufSize];
    }


    public LogEntryExtractor_CSV(HashMap<String, Integer> eventArgsMap, Path logFile) throws IOException {
        this(eventArgsMap, logFile, 5);
    }

    private boolean isWhiteSpace(byte b) {
        return b == newLine || b == space || b == tab || b == nl2 || b == space0B || b == spaceF;
    }

    private boolean isStringChar(byte b) {
        if (b > 44 && b < 59)
            return true;
        if (b > 64 && b < 92)
            return true;

        return b > 96 && b < 123 || b == underscore || b == rightBracket || b == exclamation;

    }

    private void rmWhiteSpaceAndComma(boolean mustSucceed) throws IOException {
        out:
        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (!isWhiteSpace(b) && b != comma) {
                    this.posInArr--;
                    break out;
                }
            }

            if (mustSucceed)
                this.refill("Unexpected end of file while removing the white spaces");
            else {
                try {
                    this.refill("");
                } catch (Exception e) {

                }
            }
        }
    }


    private void skipComment() throws IOException {
        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (b == newLine || b == nl2) {
                    return;
                }
            }
            this.refill("Unexpected end of file while removing the comments");
        }
    }

    private void skipLine() throws IOException {
        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (b == newLine) {
                    return;
                }
            }

            try {
                this.refill("");
            } catch (Exception e) {
            }

        }
    }

    private String getString() throws IOException {
        this.rmWhiteSpaceAndComma(true);
        StringBuilder sb = new StringBuilder();
        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (b == comma || isWhiteSpace(b)) {
                    return sb.toString();
                } else {
                    sb.append((char) b);
                }
            }
            this.refill("Unexpected end of file while reading a string.");
        }
    }

    private String getLastArg() throws IOException {
        this.rmWhiteSpaceAndComma(true);
        StringBuilder sb = new StringBuilder();
        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (isWhiteSpace(b) || b == comma) {
                    return sb.toString();
                } else {
                    sb.append((char) b);
                }
            }
            try {
                this.refill("");
            } catch (Exception e) {
                return sb.toString();
            }
        }
    }

    /**
     * Get an int number from byte byteArr (not check thoroughly, assume white spaces).
     *
     * @return
     * @throws IOException
     */
    private int getIntFromBuf(byte delim) throws IOException {
        int result = 0;
        boolean isNeg = false;

        if (this.byteArr[this.posInArr] == minus) {
            this.posInArr++;
            isNeg = true;
        }

        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
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
                    if (isNeg) {
                        result = -result;
                    }

                    if (b == delim)
                        return result;

                    this.rmWhiteSpaceAndComma(true);
                    if (this.byteArr[this.posInArr++] == delim) {
                        return result;
                    } else {
                        throw new IOException("Unexpected delimiter " + (char) this.byteArr[this.posInArr - 1]);
                    }
                }
            }

            refill("Unexpected end of file while parsing an integer");
        }

    }

    public void startReadingEventsByteByByte() throws IOException {

        RandomAccessFile aFile = new RandomAccessFile
                (this.logFilePath, "r");

        this.inChannel = aFile.getChannel();
        long fileSize = inChannel.size();

//        System.out.println("There are totally "+this.fileSize+" bytes in the file");
        this.numOfReads = fileSize / OneReadSize;
        this.lastReadSize = fileSize % OneReadSize;

        while (this.curNumOfReads <= this.numOfReads) {
            this.mbb = inChannel.map(FileChannel.MapMode.READ_ONLY,
                    this.curNumOfReads * OneReadSize, this.curNumOfReads == numOfReads ? lastReadSize : OneReadSize);
            this.curNumOfReads++;
//        System.out.println("Log is loaded? "+this.mbb.isLoaded());
//        System.out.println("MBB is direct? "+this.mbb.isDirect());
            this.mbb.load();
//        System.out.println("Again, Log is loaded? "+this.mbb.isLoaded());

            this.mbb.position(0);
            while (this.mbb.hasRemaining()) {
                try {
                    this.mbb.get(this.byteArr);
                } catch (BufferUnderflowException e) {
                    int remaining = this.mbb.remaining();

                    this.mbb.get(this.byteArr, 0, remaining);
                    this.BufSize = remaining;

                }

                this.posInArr = 0;
                //skip the header line
                this.skipLine();
                while (this.posInArr < this.BufSize) {
                    this.readLine();    //read one line
                    //handle all the violations found in the previous log entry!

                    numOfLogEntries++;
                    if (TERMINATE)
                        break;
                }

                this.posInArr = 0;
                byte[] tmp = this.oldByteArr;
                this.oldByteArr = this.byteArr;
                this.byteArr = tmp;

            }
        }


        inChannel.close();

        aFile.close();


        System.out.println("There are " +
                numOfLogEntries + " log entries in the log file!!!");

    }


    /**
     * We may decide whether to invoke an event method or not;
     * Only parse the event arg if we know we will invoke the method;
     * Even if the args are not parsed, the data types are checked against the event arg types specified in sig.
     *
     * @throws IOException
     */
    private void readLine() throws IOException {
        EventName = this.getString();
        if (LogReader.isMonitoredEvent(EventName)) {
            String[] argsOfMeth = new String[this.eventArgsMap.get(EventName)];
            for (int i = 0; i < argsOfMeth.length - 1; i++) {
            //the last arg maybe at last index, which needs to be processed separately
                String curArg = this.getString();
                argsOfMeth[i] = curArg;
            }
            argsOfMeth[argsOfMeth.length - 1] = this.getLastArg();
            this.rmWhiteSpaceAndComma(false);

            LogReader.MonitorMethodsInvoker.invoke(EventName, argsOfMeth);
        } else {
            this.skipLine();
            return;
        }
    }


    public void printEvent(Object[] data) throws IOException {
        StringBuilder sb = new StringBuilder();
        sb.append(EventName + " : ");
        sb.append(" (");
        if (this.printAll) {
            for (int i = 0; i < data.length - 1; i++) {
                sb.append(data[i] + ",");
            }

            if (data.length > 0) {
                sb.append(data[data.length - 1]);
            }

        } else {
            boolean isFirst = true;

            for (int i = 0; i < data.length; i++) {
                if (!unPrintedFields[i]) {
                    if (isFirst) {
                        isFirst = false;
                        sb.append(data[i]);
                    } else {
                        sb.append("," + data[i]);
                    }
                }
            }
        }

        sb.append(")");

        System.out.println(sb.toString());
    }

    private void refill(String errInfo) throws IOException {
        byte[] tmp = this.oldByteArr;
        this.oldByteArr = this.byteArr;
        this.byteArr = tmp;

        this.posInArr = 0;

        while (true) {
            try {
                this.mbb.get(this.byteArr);
                break;
            } catch (BufferUnderflowException e) {
                int remaining = this.mbb.remaining();
                if (remaining > 0) {
                    this.mbb.get(this.byteArr, 0, remaining);
                    this.BufSize = remaining;
                    break;
                } else {
                    if (this.curNumOfReads <= this.numOfReads) {
                        this.mbb = inChannel.map(FileChannel.MapMode.READ_ONLY,
                                this.curNumOfReads * OneReadSize, this.curNumOfReads == numOfReads ? lastReadSize : OneReadSize);
                        this.curNumOfReads++;
                        this.mbb.position(0);

                        System.gc();

                    } else {
                        TERMINATE = true;
                        throw new IOException(errInfo);
                    }
                }
            }
        }
    }

}

class RegHelper {
    public static final int INT_TYPE = 0;
    public static final int FLOAT_TYPE = 1;
    public static final int STRING_TYPE = 4;

    // '_' | '[' | ']' | '/' | ':' | '-' | '.' | '!')* | '"'[^'"']*'"'

    public static final String IntReg = "(\\d+)";
    public static final String FloatReg = "(\\d*.\\d+)";
    public static final String DoubleQuotesRegEx = "\"[^\"]+\"";
    public static final String StringRegEx = "(" + "[\\w\\[\\]\\/\\:\\-\\.\\!]+|" + DoubleQuotesRegEx + ")";
    public static final String TimeStamp = "(@\\d+)";


    public final HashMap<String, Pattern> eventTupleRegEx;


    public RegHelper(HashMap<String, Integer[]> tableCol) {
        this.eventTupleRegEx = this.init(tableCol);
    }


    private HashMap<String, Pattern> init(HashMap<String, Integer[]> tableCol) {
        HashMap<String, Pattern> eventNameAndTupleRegexMap = new HashMap<>();

        for (String eventName : tableCol.keySet()) {
            Integer[] types = tableCol.get(eventName);

            String regex = "";

            if (types.length == 0) {
                regex = "\\s*\\(\\s*\\s)";
            } else {
                switch (types[0]) {
                    case INT_TYPE:
                        regex = IntReg;
                        break;

                    case FLOAT_TYPE:
                        regex = FloatReg;
                        break;

                    case STRING_TYPE:
                        regex = StringRegEx;
                        break;
                }

                regex = "\\s*" + regex; //the first field

                for (int i = 1; i < types.length; i++) {
                    String tmp = "";

                    switch (types[i]) {
                        case INT_TYPE:
                            tmp = IntReg;
                            break;

                        case FLOAT_TYPE:
                            tmp = FloatReg;
                            break;

                        case STRING_TYPE:
                            tmp = StringRegEx;
                            break;
                    }

                    regex += "\\s*,\\s*" + tmp;
                }
                regex = "\\s*\\(" + regex + "\\s*\\)";
            }

            //gen the event name and corresponding tuple's reg ex.
            eventNameAndTupleRegexMap.put(eventName, Pattern.compile(regex));

        }

        return eventNameAndTupleRegexMap;
    }

    public void showEventTupleRegEx() {
        for (String eventName : this.eventTupleRegEx.keySet()) {
            System.out.println(eventName + "'s tuple's reg ex is: " + this.eventTupleRegEx.get(eventName));
        }
    }
}
