initialization
setUpNoteDisplay

	| height rectMorph |
	height := 20.

	"set up the rect morph which holds the note text"
	rectMorph := BorderedMorph new
		color: Color white;
		position: self bottomLeft - (0@2);
		extent: (self width @ height).
	self extent: self fullBounds extent.
	self addMorph: rectMorph.

	labelMorph := StringMorph new.
	labelMorph position: rectMorph position + (0@4).
	rectMorph addMorph: labelMorph.
	self extent: self fullBounds extent.

	self updateNoteDisplay: 60.
