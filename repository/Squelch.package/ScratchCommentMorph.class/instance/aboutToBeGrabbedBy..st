dropping/grabbing
aboutToBeGrabbedBy: aHand
	"The receiver is being grabbed by a hand. Perform necessary adjustments (if any) and return the morph that should be added to the hand. This default implementation just returns the reciver."

	self detach.
	^ self
