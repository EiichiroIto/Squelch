geometry
fixLayoutForExtent: aPoint

	| xPos yPos shortcutWidth fileColumnWidth |
	shortcutColumn ifNil: [^ self].
	xPos := self left + 20.
	yPos := self top + 40.

	"position and size the shortcut column"
	shortcutColumn position: xPos@yPos.
	shortcutWidth := 0.
	shortcutColumn submorphsDo: [: m |
		shortcutWidth := m width max: shortcutWidth].
	shortcutColumn submorphsDo: [: m |
		m width: shortcutWidth].

	"position main column"
	mainColumn position: (shortcutColumn right + 5)@yPos.

	"position and size the fileInfo column"
	fileInfoColumn position: (mainColumn right + 5)@yPos.
	fileColumnWidth := 0.
	fileInfoColumn submorphsDo: [: m |
		fileColumnWidth := m width max: fileColumnWidth].
	fileInfoColumn submorphsDo: [: m |
		(m isKindOf: StringMorph)
			ifFalse: [m width: fileColumnWidth]].

	"position and size title"
	titleBin left: self left.
	titleBin width: shortcutColumn width + mainColumn width + fileInfoColumn width + 55.

	"add a bottom spacer to the tallest column"
	bottomSpacer ifNil: [
		bottomSpacer := (Morph new extent: (5@22); color: Color transparent).
		(shortcutColumn height > mainColumn height)
			ifTrue: [shortcutColumn addMorphBack: bottomSpacer]
			ifFalse: [(mainColumn height > fileInfoColumn height)
				ifTrue: [mainColumn addMorphBack: bottomSpacer]
				ifFalse: [fileInfoColumn addMorphBack: bottomSpacer]]].
