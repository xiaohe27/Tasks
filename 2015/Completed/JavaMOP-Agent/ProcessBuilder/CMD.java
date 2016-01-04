import org.apache.commons.io.IOUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.List;

public class CMD{
    /**
     * Run a command in a directory. Passes the output of the run commands through if the program
     * is in verbose mode. Blocks until the command finishes, then gives the return code.
     *
     * @param dir  The directory to run the command in.
     * @param verbose whether in verbose mode or not
     * @param args The program to run and its arguments.
     * @return The return code of the program.
     */
    private static int runCommandDir(final File dir, boolean verbose, final String... args) throws IOException {
        try {
            if (verbose) { // -v
                System.out.println(dir.toString() + ": " + Arrays.asList(args).toString());
            }
            final ProcessBuilder builder = new ProcessBuilder();
            builder.command(args).directory(dir);
            if (verbose) { // -v
                builder.inheritIO();
            } else {
                builder.redirectErrorStream(true);
            }
            final Process proc = builder.start();

            // If the output stream does not get consumed, when the buffer of the subprocess
            // is full it will get blocked. This fixed issue #37:
            // https://github.com/runtimeverification/javamop/issues/37
            if (!verbose) {
                // Consume output/error stream
                final StringWriter writer = new StringWriter();
                new Thread(new Runnable() {
                    public void run() {
                        try {
                            IOUtils.copy(proc.getInputStream(), writer);
                        } catch (IOException e) {
                            System.err.println("Exception in reading subprocess output: "
                                    + e.getMessage());
                        }
                    }
                }).start();
            }

            return proc.waitFor();
        } catch (InterruptedException ie) {
            ie.printStackTrace();
            return -1;
        }
    }

 public static void main(String[] args) throws IOException {
	File outputDir=new File
("/home/xiaohe/Projects/javamop/target/release/javamop/javamop/examples/agent/HasNext/rvm/agentOption");

	final String ajOutDir = outputDir.getAbsolutePath();
        final String baseClasspath = System.getProperty("java.class.path") + File.pathSeparator + ".";
	
	boolean verbose=false;
	String aspectname="HasNext";

	final int ajcReturn = runCommandDir(outputDir, verbose, "java", "-cp", baseClasspath,
                "org.aspectj.tools.ajc.Main", "-1.6", "-d", ajOutDir, "-outxml",
                aspectname + "MonitorAspect.aj");
	
	System.out.println("Return code: "+ajcReturn);
	
}
}
