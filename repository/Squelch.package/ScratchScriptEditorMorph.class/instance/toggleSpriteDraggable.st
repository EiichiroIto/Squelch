menu/button ops
toggleSpriteDraggable
	"Add buttons to set the rotation style."

	self target draggable: self target draggable not.
	self updateLockButton.
