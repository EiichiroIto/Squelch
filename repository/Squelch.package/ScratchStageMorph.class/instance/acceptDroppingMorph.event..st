dropping/grabbing
acceptDroppingMorph: aMorph event: evt

	self isQuarterSize ifTrue: [
		aMorph center: (2 * aMorph center) - self position.
		self changed].

	self addMorph: aMorph.
	self isInWorld ifTrue: [self world startSteppingSubmorphsOf: aMorph].
	((aMorph respondsTo: #penDown) and: [aMorph penDown])
		ifTrue: [self penUpOrDownChangeFor: aMorph].
	self changed.

