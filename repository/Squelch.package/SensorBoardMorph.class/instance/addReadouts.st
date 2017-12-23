initialization
addReadouts

	| readoutNames |
	readoutNames := #(
		slider
		light
		sound
		button
		A
		B
		C
		D
	).

	column := AlignmentMorph newColumn
		listCentering: #center;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		color: (Color r: (193/255) g: (196/255) b: (199/255));
		borderWidth: 2;
		borderColor: (Color r: (148/255) g: (145/255) b: (145/255));
		useRoundedCorners;
		layoutInset: 3.

	titleMorph := StringMorph
		contents: ''
		font: (StrikeFont fontName: 'VerdanaBold' size: 10).
	column addMorph: titleMorph.
	self updateTitle.
	column addMorphBack: (Morph new color: column color; extent: 5@3).  "spacer"

	self removeAllMorphs.
	readouts := readoutNames collect: [:i |
		(i size = 1)
			ifTrue:[self addReadoutLabeled: i]
			ifFalse:[self addReadoutLabeled: i localized]].
	column position: self position - 2.
	self addMorph: column.
	self extent: column extent - 4.

