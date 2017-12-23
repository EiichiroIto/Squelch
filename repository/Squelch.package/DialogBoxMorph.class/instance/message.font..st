interaction
message: aMessage font: aStrikeFont
	"Set and position my message/question text."

	| lines m |
	messageLineMorphs ifNotNil: [
		messageLineMorphs submorphsDo: [:lineM | lineM delete]].

	messageLineMorphs := AlignmentMorph newColumn
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		wrapCentering: #center.
	lines := aMessage lines.
	1 to: lines size do: [:n |
		m := StringMorph
			contents: (lines at: n)
			font: aStrikeFont.
		messageLineMorphs addMorphBack: m].

	mainColumn addMorph: messageLineMorphs.

	self changed.
