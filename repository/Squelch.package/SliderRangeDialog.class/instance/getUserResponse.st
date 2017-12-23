interaction
getUserResponse
	"Wait for the user to fill in the max and min fields, then report an array containing them. Answer nil if the user cancels the operation."
	"Details: This is invoked synchronously from the caller. In order to keep processing inputs and updating the screen while waiting for the user to respond, this method has its own version of the World's event loop."

	| w n m |
	self openInWorld.
	self centerOnScreen.

	w := self world.
	w activeHand newKeyboardFocus: minMorph.
	done := false.
	[done] whileFalse: [w doOneCycle].  "wait for user to press a button"

	self delete.
	w doOneCycle.  "erase myself from the screen"
	response = #cancelled ifTrue: [^ nil].
	
	n := minMorph contents asNumberNoError.
	m := maxMorph contents asNumberNoError.
	^ Array with: (n min: m) with: (n max: m)
