package net.sourceforge.earticleast.app;

import org.eclipse.core.runtime.CoreException;
import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.Block;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.VariableDeclarationFragment;
import org.eclipse.jdt.core.dom.VariableDeclarationStatement;
import org.eclipse.jdt.core.dom.rewrite.ASTRewrite;
import org.eclipse.jdt.core.dom.rewrite.ListRewrite;

/**
 * Records changes to an AST using {@link ASTRewrite}.
 * <p>
 * Project page: <a target="_blank"
 * href="http://sourceforge.net/projects/earticleast">http://sourceforge.net/projects/earticleast</a>
 * </p>
 *
 * @author Thomas Kuhn
 *
 */
public class ASTRewriteBasedManipulator extends AbstractManipulator {
	private ASTRewrite rewrite;

	/*
	 * (non-Javadoc)
	 *
	 * @see net.sourceforge.earticleast.app.AbstractManipulator#beforeManipulate(org.eclipse.jdt.core.dom.CompilationUnit)
	 */
	@Override
	protected void beforeManipulate(CompilationUnit unit) {
		super.beforeManipulate(unit);
		// create the rewrite instance for "unit"
		rewrite = ASTRewrite.create(unit.getAST());
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see net.sourceforge.earticleast.app.AbstractManipulator#addNewVariableDeclaration(net.sourceforge.earticleast.app.VariableBindingManager)
	 */
	@Override
	protected void addNewVariableDeclaration(VariableBindingManager manager) {
		VariableDeclarationFragment fragment = manager
				.getVariableDeclarationFragment();
		VariableDeclarationStatement statement = (VariableDeclarationStatement) fragment
				.getParent();
		// add a remove command to the protocol
		rewrite.remove(fragment, null);
		ListRewrite fragmentsListRewrite = rewrite.getListRewrite(statement,
				VariableDeclarationStatement.FRAGMENTS_PROPERTY);
		if (fragmentsListRewrite.getRewrittenList().size() == 0) {
			// add a remove command to the protocol
			rewrite.remove(statement, null);
		}
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see net.sourceforge.earticleast.app.AbstractManipulator#deleteOldVariableDeclaration(net.sourceforge.earticleast.app.VariableBindingManager)
	 */
	@Override
	protected void deleteOldVariableDeclaration(VariableBindingManager manager) {
		AST ast = manager.getFirstReference().getAST();
		VariableDeclarationStatement statement = createNewVariableDeclarationStatement(
				manager, ast);
		int firstReferenceIndex = getFirstReferenceListIndex(manager);
		Block block = Helper.getParentBlock(manager.getFirstReference());
		// get the list rewriter for the statments list
		ListRewrite statementsListRewrite = rewrite.getListRewrite(block,
				Block.STATEMENTS_PROPERTY);
		// add insert-at command to the protocol
		statementsListRewrite.insertAt(statement, firstReferenceIndex, null);
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see net.sourceforge.earticleast.app.AbstractManipulator#afterManipulate(org.eclipse.jdt.core.dom.CompilationUnit)
	 */
	@Override
	protected void afterManipulate(CompilationUnit unit) {
		super.afterManipulate(unit);
		try {
			// write changes back to Java source code
			ManipulatorHelper.saveASTRewriteContents(unit, rewrite);
		} catch (CoreException e) {
			e.printStackTrace();
		}
	}
}
