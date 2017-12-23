initialization
initSetterForVar: varName

	self commandSpec: (ScratchTranslator translationFor: 'set %v to %n').
	argPermutation := CommandBlockMorph argPermutationForSpec: 'set %v to %n' withTranslation: commandSpec.
	self selector: #setVar:to:.
	self variable: varName.
