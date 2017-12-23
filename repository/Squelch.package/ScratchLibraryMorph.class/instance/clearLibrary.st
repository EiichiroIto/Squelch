initialization
clearLibrary
	"Remove all library items. My step method will re-add items for existing objects."

	| sFrame |
	stagePane removeAllMorphs.
	scrollPane contents removeAllMorphs.
	scrollPane vScrollRelative: 0.

	spriteLabel delete.
	spriteLabel := self buildSpriteLabel.

	sFrame := self meOrOwnerThatIsA: ScratchFrameMorph.
	(sFrame isNil or:
	 [sFrame viewMode = #normal]) ifTrue: [
		self addMorph: spriteLabel].

	buttonPane delete.
	buttonPane := self makeNewSpriteButtons: sFrame.
	self addMorph: buttonPane.

	topSectionHeight := ((spriteLabel height + 10) max: 40).
	self fixLayout.
