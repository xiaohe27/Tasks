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
import rvm.Insert2RuntimeMonitor;

public class LogReader {

    private static HashSet<String> monitoredEventSet = LogReader.initMonitoredEventsSet();
    protected static int maxNumOfParams = 6;
    private static HashMap<String, java.lang.Integer> methodInfo = LogReader.initMethodInfo();

    private static HashSet<String> initMonitoredEventsSet() {
        HashSet<String> setOfEvents = new HashSet<String>();
        setOfEvents.add("script_end");
        setOfEvents.add("script_svn");
        setOfEvents.add("select");
        setOfEvents.add("commit");
        setOfEvents.add("insert");
        setOfEvents.add("update");
        setOfEvents.add("delete");
        setOfEvents.add("script_md5");
        setOfEvents.add("script_start");
        return setOfEvents;
    }

    public static boolean isMonitoredEvent(String event) {
        return LogReader.monitoredEventSet.contains(event);
    }

    private static void endEvent() {
        Insert2RuntimeMonitor.actionsAtTheEnd();
    }

    private static HashMap<String, java.lang.Integer> initMethodInfo() {
        HashMap<String, java.lang.Integer> methodInfoTable = new HashMap<String, java.lang.Integer>();
        methodInfoTable.put("script_end", 2);
        methodInfoTable.put("script_svn", 6);
        methodInfoTable.put("select", 5);
        methodInfoTable.put("commit", 3);
        methodInfoTable.put("insert", 5);
        methodInfoTable.put("update", 5);
        methodInfoTable.put("delete", 5);
        methodInfoTable.put("script_md5", 3);
        methodInfoTable.put("script_start", 2);
        return methodInfoTable;
    }

    static class MonitorMethodsInvoker {


        public static void invoke(String eventName, String[] data) {
            switch (eventName) {
                case "script_end":
                    Insert2RuntimeMonitor.script_endEvent(data[ 0 ], Long.parseLong(data[ 1 ]));
                    break;
                case "script_svn":
                    Insert2RuntimeMonitor.script_svnEvent(data[ 0 ], data[ 1 ], data[ 2 ], Integer.parseInt(data[ 3 ]), Integer.parseInt(data[ 4 ]), Long.parseLong(data[ 5 ]));
                    break;
                case "select":
                    Insert2RuntimeMonitor.selectEvent(data[ 0 ], data[ 1 ], data[ 2 ], data[ 3 ], Long.parseLong(data[ 4 ]));
                    break;
                case "commit":
                    Insert2RuntimeMonitor.commitEvent(data[ 0 ], Integer.parseInt(data[ 1 ]), Long.parseLong(data[ 2 ]));
                    break;
                case "insert":
                    Insert2RuntimeMonitor.insertEvent(data[ 0 ], data[ 1 ], data[ 2 ], data[ 3 ], Long.parseLong(data[ 4 ]));
                    break;
                case "update":
                    Insert2RuntimeMonitor.updateEvent(data[ 0 ], data[ 1 ], data[ 2 ], data[ 3 ], Long.parseLong(data[ 4 ]));
                    break;
                case "delete":
                    Insert2RuntimeMonitor.deleteEvent(data[ 0 ], data[ 1 ], data[ 2 ], data[ 3 ], Long.parseLong(data[ 4 ]));
                    break;
                case "script_md5":
                    Insert2RuntimeMonitor.script_md5Event(data[ 0 ], data[ 1 ], Long.parseLong(data[ 2 ]));
                    break;
                case "script_start":
                    Insert2RuntimeMonitor.script_startEvent(data[ 0 ], Long.parseLong(data[ 1 ]));
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
        LogExtractor lee = new LogEntryExtractor(methodInfo, path2Log, 6);
        lee.startReadingEventsByteByByte();
	endEvent();
    if (com.runtimeverification.rvmonitor.java.rt.RVMStat.statisticsManager != null 
&& ! com.runtimeverification.rvmonitor.java.rt.RVMStat.statisticsManager.hasAlreadyReported()) {
com.runtimeverification.rvmonitor.java.rt.RVMStat.statisticsManager.printStats();
}
System.out.println("Property Satisfied");

}
}
/**
 * Serves as lexer and parser for log file.
 */
class LogEntryExtractor implements LogReader.LogExtractor {
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

    private HashMap<String, Integer> eventArgsMap;
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

    private int EventNameStartIndex;
    private int paramStartIndex;

    private long numOfReads;
    private long lastReadSize;
    private long curNumOfReads;
    private FileChannel inChannel;

    private boolean printAll = true; //by default, print all the info of the event if a violation has been found
    private boolean[] unPrintedFields = new boolean[LogReader.maxNumOfParams];

    /**
     * Create an obj for log entry extractor.
     *
     * @param eventArgsMap
     * @param logFile
     * @param powOf2TimesKB Multiple of 1024.
     * @throws IOException
     */
    public LogEntryExtractor(HashMap<String, Integer> eventArgsMap, Path logFile, int powOf2TimesKB)
            throws IOException {
        this.eventArgsMap = eventArgsMap;
        this.logFilePath = logFile.toString();
        this.BufSize = (int) (Math.pow(2, powOf2TimesKB)) * 1024;
        this.byteArr = new byte[this.BufSize];
        this.oldByteArr = new byte[this.BufSize];
    }


    public LogEntryExtractor(HashMap<String, Integer> eventArgsMap, Path logFile) throws IOException {
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

    private String getEventName() throws IOException {
        int len = 1;

        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (isStringChar(b)) {
                    len++;
                } else {
                    if (b == lpa) {
                        this.posInArr--;
                    }

                    return this.getStringFromBytes(this.EventNameStartIndex, len);
                }
            }

            this.refill("Unexpected end of file while parsing an event name");
        }

    }

    private String getStringFromBuf(byte delim) throws IOException {
        int len = 0;
        String output;
        while (true) {
            if (this.posInArr < this.BufSize && len == 0 && byteArr[this.posInArr] == doubleQuote) {
                this.posInArr++;
                return this.getQuotedStringFromBuf(delim);
            }

            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (isStringChar(b)) {
                    len++;
                } else {
                    output = this.getStringFromBytes(this.paramStartIndex, len);
                    if (b == delim)
                        return output;

                    this.rmWhiteSpace();
                    if (this.byteArr[this.posInArr++] == delim) {
                        return output;
                    } else {
                        throw new IOException("Unexpected delimiter " + (char) this.byteArr[this.posInArr - 1]);
                    }
                }
            }

            this.refill("Unexpected end of file while parsing a string");
        }
    }

    /**
     * Only invoked by getStringFromBuf, and used to extract tuple's field of type String.
     *
     * @param delim
     * @return
     * @throws IOException
     */
    private String getQuotedStringFromBuf(byte delim) throws IOException {
        int len = 0;
        String output;

        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (b != doubleQuote) {
                    len++;
                } else {
                    output = this.getStringFromBytes(this.paramStartIndex, len);

                    this.rmWhiteSpace();
                    if (this.byteArr[this.posInArr++] == delim) {
                        return output;
                    } else {
                        throw new IOException("Unexpected delimiter " + (char) this.byteArr[this.posInArr - 1]);
                    }

                }
            }

            this.refill("Unexpected end of file while parsing a quoted string");
        }
    }

    private String getQuotedStringFromBuf(int startIndex) throws IOException {
        int len = 0;

        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (b != doubleQuote) {
                    len++;
                } else {
                    return this.getStringFromBytes(startIndex, len);
                }
            }

            this.refill("Unexpected end of file while reading a quoted string");
        }
    }

    private void rmWhiteSpace() throws IOException {
        out:
        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (!isWhiteSpace(b)) {
                    this.posInArr--;
                    break out;
                }
            }

            this.refill("Unexpected end of file while removing the white spaces");
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

    private void getTSFromBuf() throws IOException {
        int TimeStampStartIndex = this.posInArr;

        int TimeStampLen = 0;
        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (b > 47 && b < 58 || b == dot) {
                    TimeStampLen++;
                } else {
                    String out;

                    if (this.posInArr > TimeStampStartIndex) {
                        out = new String(this.byteArr, TimeStampStartIndex,
                                TimeStampLen, this.asciiCharSet);
                    } else if (this.posInArr == this.EventNameStartIndex) {
                        throw new IOException("Empty Time Stamp!");
                    } else {
                        int sizInOldBuf = this.BufSize - TimeStampStartIndex;
                        out = new String(this.oldByteArr, TimeStampStartIndex,
                                sizInOldBuf, this.asciiCharSet) +
                                new String(this.byteArr, 0, TimeStampLen - sizInOldBuf, this.asciiCharSet);
                    }

                    TimeStamp = Math.round(Double.parseDouble(out));

                    return;
                }
            }

            this.refill("Unexpected end of file while parsing a time stamp");
        }
    }

    //b > 47 && b < 58 then b is a digit char
    private double getFloatingNumFromBuf(byte delim) throws IOException {
        int len = 0;
        String output;
        if (this.byteArr[this.posInArr] == minus) {
            this.posInArr++;
            len++;
        }

        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (b > 47 && b < 58 || b == dot) {
                    len++;
                } else {
                    output = this.getStringFromBytes(this.paramStartIndex, len);
                    if (b == delim)
                        return Double.parseDouble(output);

                    this.rmWhiteSpace();
                    if (this.byteArr[this.posInArr++] == delim) {
                        return Double.parseDouble(output);
                    } else {
                        throw new IOException("Unexpected delimiter " + (char) this.byteArr[this.posInArr - 1]);
                    }
                }
            }

            this.refill("Unexpected end of file while parsing a floating number");
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

                    this.rmWhiteSpace();
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

    private void looseCheckingEventArgs() throws IOException {
        boolean isCurFieldEmpty = true;
        boolean canSeeComma = false;
        boolean canAppend = true;


        while (true) {
            while (this.posInArr < this.BufSize) {
                byte b = byteArr[this.posInArr++];
                if (isStringChar(b)) {
                    canSeeComma = false;
                    if (isCurFieldEmpty) {
                        isCurFieldEmpty = false;
                        canAppend = true;
                    } else {
                        if (canAppend) {

                        } else {
                            throw new IOException("Syntax error found in the event " + this.EventName + "'s args");
                        }
                    }

                } else if (b == comma) {
                    if (isCurFieldEmpty) {
                        throw new IOException("Should have something before comma in the event " + this.EventName + "'s args");
                    }

                    isCurFieldEmpty = true;
                    canSeeComma = true;
                    canAppend = true;
                } else if (isWhiteSpace(b)) {
                    canAppend = false;
                } else if (b == rpa) {

                    if (canSeeComma)
                        throw new IOException("Empty between last comma and right bracket in event " + EventName + "'s args");

                    else
                        return;
                } else if (b == doubleQuote) {
                    if (isCurFieldEmpty) {
                        this.getQuotedStringFromBuf(this.posInArr);
                        isCurFieldEmpty = false;
                        canAppend = false;
                    } else {
                        throw new IOException("Syntax error found in the event " + this.EventName + "'s args");
                    }


                } else {
                    throw new IOException("Unknown char " + (char) b);
                }
            }

            refill("Unexpected end of file");
        }
    }

    public void startReadingEventsByteByByte() throws IOException {

        RandomAccessFile aFile = new RandomAccessFile
                (this.logFilePath, "r");

        this.inChannel = aFile.getChannel();
        long fileSize = inChannel.size();

        this.numOfReads = fileSize / OneReadSize;
        this.lastReadSize = fileSize % OneReadSize;

        while (this.curNumOfReads <= this.numOfReads) {
            this.mbb = inChannel.map(FileChannel.MapMode.READ_ONLY,
                    this.curNumOfReads * OneReadSize, this.curNumOfReads == numOfReads ? lastReadSize : OneReadSize);
            this.curNumOfReads++;

            this.mbb.load();

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
                while (this.posInArr < this.BufSize) {
                    byte b = this.byteArr[this.posInArr++];
                    if (isWhiteSpace(b))
                        continue;

                    //change the order of different branches, cmp whether we can gain perf benefits by
                    //considering the probabilities.
                    if (b == lpa) { // read the event args
                        //ensure it is valid to have an event args followed by prev thing
                        if (this.prevToken != EventName_TOKEN &&
                                this.prevToken != EventArgs_TOKEN) {
                            throw new IOException("Event args should follow an event name or event args");
                        }
                        this.prevToken = EventArgs_TOKEN;

                            this.rmWhiteSpace();

                            this.readEvent();

                    } else if (isStringChar(b) || b == doubleQuote) { //read an event
                        if (this.prevToken == NULL_TOKEN) {
                            throw new IOException("Event name should follow a time stamp or event args or event name");
                        }

                        this.prevToken = EventName_TOKEN;

                        if (b == doubleQuote) {
                            this.EventNameStartIndex = this.posInArr;
                            this.EventName = this.getQuotedStringFromBuf(this.EventNameStartIndex);

                        } else {
                            this.EventNameStartIndex = this.posInArr - 1;
                            this.EventName = this.getEventName();

                        }

                    } else if (b == at) {

                        if (this.prevToken != EventArgs_TOKEN && this.prevToken != NULL_TOKEN) {
                            throw new IOException("Time stamp should follow event args or null (if it is the first token in the file)");
                        }
                        this.prevToken = TS_TOKEN;

                        this.rmWhiteSpace();
                        this.getTSFromBuf();
                        numOfLogEntries++;
                    } else if (b == hash) {
                        this.skipComment();
                    } else if (b == 0) {
                        break;
                    } else {
                        throw new IOException("Unexpected char'" + (char) b + "'");
                    }
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
    private void readEvent() throws IOException {
        String[] argsOfMeth = new String[eventArgsMap.get(EventName)];

            if (argsOfMeth.length > 1) {
                for (int i = 0; i < argsOfMeth.length - 2; i++) {
                        this.paramStartIndex = this.posInArr;
                    //the last arg maybe at last index, which needs to be processed separately
                    String curArg = this.getStringFromBuf(comma);
                    argsOfMeth[i] = curArg;

                    this.rmWhiteSpace();
                }

                this.paramStartIndex = this.posInArr;
                argsOfMeth[argsOfMeth.length - 2] = this.getStringFromBuf(rpa);

                argsOfMeth[argsOfMeth.length - 1] = TimeStamp + "";
            }

        LogReader.MonitorMethodsInvoker.invoke(EventName, argsOfMeth);

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


    private String getStringFromBytes(int start, int len) throws IOException {
        String output;

        if (this.posInArr > start) {
            output = new String(this.byteArr, start,
                    len, this.asciiCharSet);
        } else if (this.posInArr == this.EventNameStartIndex) {
            throw new IOException("Empty String!");
        } else {//start index is a pos in the old byte array.
            int remainingSizInOldBuf = this.oldByteArr.length - start;
//            System.out.println("Remaining siz of old buf is "+remainingSizInOldBuf+";\nstart: "
//            +start+"\nlen is "+len);
            if (remainingSizInOldBuf >= len)
                output = new String(this.oldByteArr, start, len, this.asciiCharSet);
            else
                output = new String(this.oldByteArr, start,
                        remainingSizInOldBuf, this.asciiCharSet) +
                        new String(this.byteArr, 0, len - remainingSizInOldBuf, this.asciiCharSet);
        }

        return output;
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
