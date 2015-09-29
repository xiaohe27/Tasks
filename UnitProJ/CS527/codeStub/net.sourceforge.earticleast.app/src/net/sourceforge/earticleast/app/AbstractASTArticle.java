package net.sourceforge.earticleast.app;

import org.eclipse.jdt.core.ICompilationUnit;
import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTParser;
import org.eclipse.jdt.core.dom.CompilationUnit;

/**
 * The abstract base for the main classes of the two examples described in the
 * article. These are:
 * <ul>
 * <li>Move Variable Declaration: {@link ASTArticleMoveVariableDeclaration}
 * <li>Change Method Visibility: {@link ASTArticleChangeMethodVisibility}
 * </ul>
 * <p>
 * Project page: <a target="_blank"
 * href="http://sourceforge.net/projects/earticleast">http://sourceforge.net/projects/earticleast</a>
 * </p>
 *
 * @author Thomas Kuhn
 *
 */
public abstract class AbstractASTArticle {
	/**
	 * Called from {@link ASTArticleActionDelegate}.
	 *
	 * @param lwUnit
	 *            the Java Model handle to the compilation unit that has to be
	 *            processed
	 */
	public abstract void run(ICompilationUnit lwUnit);

	/**
	 * Parses source code.
	 *
	 * @param lwUnit
	 *            the Java Model handle for the compilation unit
	 * @return the root AST node of the parsed source
	 */
	protected CompilationUnit parse(ICompilationUnit lwUnit) {
		ASTParser parser = ASTParser.newParser(AST.JLS3);
		parser.setKind(ASTParser.K_COMPILATION_UNIT);
		parser.setSource(lwUnit); // set source
		parser.setResolveBindings(true); // we need bindings later on
		return (CompilationUnit) parser.createAST(null /* IProgressMonitor */); // parse
	}

}