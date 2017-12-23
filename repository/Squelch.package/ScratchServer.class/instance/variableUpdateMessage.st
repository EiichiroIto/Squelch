private-variables
variableUpdateMessage
	"Answer a variable update message for all variables whose values have not already been sent."

	| msg currentValue lastValue v |
	msg := WriteStream on: String new.
	msg nextPutAll: 'sensor-update '.
	stage varNames do: [:varName |
		currentValue := stage getVar: varName.
		lastValue := lastSentValues at: varName ifAbsent: [nil].
		lastValue = currentValue ifFalse: [
			self putString: varName on: msg.
			msg space.
			v := stage interpretStringAsNumberIfPossible: currentValue.
			v isNumber
				ifTrue: [msg nextPutAll: v printString]
				ifFalse: [self putString: v asString on: msg].
			msg space]].

	^ msg contents
