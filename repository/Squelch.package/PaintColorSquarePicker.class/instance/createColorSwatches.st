initialization
createColorSwatches

	| baseColors emptyRow swatchCol row thisColor b swatch spacer spacerRow c transparentSwatch |

	baseColors := OrderedCollection new.

	#(0.2 0.4 1.0) do: [:y |
		#(0 35 60 140 180 225 270 315) do: [:x |
			c := Color h: x s: y v: 1.0.
			baseColors add: c]].
	#(0.8 0.6 0.4) do: [:y |
		#(0 35 60 140 180 225 270 315) do: [:x |
			c := Color h: x s: 1.0 v: y.
			baseColors add: c]].
	#(0.0 0.4 0.5 0.7 0.8 0.9 1.0 1.0) do: [:x |
		c := Color r: x g: x b: x.
		baseColors add: c].

	emptyRow := AlignmentMorph newRow
		color: Color transparent;
		layoutInset: 0;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.

	spacer := Morph new
		width: 2;
		height: 12;
		color: Color transparent.

	spacerRow := Morph new
		width: self width;
		height: 2;
		color: Color transparent.

	swatch := SimpleButtonMorph new
		borderWidth: 1;
		label: ' ';
		actWhen: #buttonDown;
		borderColor: (Color r: 0.505 g: 0.505 b: 0.505);
		target: self;
		actionSelector: #setColor:.

	swatch firstSubmorph delete. "remove label, which can cause layout issue with scaled up fonts"
	swatch extent: 12@12.

	transparentSwatch := IconicButton new
		labelGraphic: (ScratchFrameMorph skinAt: #transparentSwatch);
		borderWidth: 1;
		borderColor: (Color r: 0.505 g: 0.505 b: 0.505);
		target: self;
		actionSelector: #setColor:;
		extent: 12@12;
		arguments: (Array with: Color transparent).

	swatchCol := AlignmentMorph newColumn color: Color transparent; layoutInset: 0; hResizing: #rigid; vResizing: #rigid.
	row := emptyRow fullCopy.
	1 to: (baseColors size - 1) do: [:i |
		thisColor := baseColors at: i.
		b := swatch fullCopy color: thisColor; arguments: (Array with: thisColor).
		row ifNil: [row := emptyRow fullCopy].
		row layoutInset: 0.
		row addMorphBack: b.
		row addMorphBack: spacer fullCopy.
		(i \\ 8) = 0 ifTrue: [  "start a new row"
			swatchCol addMorphBack: row.
			swatchCol addMorphBack: spacerRow fullCopy.
			row := emptyRow fullCopy]].
	row addMorphBack: transparentSwatch.
	swatchCol addMorphBack: row.
	swatchCol addMorphBack: spacerRow fullCopy.

	self addMorph: swatchCol.
	swatchCol position: (self topLeft) + (5@5).
