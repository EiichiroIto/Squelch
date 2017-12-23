dropping/grabbing
justDroppedInto: aMorph event: evt
	"Never embed myself in a morph (e.g. the Stage)."

	self world addMorphFront: self.
