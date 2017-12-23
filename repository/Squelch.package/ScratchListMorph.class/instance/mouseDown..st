event handling
mouseDown: evt
	"Handle a mouse click. Left button either drags or performs click action. Right button brings up a menu."

	| p |
	resizeOffset := nil.
	evt hand toolType = 'CutTool' ifTrue: [
		evt shiftPressed ifFalse: [evt hand toolType: nil].
		^ self delete].

	World activeHand showTemporaryCursor: nil.
	evt hand newKeyboardFocus: nil.
	p := evt cursorPoint.

	((addItemMorph bounds expandBy: 4) containsPoint: p) ifTrue: [
		^ self insertLine: '' at: (self lineCount + 1)].

	evt yellowButtonPressed
		ifTrue: [Sensor waitNoButton. ^ self rightButtonMenu]
		ifFalse:	[
			((resizeMorph bounds expandBy: 4) containsPoint: p)
				ifFalse: [evt hand grabMorph: self]
				ifTrue: [resizeOffset := self bottomRight - p]].
