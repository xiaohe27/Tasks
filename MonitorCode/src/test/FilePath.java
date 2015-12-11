package test;

import java.nio.file.Path;

/**
 * Created by hx312 on 12/11/2015.
 */
public class FilePath {
    private Path outputPath;

    public FilePath(Path outputPath) {
        this.outputPath = outputPath;
    }

    public Path getOutputPath() {
        return outputPath;
    }

    public void setOutputPath(Path outputPath) {
        this.outputPath = outputPath;
    }
}
