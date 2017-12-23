motor ops
motor: motorName power: power
	"Set the power level of the given motor (0-100)."

	'A' = motorName ifTrue: [WeDoPlugin motorAPower: power].
	'B' = motorName ifTrue: [WeDoPlugin motorBPower: power].
	' ' = motorName ifTrue: [
		WeDoPlugin motorAPower: power.
		WeDoPlugin motorBPower: power].
