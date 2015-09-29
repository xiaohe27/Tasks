package net.sourceforge.earticleast.app;

import org.eclipse.jdt.core.ICompilationUnit;
import org.eclipse.jface.action.IAction;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.ui.IObjectActionDelegate;
import org.eclipse.ui.IWorkbenchPart;

/**
 * The action delegate for both actions "Change Method Visability" and "Move
 * Method Declaration".
 * <p>
 * Project page: <a target="_blank"
 * href="http://sourceforge.net/projects/earticleast">http://sourceforge.net/projects/earticleast</a>
 * </p>
 *
 * @author Thomas Kuhn
 *
 */
public class ASTArticleActionDelegate implements IObjectActionDelegate {

	private ISelection selection;

	/*
	 * (non-Javadoc)
	 *
	 * @see org.eclipse.ui.IObjectActionDelegate#setActivePart(org.eclipse.jface.action.IAction,
	 *      org.eclipse.ui.IWorkbenchPart)
	 */
	public void setActivePart(IAction action, IWorkbenchPart targetPart) {
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see org.eclipse.ui.IActionDelegate#run(org.eclipse.jface.action.IAction)
	 */
	public void run(IAction action) {
		if (selection instanceof IStructuredSelection) {
			ICompilationUnit lwUnit = (ICompilationUnit) ((IStructuredSelection) selection)
					.getFirstElement();
			createActionExuecutable(action.getId()).run(lwUnit);
		}

	}

	/**
	 * Creates the appropriate implementation of {@link AbstractASTArticle}.
	 *
	 * @param id
	 *            the action ID
	 * @return if {@code id} is
	 *         {@code net.sourceforge.earticleast.app.astArticleAction1} an
	 *         instance of {@link ASTArticleMoveVariableDeclaration}, if
	 *         {@code id} is
	 *         {@code net.sourceforge.earticleast.app.astArticleAction2}: an
	 *         instance of {@link ASTArticleChangeMethodVisibility}
	 */
	private AbstractASTArticle createActionExuecutable(String id) {
		if ("net.sourceforge.earticleast.app.astArticleAction1".equals(id)) {
			return new ASTArticleMoveVariableDeclaration();
		} else {
			throw new IllegalArgumentException(id);
		}
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see org.eclipse.ui.IActionDelegate#selectionChanged(org.eclipse.jface.action.IAction,
	 *      org.eclipse.jface.viewers.ISelection)
	 */
	public void selectionChanged(IAction action, ISelection selection) {
		this.selection = selection;
	}
}
