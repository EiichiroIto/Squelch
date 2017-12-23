initialization
getUserResponse
	"Wait for the user to respond, then answer the full path name of the chosen file or #cancelled if the user cancels the operation. If opening a remote file for reading, answer a HTTPFetcher on the remote file."
	"Details: This is invoked synchronously from the caller. In order to keep processing inputs and updating the screen while waiting for the user to respond, this method has its own version of the World's event loop."

	| w |
	self openInWorld.
	w := self world.
	w activeHand newKeyboardFocus: (tabFields at: 1).
	self centerOnScreen.
	newFileName ifNotNil: [w activeHand newKeyboardFocus: newFileName].
	list getDirectoryContents.

	response := #cancelled.  "default response"
	done := false.
	[done or: [list isFinalSelection]] whileFalse: [w doOneCycle].
	self delete.
	w doOneCycle.  "erase myself from the screen"

	((response = #cancelled) and: [list isFinalSelection not]) ifTrue: [^ #cancelled].
	list selectedFile ifNil: [^ #cancelled].

	(thumbnailMorph notNil & readingScratchFile not) ifTrue: [  "save info in project"
		scratchFrame author: authorMorph contents trimBoth.
		scratchFrame projectComment: commentMorph contents].

	(list currentDirectory isKindOf: ScratchServerDirectory)
		ifTrue: [^ list projectFetcher]
		ifFalse: [^ (list currentDirectory / list selectedFile) pathString].
