accessing
stopMotors

	| motorName |
	(expression isKindOf: CommandBlockMorph) ifTrue: [
		#motorOnFor:elapsed:from: = expression selector ifTrue: [
			motorName := startValue.
			expression receiver motorOff: motorName]].
