/*
 * generated by Xtext 2.10.0
 */
package org.example.smalljava.ui.outline

import org.eclipse.xtext.ui.editor.outline.impl.DefaultOutlineTreeProvider
import org.eclipse.xtext.ui.editor.outline.impl.DocumentRootNode
import org.example.smalljava.smallJava.SJMethod
import org.example.smalljava.smallJava.SJProgram

/**
 * Customization of the default outline structure.
 * 
 * See https://www.eclipse.org/Xtext/documentation/304_ide_concepts.html#outline
 */
class SmallJavaOutlineTreeProvider extends DefaultOutlineTreeProvider {
	def _isLeaf(SJMethod m) {
		true
	}

	def void _createChildren(DocumentRootNode outlineNode, SJProgram model) {
		model.classes.forEach [ cl |
			createNode(outlineNode, cl);
		]
	}
}
