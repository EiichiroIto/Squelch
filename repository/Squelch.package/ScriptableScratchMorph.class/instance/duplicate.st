scripts
duplicate

	| newSprite s |
	newSprite := self duplicateNoAttach.
	self world activeHand attachMorph: newSprite.

	((s := self meOrOwnerThatIsA: ScratchStageMorph) notNil and:
	 [s isQuarterSize]) ifTrue: [
		self world activeHand drawHalfSize: true].

	^ newSprite
