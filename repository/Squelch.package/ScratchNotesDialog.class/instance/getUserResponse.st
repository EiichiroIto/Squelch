other
getUserResponse
	"Wait for the user to respond, then answer #ok if the okay button was pressed or #cancelled if the user cancels the operation."
	"Details: This is invoked synchronously from the caller. In order to keep processing inputs and updating the screen while waiting for the user to respond, this method has its own version of the World's event loop."

	| w |
	self openInWorld.
	self centerOnScreen.

	w := self world.
	w activeHand newKeyboardFocus: commentMorph.

	done := false.	
	[done] whileFalse: [w doOneCycle].
	response = #cancelled ifTrue: [^ #cancelled].

	"save notes in project"
	scratchFrame projectComment: commentMorph contents.

	^ #ok
