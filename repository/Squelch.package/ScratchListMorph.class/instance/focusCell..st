accessing
focusCell: cellMorph

	focusIndex := cellMorphs indexOf: cellMorph ifAbsent: [1].
	World activeHand newKeyboardFocus: cellMorph firstSubmorph.
