event handling
stampAt: aPoint
	"Perform a stamp operation at the given point. If there is no stamp form, grab one from the screen. Otherwise, stamp it at the given point in canvas coordinates."

	| canvasR |
	moveOrStampForm ifNil: [  "no stamp form yet; grab one"
		canvasR := self selectRectangleStartingAt: aPoint.
		canvasR ifNil: [^ self].
		selectionRect := nil.
		moveOrStampForm := canvasForm copy: canvasR.
		moveOrStampForm ifNil: [^ self].  "empty selection rectangle"
		dragOffset := moveOrStampForm extent // 2.
		self installCursorInHand: World activeHand. "update cursor"
		^ self].

	"stamp the stamp form"
	moveOrStampForm
		displayOn: canvasForm
		at: (aPoint - (moveOrStampForm extent // 2))
		rule: Form paint.
	canvasR := (aPoint - (moveOrStampForm extent // 2)) extent: moveOrStampForm extent.
	self canvasChanged: canvasR.
