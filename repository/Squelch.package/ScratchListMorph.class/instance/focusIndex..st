accessing
focusIndex: anInteger

	| cell |
	focusIndex := anInteger.
	focusIndex > cellMorphs size ifTrue: [focusIndex := 1].
	focusIndex < 1 ifTrue: [focusIndex := cellMorphs size].

	cellMorphs size > 0 ifTrue: [
		cell := cellMorphs at: focusIndex.
		World activeHand newKeyboardFocus: cell firstSubmorph.
		scrollPane scrollSubmorphIntoView: cell].
