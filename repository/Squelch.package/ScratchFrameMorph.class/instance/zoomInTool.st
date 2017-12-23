tools (no longer used)
zoomInTool

	| hand cursorForm offset |
	self paintingInProgress ifTrue: [^ self beep].
	hand := self world activeHand.
	hand toolType: 'ZoomInTool'.

	cursorForm := ScratchFrameMorph skinAt: #zoomInCursor.
	offset := 8@8.

	ScratchFrameMorph isXO ifTrue: [
		cursorForm := cursorForm magnifyBy: 1.5.
		offset := (offset * 1.5) rounded].

	hand showTemporaryCursor: cursorForm hotSpotOffset: offset.
