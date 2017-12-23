motor ops
motorOn: motorName
	"Turn the given motor on."

	'A' = motorName ifTrue: [WeDoPlugin motorAOn: true].
	'B' = motorName ifTrue: [WeDoPlugin motorBOn: true].
	' ' = motorName ifTrue: [
		WeDoPlugin motorAOn: true.
		WeDoPlugin motorBOn: true].
