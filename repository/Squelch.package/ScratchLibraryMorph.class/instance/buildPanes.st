initialization
buildPanes
	"Build my scroll pane."

	| bin |
	stagePane := Morph new
		color: Color transparent;
		position: self position + (7@0).

	bin := ScratchSpriteLibraryMorph new
		color: Color transparent;
		borderWidth: 0.

	scrollPane := ScrollFrameMorph2 new
		color: Color transparent;
		contents: bin;
		showHorizontalScrollbar: false.

	spritePane := Morph new
		color: Color gray;
		position: self position.
	spriteLabel := self buildSpriteLabel.
	buttonPane := self makeNewSpriteButtons: (self meOrOwnerThatIsA: ScratchFrameMorph).

	self addMorph: spritePane.
	self addMorph: spriteLabel.
	self addMorph: buttonPane.
	self addMorph: scrollPane.
	self addMorph: stagePane.
