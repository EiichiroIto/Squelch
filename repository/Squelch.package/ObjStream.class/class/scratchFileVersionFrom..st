testing
scratchFileVersionFrom: aString
	"Answer the Scratch file version number from the given string. If the string is of the form: 'ScratchVxx', were xx is a two-digit integer, answer the value of xx. Otherwise, answer 0."
	"self scratchFileVersionFrom: 'ScratchV01'"

	(aString beginsWith: 'ScratchV') ifFalse: [^ 0].
	^ (aString copyFrom: 9 to: aString size) asNumberNoError
