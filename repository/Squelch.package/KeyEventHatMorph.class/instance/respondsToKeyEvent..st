other
respondsToKeyEvent: aMorphicKeyEvent

	| evtAscii |
	evtAscii := aMorphicKeyEvent keyCharacter asLowercase asciiValue.
	evtAscii = Character enter asciiValue ifTrue: [
		evtAscii := Character cr asciiValue].

	^ evtAscii = (ScriptableScratchMorph new asciiFor: scriptNameMorph choice asString)
