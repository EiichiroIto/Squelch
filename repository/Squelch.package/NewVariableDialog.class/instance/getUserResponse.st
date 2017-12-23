interaction
getUserResponse

	| newVarName |
	newVarName := super getUserResponse.
	newVarName size = 0 ifTrue: [^ #cancelled].
	^ Array with: newVarName with: spriteSpecificFlag
