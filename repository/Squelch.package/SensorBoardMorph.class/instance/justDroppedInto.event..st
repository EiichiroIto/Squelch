dropping/grabbing
justDroppedInto: newOwner event: evt
	"Only allow embedding into the stage; otherwise, float (i.e. be a submorph of the world)."

	(newOwner isKindOf: ScratchStageMorph) ifFalse: [ "only embed in the work pane"
		self world addMorph: self].

