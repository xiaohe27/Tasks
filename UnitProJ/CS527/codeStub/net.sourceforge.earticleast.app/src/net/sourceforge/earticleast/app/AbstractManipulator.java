package net.sourceforge.earticleast.app;

import java.util.Collection;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTNode;
import org.eclipse.jdt.core.dom.Block;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.Expression;
import org.eclipse.jdt.core.dom.SimpleName;
import org.eclipse.jdt.core.dom.Type;
import org.eclipse.jdt.core.dom.VariableDeclarationFragment;
import org.eclipse.jdt.core.dom.VariableDeclarationStatement;

/**
 * The base class of the two AST manipulators. The implementations are
 * {@link ASTDirectManipulator} and {@link ASTRewriteBasedManipulator}. Both
 * subclasses lead to the same result, using different methods to change an AST.
 * <p>
 * Project page: <a target="_blank"
 * href="http://sourceforge.net/projects/earticleast">http://sourceforge.net/projects/earticleast</a>
 * </p>
 *
 * @author Thomas Kuhn
 *
 */
public abstract class AbstractManipulator {

	/**
	 * The implementing class has to create and add a variable declaration
	 * statement at the position before the first reference of the variable
	 * managed by the variable binding manager.
	 *
	 * @param manager
	 *            the variable binding manager
	 */
	protected abstract void addNewVariableDeclaration(
			VariableBindingManager manager);

	/**
	 * The implementing class has to delete the old, obselete variable
	 * declaration statment. A new statement will be added by
	 * {@link #addNewVariableDeclaration(VariableBindingManager)}.
	 *
	 * @param manager
	 *            the variable binding manager
	 */
	protected abstract void deleteOldVariableDeclaration(
			VariableBindingManager manager);

	/**
	 * Called from {@link #manipulate(CompilationUnit, Collection)} before any
	 * local variable is processed. While without effect in this class,
	 * subclasses may override and for pre-processing instructions.
	 *
	 * @param unit
	 *            the AST node that will be manipulated
	 */
	protected void afterManipulate(CompilationUnit unit) {
	}

	/**
	 * Called from {@link #manipulate(CompilationUnit, Collection)} after all
	 * local variables have been processed. While without effect in this class,
	 * subclasses may override and for post-processing instructions.
	 *
	 * @param unit
	 *            the AST node that has been manipulated
	 */
	protected void beforeManipulate(CompilationUnit unit) {
	}

	/**
	 * Calls for every local variable handled by managers the methods
	 * {@link #deleteOldVariableDeclaration(VariableBindingManager)} and
	 * {@link #addNewVariableDeclaration(VariableBindingManager)}. This "moves"
	 * the variable declaration statement to its intended place.
	 *
	 * @param unit
	 *            the compilation unit that has to be manipulated
	 * @param managers
	 *            all variable binding managers for {@code unit}
	 */
	public void manipulate(final CompilationUnit unit,
			Collection<VariableBindingManager> managers) {
		// pre-processing
		beforeManipulate(unit);

		for (VariableBindingManager manager : managers) {
			if (manager.getFirstReference() == null) {
				// no reference found for variable -> leave definition as is
				continue;
			}
			deleteOldVariableDeclaration(manager);
			addNewVariableDeclaration(manager);
		}

		// post-processing
		afterManipulate(unit);
	}

	/**
	 * Computes the index of the "first variable reference" (retrived from the
	 * variable binding manager) within the statement-list of its parent block.
	 *
	 * @param manager
	 *            the variable binding manager
	 * @return the index position within the statement list
	 */
	protected int getFirstReferenceListIndex(VariableBindingManager manager) {
		Block block = Helper.getParentBlock(manager.getFirstReference());
		return block.statements().indexOf(manager.getFirstReference());
	}

	/**
	 * Creates a new {@link VariableDeclarationStatement}. As initializer
	 * figures a copy of the initializer retrieved from the variable binding
	 * manager. The variable name will be a copy of the variable declaration
	 * fragment name returned by the variable binding manager.
	 *
	 * @param manager
	 *            the variable binding manager
	 * @param ast
	 *            used to create the new statements
	 * @return the created {@link VariableDeclarationStatement}
	 */
	protected VariableDeclarationStatement createNewVariableDeclarationStatement(
			VariableBindingManager manager, AST ast) {
		// create an empty variable declaration fragment
		VariableDeclarationFragment fragment = ast
				.newVariableDeclarationFragment();

		// set the initilizer
		fragment.setInitializer((Expression) ASTNode.copySubtree(ast, manager
				.getInitializer()));

		// set the name
		fragment.setName((SimpleName) ASTNode.copySubtree(ast, manager
				.getVariableDeclarationFragment().getName()));

		// create a statement for the fragment
		VariableDeclarationStatement statement = ast
				.newVariableDeclarationStatement(fragment);

		// set the type of the variable declaration statement
		Type type = ((VariableDeclarationStatement) manager
				.getVariableDeclarationFragment().getParent()).getType();
		statement.setType((Type) ASTNode.copySubtree(ast, type));
		return statement;
	}
}