private
installCursorInHand: h
	"Note: use XO cursors on XO except for paint and erase, which should be a their actual size."

	| mode cursor |
	h showTemporaryCursor: nil.
	palette showRotationCenter ifTrue: [^ self].

	mode := palette mode.
	#eyedropper = mode ifTrue: [h showTemporaryCursor: Cursor eyeDropper].
	#fill = mode ifTrue: [h showTemporaryCursor: Cursor paintBucket].
	(#(line oval rect) includes: mode) ifTrue: [h showTemporaryCursor: Cursor crossHair].

	(#(stamp move) includes: mode) ifTrue: [
		moveOrStampForm
			ifNil: [h showTemporaryCursor: Cursor crossHair]
			ifNotNil: [
				#stamp = mode
					ifTrue: [h showTemporaryCursor: Cursor blank]
					ifFalse: [h showTemporaryCursor: Cursor handOpen]]].

	#erase = mode ifTrue: [
		cursor := self brushCursorSize: palette brushSize color: Color transparent.
		h
			showTemporaryCursor: cursor
			hotSpotOffset: (cursor center truncateTo: scale)].

	#paint = mode ifTrue: [
		cursor := self brushCursorSize: palette brushSize color: palette color1.
		h
			showTemporaryCursor: cursor
			hotSpotOffset: (cursor center truncateTo: scale)].
