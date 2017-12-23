private
undoableDeleteSprite
	"Delete the sprite and store it in the clipboard in case of an undo."

	ScratchFrameMorph putInClipboard: self.
	self deleteSprite.
