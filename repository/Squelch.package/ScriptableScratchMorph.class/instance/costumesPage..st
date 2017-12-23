blocks
costumesPage: xOffset
	"Answer a morph containing thumbnails of my costumes."

	| bin label m y images n recBut impBut photoBut maxHeight xMargin yMargin separator |
	xMargin := 15.
	yMargin := 15.

	bin := ScratchBlockPaletteMorph new color: ScratchFrameMorph scriptsPaneColor.

	(self isKindOf: ScratchStageMorph)
		ifTrue: [label := 'New background:' localized]
		ifFalse: [label := 'New costume:' localized].
	m := StringMorph
		contents: label
		font: (ScratchFrameMorph getFont: #CostumesPage).
	m color: Color white.
	bin addMorph: m.

	recBut := ScratchFrameMorph buttonLabel: 'Paint' localized selector: #drawNewCostume.
	recBut target: self.
	bin addMorph: recBut.

	impBut := ScratchFrameMorph buttonLabel: 'Import' localized selector: #importImage.
	impBut target: self.
	bin addMorph: impBut.

	photoBut := ScratchFrameMorph buttonLabel: 'Camera' localized selector: #takePhoto.
	photoBut target: self.
	bin addMorph: photoBut.

	maxHeight := (m height max: (impBut height max: (recBut height max: photoBut height))).
	ScratchTranslator isRTL
		ifTrue: [
			photoBut position: xMargin@(yMargin + ((maxHeight - photoBut height) / 2)).
			impBut position: (photoBut right + 4)@(yMargin + ((maxHeight - impBut height) / 2)).
			recBut position: (impBut right + 4)@(yMargin + ((maxHeight - recBut height) / 2)).
			m position: (recBut right + 4)@(yMargin + ((maxHeight - m height) / 2))]
		ifFalse: [
			m position: xMargin@(yMargin + ((maxHeight - m height) / 2)).
			recBut position: (m right + 4)@(yMargin + ((maxHeight - recBut height) / 2)).
			impBut position: (recBut right + 4)@(yMargin + ((maxHeight - impBut height) / 2)).
			photoBut position: (impBut right + 4)@(yMargin + ((maxHeight - impBut height) / 2))].

	separator := TiledImageMorph new tileForm: (ScratchFrameMorph skinAt: #costumeSeparatorTile).
	bin addMorph: (separator position: (xOffset + 17)@(yMargin + maxHeight + 5)).

	y := yMargin + maxHeight + 9.
	n := 0.
	images := media select: [:item | item isImage].
	images do: [:item |
		m := MediaItemMorph new.
		m scratchObj: self media: item; position: xOffset@y.
		m setNumber: (n := n + 1).
		item = costume ifTrue: [m highlight: true].
		bin addMorph: m.
		y := y + m height - 1.].

	bin submorphs size > 0
		ifTrue: [separator width: bin firstSubmorph width - 14]
		ifFalse: [separator width: 240].

	^ bin
