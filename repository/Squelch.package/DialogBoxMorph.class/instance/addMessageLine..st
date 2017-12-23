accessing
addMessageLine: aMorph
	"Add the given morph (some kind of StringMorph, probably) centered below the other message lines."

	| ypos |
	messageLineMorphs ifNil: [messageLineMorphs := OrderedCollection new].
	ypos := self top + 50.
	messageLineMorphs submorphsDo: [:m | ypos := ypos max: (m bottom + 5)].
	aMorph position: (self left + ((self width - aMorph width) // 2))@ypos.
	messageLineMorphs addMorphBack: aMorph.
	self height: (aMorph bottom - self top) + 75.
