initialization
addControls

	| b r spacer |
	b := SimpleButtonMorph new target: self; borderColor: Color black; useSquareCorners.
	b borderColor: #raised; borderWidth: 3.
	r := AlignmentMorph newRow.
	r color: Color transparent; borderWidth: 0; inset: 0.
	r hResizing: #spaceFill; vResizing: #shrinkWrap; extent: 5@5.
	r centering: #center.

	spacer := Morph new color: r color; extent: 40@5.  "spacer"
	r addMorphBack: (spacer fullCopy width: 5).
	r addMorphBack: (b fullCopy label: 'undo';		actionSelector: #undo).
	r addMorphBack: (spacer fullCopy width: 5).
	r addMorphBack: (b fullCopy label: 'copy';		actionSelector: #copy).
	r addMorphBack: (spacer fullCopy width: 5).
	r addMorphBack: (b fullCopy label: 'paste';		actionSelector: #paste).
	r addMorphBack: (spacer fullCopy width: 5).
	r addMorphBack: (b fullCopy label: 'cut';		actionSelector: #cut).
	r addMorphBack: (spacer fullCopy width: 5).
	r addMorphBack: (b fullCopy label: 'crop';		actionSelector: #crop).	
	r addMorphBack: (spacer fullCopy width: 25).
	r addMorphBack: (b copy target: graph;
							label: 'zoom selection';	actionSelector: #viewSelection).

	r addMorphBack: (spacer fullCopy width: 25).
	r addMorphBack: (b fullCopy label: 'okay';			actionSelector: #save).
	r addMorphBack: (spacer fullCopy width: 5).
	r addMorphBack: (b fullCopy label: 'cancel';		actionSelector: #cancel).

	self addMorphBack: r.

