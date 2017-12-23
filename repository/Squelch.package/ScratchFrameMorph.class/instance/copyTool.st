tools (no longer used)
copyTool

	| hand cursorForm offset |
	self paintingInProgress ifTrue: [^ self beep].
	hand := self world activeHand.
	hand toolType: 'CopyTool'.

	cursorForm := ScratchFrameMorph skinAt: #copyCursor.
	offset := 8@13.

	ScratchFrameMorph isXO ifTrue: [
		cursorForm := cursorForm magnifyBy: 1.5.
		offset := (offset * 1.5) rounded].

	hand showTemporaryCursor: cursorForm hotSpotOffset: offset.
