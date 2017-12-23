interaction
getUserResponse
	"Wait for the user to type in and accept a string, then report that string. Answer the empty string if the user cancels the operation."
	"Details: This is invoked synchronously from the caller. In order to keep processing inputs and updating the screen while waiting for the user to respond, this method has its own version of the World's event loop."

	| w |
	self openInWorld.
	self centerOnScreen.

	w := self world.
	w activeHand newKeyboardFocus: typeinMorph.
	done := false.
	[done] whileFalse: [w doOneCycle].  "wait for user to press a button"

	self delete.
	w doOneCycle.  "erase myself from the screen"
	response = #cancelled
		ifTrue: [^ '']
		ifFalse: [^ typeinMorph contents asString].
