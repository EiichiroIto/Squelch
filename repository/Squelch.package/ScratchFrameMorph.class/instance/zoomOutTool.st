tools (no longer used)
zoomOutTool

	| hand cursorForm offset |
	self paintingInProgress ifTrue: [^ self beep].
	hand := self world activeHand.
	hand toolType: 'ZoomOutTool'.

	cursorForm := ScratchFrameMorph skinAt: #zoomOutCursor.
	offset := 8@8.

	ScratchFrameMorph isXO ifTrue: [
		cursorForm := cursorForm magnifyBy: 1.5.
		offset := (offset * 1.5) rounded].

	hand showTemporaryCursor: cursorForm hotSpotOffset: offset.

