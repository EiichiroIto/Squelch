evaluation
coerceArgs: argList
	"Answer an arugments array in which all arguments that should be numbers have been coerced to numbers if necessary."

	| args specialCommands numFlags |
	args := argList asArray.
	specialCommands := #(
		append:toList: deleteLine:ofList: getLine:ofList: insert:at:ofList: list:contains: setLine:ofList:to:
		lookLike: showBackground:
		playSound: doPlaySoundAndWait
		setVar:to:).

	(specialCommands includes: selector) ifFalse: [
		"ensure args are numbers where numbers are expected"
		numFlags := self numberArgFlags.
		1 to: args size do: [:i |
			(numFlags at: i) ifTrue: [args at: i put: (args at: i) asNumberNoError]]].

	^ args
