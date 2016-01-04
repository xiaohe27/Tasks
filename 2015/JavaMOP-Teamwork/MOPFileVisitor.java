package javamop.util;

import java.nio.file.FileVisitResult;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;

import static java.nio.file.FileVisitResult.CONTINUE;

/**
 * Created by hx312 on 25/04/2015.
 */
public class MOPFileVisitor extends SimpleFileVisitor<Path> {
    private ArrayList<String> listOfMOPFilePaths;

    public MOPFileVisitor() {
        this.listOfMOPFilePaths = new ArrayList<>();
    }

    @Override
    public FileVisitResult visitFile(Path file,
                                     BasicFileAttributes attrs) {
        String fileName = String.valueOf(file.getFileName());
        if (fileName.endsWith(".mop")) {
            this.listOfMOPFilePaths.add(fileName);
        }
        return CONTINUE;
    }
}
