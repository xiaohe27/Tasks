package ASTParser;
 
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
 
import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTParser;
import org.eclipse.jdt.core.dom.ASTVisitor;
import org.eclipse.jdt.core.dom.BlockComment;
import org.eclipse.jdt.core.dom.Comment;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.LineComment;
 
public class ParseJavaFile {
 
	public static void main(String[] args) throws IOException {
		String str = "/workspace/UltimateTest/src/ASTParser/a.java";
		String converted = readFileToString(str);
		parse(converted);
	}
 
	// use ASTParse to parse string
	public static void parse(final String str) {
		ASTParser parser = ASTParser.newParser(AST.JLS3);
		parser.setSource(str.toCharArray());
		parser.setKind(ASTParser.K_COMPILATION_UNIT);
 
		final CompilationUnit cu = (CompilationUnit) parser.createAST(null);
 
		for (Comment comment : (List<Comment>) cu.getCommentList()) {
			comment.accept(new CommentVisitor(cu, str));
		}
	}
 
	// read file content into a string
	public static String readFileToString(String filePath) throws IOException {
		StringBuilder fileData = new StringBuilder(1000);
		BufferedReader reader = new BufferedReader(new FileReader(filePath));
 
		char[] buf = new char[10];
		int numRead = 0;
		while ((numRead = reader.read(buf)) != -1) {
			String readData = String.valueOf(buf, 0, numRead);
			fileData.append(readData);
			buf = new char[1024];
		}
 
		reader.close();
		return fileData.toString();
	}
 
}
 
//comment visitor
class CommentVisitor extends ASTVisitor {
	CompilationUnit cu;
	String source;
 
	public CommentVisitor(CompilationUnit cu, String source) {
		super();
		this.cu = cu;
		this.source = source;
	}
 
	public boolean visit(LineComment node) {
		int start = node.getStartPosition();
		int end = start + node.getLength();
		String comment = source.substring(start, end);
		System.out.println(comment);
		return true;
	}
 
	public boolean visit(BlockComment node) {
		int start = node.getStartPosition();
		int end = start + node.getLength();
		String comment = source.substring(start, end);
		System.out.println(comment);
		return true;
	}
 
}