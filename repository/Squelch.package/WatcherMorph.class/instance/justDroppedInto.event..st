dropping/grabbing
justDroppedInto: aMorph event: evt

	(aMorph isKindOf: ScratchStageMorph) ifTrue: [
		super justDroppedInto: aMorph event: evt.
		self world ifNotNil: [self world startSteppingSubmorphsOf: self].
		^ self].

	"delete me if dropped anywhere but the stage"
	lastPosition ifNil: [lastPosition := evt hand formerPosition].
	self position: lastPosition.
	^ self delete
