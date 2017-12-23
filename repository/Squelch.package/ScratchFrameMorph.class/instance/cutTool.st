tools (no longer used)
cutTool

	| hand cursorForm offset |
	self paintingInProgress ifTrue: [^ self beep].
	hand := self world activeHand.
	hand toolType: 'CutTool'.

	cursorForm := ScratchFrameMorph skinAt: #cutCursor.
	offset := 8@8.

	ScratchFrameMorph isXO ifTrue: [
		cursorForm := cursorForm magnifyBy: 1.5.
		offset := (offset * 1.5) rounded].

	hand showTemporaryCursor: cursorForm hotSpotOffset: offset.
