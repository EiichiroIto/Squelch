interaction
getUserResponse
	"Wait for the user to respond, then report their response. The symbol #cancel is returned if the user wishes to cancel the operation. True/false is returned if they respond yes/no, and a string is returned if this this a string input dialog and they don't cancel."
	"Details: This is invoked synchronously from the caller. In order to keep processing inputs and updating the screen while waiting for the user to respond, this method has its own version of the World's event loop."

	| w |
	self openInWorld.
	self centerOnScreen.
	w := self world.
	self buttons size > 0 ifTrue: [
		w activeHand newKeyboardFocus: self buttons last].
	tabFields size > 0 ifTrue: [
		w activeHand newKeyboardFocus: (tabFields at: 1)].
	done := false.
	[done] whileFalse: [w doOneCycle].  "wait for user to press a button"

	^ response
