blocks
soundsPage: xOffset
	"Answer a morph containing thumbnails of my sounds."

	| bin m y sounds n recBut impBut maxHeight yMargin xMargin separator |
	xMargin := 15.
	yMargin := 15.

	bin := ScratchBlockPaletteMorph new.

	m := StringMorph
		contents: 'New sound:' localized
		font: (ScratchFrameMorph getFont: #SoundsPage).
	m color: Color white.
	bin addMorph: m.

	recBut := ScratchFrameMorph buttonLabel: 'Record' localized selector: #recordSound.
	recBut target: self.
	bin addMorph: recBut.

	impBut := ScratchFrameMorph buttonLabel: 'Import' localized selector: #importSound.
	impBut target: self.
	bin addMorph: impBut.

	maxHeight := (m height max: (impBut height max: recBut height)).
	ScratchTranslator isRTL
		ifTrue: [impBut position: xMargin@(yMargin + ((maxHeight - impBut height) / 2)).
			recBut position: (impBut right + 4)@(yMargin + ((maxHeight - recBut height) / 2)).
			m position: (recBut right + 4)@(yMargin + ((maxHeight - m height) / 2))]
		ifFalse: [m position: xMargin@(yMargin + ((maxHeight - m height) / 2)).
			recBut position: (m right + 4)@(yMargin + ((maxHeight - recBut height) / 2)).
			impBut position: (recBut right + 4)@(yMargin + ((maxHeight - impBut height) / 2))].

	separator := TiledImageMorph new tileForm: (ScratchFrameMorph skinAt: #costumeSeparatorTile).
	bin addMorph: (separator position: (xOffset + 17)@(yMargin + maxHeight + 5)).

	n := 0.
	y := yMargin + maxHeight + 9.
	sounds := media select: [:item | item isSound].
	sounds do: [:item |
		m := MediaItemMorph new.
		m scratchObj: self media: item; position: xOffset@y.
		m setNumber: (n := n + 1).
		bin addMorph: m.
		y := y + m height - 1].

	bin submorphs size > 0
		ifTrue: [separator width: bin firstSubmorph width - 14]
		ifFalse: [separator width: 240].

	^ bin
