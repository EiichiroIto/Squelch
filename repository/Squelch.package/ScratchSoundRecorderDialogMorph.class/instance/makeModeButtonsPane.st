initialization
makeModeButtonsPane

	| button tempBin |

	modeButtonsPane := AlignmentMorph newRow vResizing: #shrinkWrap.
	modeButtonsPane color: Color transparent.
	#(play stop record) do: [:n |
		button := (self buttonType: n asString capitalized action: n).
		button setProperty: #balloonText toValue: n asString localized.
		modeButtonsPane addMorphBack: button].

	tempBin := AlignmentMorph newRow
		color: Color transparent;
		wrapCentering: #center.
	tempBin
		addMorphBack: modeButtonsPane;
		addMorphBack: buttonRow.
	mainColumn addMorphBack: tempBin.
	bottomSpacer delete.
	bottomSpacer := nil.
