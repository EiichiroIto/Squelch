motor ops
motorOff: motorName
	"Turn the given motor off."

	'A' = motorName ifTrue: [WeDoPlugin motorAOn: false].
	'B' = motorName ifTrue: [WeDoPlugin motorBOn: false].
	' ' = motorName ifTrue: [
		WeDoPlugin motorAOn: false.
		WeDoPlugin motorBOn: false].
