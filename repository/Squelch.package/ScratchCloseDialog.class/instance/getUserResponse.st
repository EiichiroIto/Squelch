other
getUserResponse
	| w |
	self openInWorld.
	self centerOnScreen.
	w := self world.
	w activeHand newKeyboardFocus: (buttonRow submorphs at: 7).
	done := false.
	[done] whileFalse: [w doOneCycle].  "wait for user to press a button"

	^ response
