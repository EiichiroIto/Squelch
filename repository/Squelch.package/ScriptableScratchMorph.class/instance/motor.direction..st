motor ops
motor: motorName direction: directionName
	"Set the direction of the given motor."

	| dir |
	dir := 0.
	(directionName includesSubString: 'reverse') ifTrue: [dir := 0].
	(directionName includesSubString: 'this way') ifTrue: [dir := 1].
	(directionName includesSubString: 'that way') ifTrue: [dir := -1].

	'A' = motorName ifTrue: [WeDoPlugin motorADirection: dir].
	'B' = motorName ifTrue: [WeDoPlugin motorBDirection: dir].
	' ' = motorName ifTrue: [
		WeDoPlugin motorADirection: dir.
		WeDoPlugin motorBDirection: dir].
