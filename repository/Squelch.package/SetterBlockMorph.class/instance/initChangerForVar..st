initialization
initChangerForVar: varName

	self commandSpec: (ScratchTranslator translationFor: 'change %v by %n').
	argPermutation := CommandBlockMorph argPermutationForSpec: 'set %v to %n' withTranslation: commandSpec.
	self selector: #changeVar:by:.
	self variable: varName.
