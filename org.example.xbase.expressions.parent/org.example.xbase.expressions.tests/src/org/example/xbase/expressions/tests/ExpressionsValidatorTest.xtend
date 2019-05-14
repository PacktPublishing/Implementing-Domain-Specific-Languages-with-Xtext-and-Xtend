/*
 * generated by Xtext 2.10.0
 */
package org.example.xbase.expressions.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.eclipse.xtext.xbase.XbasePackage
import org.eclipse.xtext.xbase.validation.IssueCodes
import org.example.xbase.expressions.expressions.ExpressionsModel
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(ExpressionsInjectorProvider)
class ExpressionsValidatorTest {

	@Inject extension ParseHelper<ExpressionsModel>
	@Inject extension ValidationTestHelper

	@Test
	def void testValidEvalExpression() {
		'''
			val i = 0;
			eval i;
		'''.parse.assertNoErrors
	}

	@Test
	def void testValidEvalExpressionAsStringReceiver() {
		'''
			val i = 0;
			val s = (eval i).trim;
		'''.parse.assertNoErrors
	}

	@Test
	def void testEvalExpressionWithVoidArgument() {
		'''
			eval println()
		'''.parse.assertError(
			XbasePackage.eINSTANCE.XFeatureCall, // error on println()
			IssueCodes.INCOMPATIBLE_TYPES,
			"Type mismatch: type void is not applicable at this location"
		)
	}

	@Test
	def void testInvalidExpressionWithNoSideEffect() {
		'''
			val i = 0;
			i;
		'''.parse.assertError(
			XbasePackage.eINSTANCE.XFeatureCall,
			IssueCodes.INVALID_INNER_EXPRESSION,
			"This expression is not allowed in this context, since it doesn't cause any side effects."
		)
	}

}