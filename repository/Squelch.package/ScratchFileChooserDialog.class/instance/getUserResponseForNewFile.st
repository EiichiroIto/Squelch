interaction
getUserResponseForNewFile
	"Wait for the user to respond, then answer the full path name of the new file or #cancelled if the user cancels the operation."
	"Details: This is invoked synchronously from the caller. In order to keep processing inputs and updating the screen while waiting for the user to respond, this method has its own version of the World's event loop."

	| w fn |
	self openInWorld.
	w := self world.
	w activeHand newKeyboardFocus: (tabFields at: 1).
	self extent: self extent.  "force layout"
	self position: w center - (self extent // 2) + (0@5).  "center on screen but disregard the shadow on the bottom"
	newFileName ifNotNil: [w activeHand newKeyboardFocus: newFileName].
	list getDirectoryContents.

	[true] whileTrue: [
		done := false.
		[done] whileFalse: [w doOneCycle].

		response = #cancelled ifTrue: [^ #cancelled].

		thumbnailMorph ifNotNil: [  "save info in project"
			scratchFrame author: authorMorph contents trimBoth.
			scratchFrame projectComment: commentMorph contents].

		fn := newFileName contents trimBoth.
		fn size > 0 ifTrue: [
			fn := fn collect: [:ch | ('\/:' includes: ch) ifTrue: [$-] ifFalse: [ch]].  "replace directory delimiters with dashes"
			^ (list currentDirectory / fn) pathString].

		newFileTitle color: Color red.
		self openInWorld.
		w activeHand newKeyboardFocus: newFileName].
