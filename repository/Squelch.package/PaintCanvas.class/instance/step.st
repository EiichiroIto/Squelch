stepping
step

	| h screenP canvasP |
	h := World activeHand.
	screenP := Sensor cursorPoint.
	canvasP := self screenToCanvas: screenP.

	moveOrStampForm ifNotNil: [
		((palette mode = #stamp) or:
		 [(palette mode = #move) and: [h hasMouseFocus: self]]) ifTrue: [
			selectionRect ifNotNil: [self canvasChanged: selectionRect].
			selectionRect := canvasP - dragOffset extent: moveOrStampForm extent.
			self canvasChanged: (selectionRect expandBy: 1)]].	"force redraw to show move/stamp feedback"

	(bounds containsPoint: screenP) ifFalse: [^ self].

	palette mode = #move ifTrue: [
		selectionRect ifNil: [h showTemporaryCursor: Cursor crossHair].
		(selectionRect notNil and: [Sensor peekAnyButtonPressed not]) ifTrue: [
			(selectionRect containsPoint: canvasP)
				ifTrue: [h showTemporaryCursor: Cursor handOpen]
				ifFalse: [h showTemporaryCursor: Cursor crossHair]]].

	palette mode = #text ifTrue: [
		(self textHandleContainsPoint: canvasP)
			ifTrue: [h showTemporaryCursor: Cursor handOpen]
			ifFalse: [h showTemporaryCursor: Cursor normal]].
