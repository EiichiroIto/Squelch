event handling
fixGetAttribueBlock
	"If my owner is a get attribute block, make sure that the attribute is consistent the the type of the target sprite or stage."

	| attributeArg possibleAttributes |
	morph ifNil: [^ self].
	((owner isKindOf: ReporterBlockMorph) and: [owner selector = #getAttribute:of:]) ifFalse: [^ self].

	attributeArg := owner submorphs detect: [:m | m isKindOf: AttributeArgMorph] ifNone: [^ self].

	possibleAttributes := morph attributeNames, morph varNames.
	(possibleAttributes includes: attributeArg choice) ifFalse: [
		 attributeArg choice: possibleAttributes first].
