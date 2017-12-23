right button menu
duplicateNoAttach
	"Duplicate this sprite, but do not attach to the hand."

	| newSprite frame |
	newSprite := self fullCopy.
	newSprite position: (newSprite position + 20).
	frame := self meOrOwnerThatIsA: ScratchFrameMorph.
	frame ifNotNil: [
		frame workPane addMorphFront: newSprite.
		frame workPane sprites addLast: newSprite].
	^ newSprite
