motion ops
changeXposBy: aNumber
	"Move right by the given amount."

	self referencePosition: self referencePosition + (aNumber@0).
