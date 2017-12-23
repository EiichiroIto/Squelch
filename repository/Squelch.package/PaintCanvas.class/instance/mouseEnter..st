event handling
mouseEnter: evt

	World activeHand newKeyboardFocus: self.
	self installCursorInHand: evt hand.
	"scale > 1 ifTrue: [
		evt hand
			gridTo: scale truncated
			origin: (self canvasToScreen: 0@0)]."
