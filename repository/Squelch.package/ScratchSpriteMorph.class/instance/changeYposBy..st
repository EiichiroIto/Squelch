motion ops
changeYposBy: aNumber
	"Move up by the given amount."

	self referencePosition: self referencePosition + (0@aNumber).
