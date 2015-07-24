package log;
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
import java.util.HashMap;
import java.util.regex.Pattern;

import static java.nio.file.Files.newBufferedWriter;
import java.util.List;
import rvm.InsertRawMonitor;
import rvm.InsertRuntimeMonitor;

public class LogReader {


    static class MonitorMethodsInvoker {


        public static void invoke(java.lang.String eventName, Object[] data, List<Object[]> violationsInCurLogEntry) {
            InsertRawMonitor.hasViolation = false;
            switch (eventName) {
                case "insert":
                    InsertRuntimeMonitor.insertEvent(((String) data[ 0 ]), ((String) data[ 1 ]), ((String) data[ 2 ]), ((String) data[ 3 ]));
                    break;
            }
            if (InsertRawMonitor.hasViolation) {
                violationsInCurLogEntry.add(data);
            }
        }

    }
    
    private static String outputPathStr = "./test-out/violation.txt";
    public static Path outputPath = Paths.get(outputPathStr);

    private static void initOutputFile() throws IOException {
        File file = outputPath.toFile();
        if (file.exists()) {
            new PrintWriter(file).close();
        } else {
            if (outputPath.getParent().toFile().exists()) {
                file.createNewFile();
            } else {
                outputPath.getParent().toFile().mkdirs();
                file.createNewFile();
            }
        }
    }

    public static void main(String[] args) throws IOException {
        if (args.length > 2 || args.length < 1) {
            System.err.println("Two args should be provided in this order: <path to rvm spec file>" +
                    " <path to log file> \nOr omit the path to log file,"
                    + " in which case the contents of log file will be read from the System.in");
        }

        initOutputFile();

        Path path2SigFile = Paths.get(args[0]);

        //if there is no log file's path is given, then the log will be read from stdin
        Path path2Log = null;
        if (args.length == 2) {
            path2Log = Paths.get(args[1]);
        } else {
            throw new IOException("Does not support reading form std input yet.");
        }


        LogEntryExtractor lee = new LogEntryExtractor(EventSigExtractor.extractMethoArgsMappingFromSigFile(path2SigFile.toFile()), path2Log, 6);

        lee.startReadingEventsByteByByte();
    }

    public static interface LogExtractor {
        public void startReadingEventsByteByByte() throws IOException, NoSuchMethodException, IllegalAccessException, InvocationTargetException;
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
    private long TimeStamp; //we can add the @ symbol when it is ready to be printed
    private String EventName;
    private byte prevToken = NULL_TOKEN;


    private long numOfLogEntries = 0;

    /**
     * Given a table name, return the list of types that represent the types for each column (table schema).
     */
    private HashMap<String, int[]> TableCol;
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
//    private int TimeStampStartIndex;  //starting: [
//    private int TimeStampLen;    //ending )
    private int EventNameStartIndex;

    private int paramStartIndex;

    private int[] typesInTuple;
    private boolean isAMonitoredEvent;

    private long numOfReads;
    private long lastReadSize;
    private long curNumOfReads;
    private FileChannel inChannel;

    private boolean[] unPrintedFields = new boolean[EventSigExtractor.maxNumOfParams];

    private ArrayList<Object[]> violationsInCurLogEntry = new ArrayList<>();

    /**
     * Create an obj for log entry extractor.
     *
     * @param tableCol
     * @param logFile
     * @param powOf2TimesKB Multiple of 1024.
     * @throws IOException
     */
    public LogEntryExtractor(HashMap<String, int[]> tableCol, Path logFile, int powOf2TimesKB)
            throws IOException {
        this.TableCol = tableCol;
        this.logFilePath = logFile.toString();
        this.BufSize = (int) (Math.pow(2, powOf2TimesKB)) * 1024;
        this.byteArr = new byte[this.BufSize];
        this.oldByteArr = new byte[this.BufSize];
    }


    public LogEntryExtractor(HashMap<String, int[]> tableCol, Path logFile) throws IOException {
        this(tableCol, logFile, 5);
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


                        if (this.isAMonitoredEvent) {//do the most rigorous type checking to the event args
                            this.rmWhiteSpace();

                            this.readEvent();
                        } else {//event is not monitored, just ensure no syntax error
                            this.looseCheckingEventArgs();
                        }
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

                        this.typesInTuple = TableCol.get(EventName);
                        if (this.typesInTuple == null) {
                            throw new IOException("Unknown event " + EventName);
                        }

                        if (EventSigExtractor.isMonitoredEvent(EventName)) {
                            this.isAMonitoredEvent = true;
                            //the boolean list contains info about how to skip certain fields when output the violations
                            this.unPrintedFields = EventSigExtractor.skippedFieldsMap.get(EventName);
                        } else {
                            this.isAMonitoredEvent = false;
                        }

                    } else if (b == at) {

                        //handle all the violations found in the previous log entry!
                        if (this.violationsInCurLogEntry.size() > 0) {
                            handleViolationsInLogEntry();
                        }

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

        //handle the last entry's violations if there are any
        if (this.violationsInCurLogEntry.size() > 0) {
            handleViolationsInLogEntry();
        }

        System.out.println("There are " +
                numOfLogEntries + " log entries in the log file!!!");

        Utils.MyUtils.flushOutput();
    }

    /**
     * We may decide whether to invoke an event method or not;
     * Only parse the event arg if we know we will invoke the method;
     * Even if the args are not parsed, the data types are checked against the event arg types specified in sig.
     *
     * @throws IOException
     */
    private void readEvent() throws IOException {
        Object[] tupleData = new Object[typesInTuple.length];
        int i = 0;
        for (; i < typesInTuple.length - 1; i++) {
            this.paramStartIndex = this.posInArr;

            switch (typesInTuple[i]) {
                case RegHelper.INT_TYPE:
                    tupleData[i] = this.getIntFromBuf(comma);
                    break;

                case RegHelper.FLOAT_TYPE:
                    tupleData[i] = this.getFloatingNumFromBuf(comma);
                    break;

                case RegHelper.STRING_TYPE:
                    tupleData[i] = this.getStringFromBuf(comma);
                    break;
            }
            this.rmWhiteSpace();
        }

        if (typesInTuple.length > 0) {
            //the last field should be followed by a right parenthesis
//            this.curParamIndex = typesInTuple.length - 1;
            this.paramStartIndex = this.posInArr;

            switch (typesInTuple[i]) {
                case RegHelper.INT_TYPE:
                    tupleData[i] = this.getIntFromBuf(rpa);
                    break;

                case RegHelper.FLOAT_TYPE:
                    tupleData[i] = this.getFloatingNumFromBuf(rpa);
                    break;

                case RegHelper.STRING_TYPE:
                    tupleData[i] = this.getStringFromBuf(rpa);
                    break;
            }
        }


        LogReader.MonitorMethodsInvoker.invoke(EventName, tupleData, this.violationsInCurLogEntry);
        // the customized method invoker will call the method as well as update the violation list


//        this.EventNameMethodMap.get(EventName).invoke(null, tupleData);
//


//        InsertRuntimeMonitor.insertEvent((String) tupleData[0], (String) tupleData[1], (String) tupleData[2], (String) tupleData[3]);


//        this.printEvent(tupleData);

//        if (EventName.equals(SigExtractor.INSERT)) {
//            if (tupleData[1].equals("MYDB") && !tupleData[0].equals("notARealUserInTheDB"))
//                this.printEvent(tupleData);
//        }

//        if (EventName.equals(SigExtractor.INSERT)) {
//            if (tupleData[1].equals("db2") && !tupleData[0].equals("script1")) {
//                this.violationsInCurLogEntry.add(tupleData);
//            }
//        }


//        if (EventName.equals(SigExtractor.SCRIPT_MD5)) {
//            //script_md5 (MY_Script,myMD5)
//            if (tupleData[0].equals("MY_Script") && !tupleData[1].equals("ItsMD5"))
//                this.printEvent(tupleData);
//        }
    }


    public void printEvent(Object[] data) throws IOException {
        StringBuilder sb = new StringBuilder();

        sb.append(" (");
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

        sb.append(")");

        Utils.MyUtils.writeToOutputFileUsingBW(sb.toString());
    }

    private void handleViolationsInLogEntry() throws IOException {
        StringBuilder sb = new StringBuilder("@");
        sb.append(this.TimeStamp);
        sb.append(" (time-point ");
        sb.append(this.numOfLogEntries - 1);
        sb.append("):");

        for (int i = 0; i < this.violationsInCurLogEntry.size(); i++) {
            Object[] data = this.violationsInCurLogEntry.get(i);
            sb.append(" (");
            boolean isFirst = true;

            for (int j = 0; j < data.length; j++) {
                if (!unPrintedFields[j]) {
                    if (isFirst) {
                        isFirst = false;
                        sb.append(data[j]);
                    } else {
                        sb.append("," + data[j]);
                    }
                }
            }

            sb.append(")");
        }
        sb.append(Utils.lineSeparator);
        Utils.MyUtils.writeToOutputFileUsingBW(sb.toString());

        this.violationsInCurLogEntry.clear();
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

class EventSigExtractor {
    public static final String SELECT = "select";
    public static final String INSERT = "insert";
    public static final String UPDATE = "update";
    public static final String DELETE = "delete";
    public static final String SCRIPT_START = "script_start";
    public static final String SCRIPT_END = "script_end";
    public static final String SCRIPT_SVN = "script_svn";
    public static final String SCRIPT_MD5 = "script_md5";
    public static final String COMMIT = "commit";

    public static final String PUBLISH = "publish";
    public static final String APPROVE = "approve";

    public static final int maxNumOfParams = 5;

    public static List<String> monitoredEventList = init();
    public static HashMap<String, boolean[]> skippedFieldsMap = init2();
    public static String monitorName;
    private static HashMap<String, int[]> TableCol = initTableCol();

    private static HashMap<String, int[]> initTableCol() {
        HashMap<String, int[]> tmp = new HashMap<>();
        //the arg types can be inferred from the signature file
        int[] argTy4Insert = new int[]{RegHelper.STRING_TYPE, RegHelper.STRING_TYPE,
                RegHelper.STRING_TYPE, RegHelper.STRING_TYPE};
        int[] argTy4Script = new int[]{RegHelper.STRING_TYPE};
        int[] argTy4ScriptSVN = new int[]{RegHelper.STRING_TYPE, RegHelper.STRING_TYPE,
                RegHelper.STRING_TYPE, RegHelper.INT_TYPE, RegHelper.INT_TYPE};
        int[] argTy4ScriptMD5 = new int[]{RegHelper.STRING_TYPE, RegHelper.STRING_TYPE};
        int[] argTy4Commit = new int[]{RegHelper.STRING_TYPE, RegHelper.INT_TYPE};

        int[] argTy4Pub = new int[]{RegHelper.INT_TYPE};

        tmp.put(SELECT, argTy4Insert);
        tmp.put(INSERT, argTy4Insert);
        tmp.put(UPDATE, argTy4Insert);
        tmp.put(DELETE, argTy4Insert);
        tmp.put(SCRIPT_START, argTy4Script);
        tmp.put(SCRIPT_END, argTy4Script);
        tmp.put(SCRIPT_SVN, argTy4ScriptSVN);
        tmp.put(SCRIPT_MD5, argTy4ScriptMD5);
        tmp.put(COMMIT, argTy4Commit);

        tmp.put(APPROVE, argTy4Pub);
        tmp.put(PUBLISH, argTy4Pub);
        return tmp;
    }

    public static HashMap<String, int[]> extractMethoArgsMappingFromSigFile(File f) {
        //fake method at the moment, needs to be implemented.
        return TableCol;
    }

    private static HashMap<String, boolean[]> init2() {
        HashMap<String, boolean[]> tmp = new HashMap<>();
        boolean[] skipList = new boolean[maxNumOfParams];
        skipList[1] = true;
        tmp.put(INSERT, skipList);
//        tmp.put(SigExtractor.APPROVE, skipList);
//        tmp.put(SigExtractor.PUBLISH, skipList);
        return tmp;
    }

    private static List<String> init() {
        List<String> tmp = new ArrayList<>();
        //needs real impl. it is fake method here
        monitorName = "rvm.InsertRuntimeMonitor";
//        monitorName = "rvm.PubRuntimeMonitor";

        tmp = new ArrayList<>();

        tmp.add(INSERT);
//        tmp.add(SigExtractor.SCRIPT_SVN);
//        tmp.add(SigExtractor.COMMIT);
//        tmp.add(SigExtractor.SCRIPT_MD5);
//        tmp.add(SigExtractor.APPROVE);
//        tmp.add(SigExtractor.PUBLISH);
        return tmp;
    }


    public static String getMonitorName() {
        return monitorName;
    }

    public static List<String> getMonitoredEventList() {
        return monitoredEventList;
    }

    public static boolean isMonitoredEvent(String eventName) {
        return monitoredEventList.contains(eventName);
    }
}

class Utils {
    public static final String lineSeparator = System.getProperty("line.separator");
    public static Utils MyUtils = new Utils();
    //    private Charset charset = StandardCharsets.ISO_8859_1;
    private Charset charset = StandardCharsets.US_ASCII;
    private BufferedWriter bufferedWriter;

    private Utils() {
        this.bufferedWriter = init();
    }


    public static void writeToFile(String contents, String fileName) {
        Path p = Paths.get(fileName);
        byte[] bytes = contents.getBytes();
        try {
            Files.write(p, bytes, StandardOpenOption.TRUNCATE_EXISTING, StandardOpenOption.WRITE);
        } catch (IOException e) {
            try {
                p.getParent().toFile().mkdirs();

                Files.write(p, bytes, StandardOpenOption.CREATE_NEW);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }

    public void writeToOutputFileUsingBW(String contents) throws IOException {
        this.bufferedWriter.write(contents);
    }

    public void flushOutput() throws IOException {
        this.bufferedWriter.flush();
    }

    private BufferedWriter init() {
        try {
            return newBufferedWriter(LogReader.outputPath, charset, StandardOpenOption.APPEND, StandardOpenOption.WRITE);
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(2);
        }
        return null;
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
