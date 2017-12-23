interaction
getUserResponseForFolder
	"Wait for the user to respond, then answer the full path name of the chosen directory or #cancelled if the user cancels the operation. To make a FileDirectory from the response string use the method: FileDirectory on: <reponse>."
	"Details: This is invoked synchronously from the caller. In order to keep processing inputs and updating the screen while waiting for the user to respond, this method has its own version of the World's event loop."

	| w |
	self openInWorld.
	w := self world.
	w activeHand newKeyboardFocus: (tabFields at: 1).
	self extent: self extent.  "force layout"
	self position: w center - (self extent // 2) + (0@5).  "center on screen but disregard the shadow on the bottom"
	list getDirectoryContents.

	response := #cancelled.  "default response"
	done := false.
	[done "or: [list model isFinalSelection]"] whileFalse: [w doOneCycle].
	self delete.
	w doOneCycle.  "erase myself from the screen"

	response = #cancelled
		ifTrue: [^ #cancelled]
		ifFalse: [^ list currentDirectory].
