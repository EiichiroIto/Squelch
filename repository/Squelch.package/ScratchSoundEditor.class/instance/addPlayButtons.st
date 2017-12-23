initialization
addPlayButtons

	| b r m space n scaleSelector |
	b := SimpleButtonMorph new target: self; borderColor: Color black; useSquareCorners.
	b borderColor: #raised; borderWidth: 3.
	r := AlignmentMorph newColumn.
	r color: Color transparent; borderWidth: 0; inset: 0.
	r hResizing: #spaceFill; vResizing: #shrinkWrap; extent: 5@5.
	r centering: #center.

	m := AlignmentMorph newRow.
	m color: Color transparent; borderWidth: 0; inset: 0.
	m hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	m centering: #center.

	space := Morph new color: r color; extent: 3@5.

	n := StringMorph new contents: 'Zoom to: '.
	m addMorphBack: n.

	scaleSelector :=  (IconicButton new
		labelGraphic: self class downArrow;
		extent: 15@15;
		color: Color transparent;
		borderWidth: 0;
		target: graph;
		actWhen: #buttonDown;
		actionSelector: #setScale).
	m addMorphBack: scaleSelector.
	m addMorphBack: (Morph new color: r color; extent: 5@5).
	m addMorphBack: (b copy target: graph; label: '+';			actionSelector: #zoomIn).
	m addMorphBack: (Morph new color: r color; extent: 5@5).
	m addMorphBack: (b copy target: graph; label: '-';			actionSelector: #zoomOut).

	"n := UpdatingStringMorph new
	target: graph;
	getSelector: #scale; 
	growable: false; width: 25; step.
	m addMorphBack: n."


	m addMorphBack: (Morph new color: r color; extent: 50@5).
	
	
	m addMorphBack: (b fullCopy label: 'Play All';			actionSelector: #playAll).
	m addMorphBack: space copy.
	m addMorphBack: (b fullCopy label: 'Play';				actionSelector: #playAfterCursor).
	m addMorphBack: space copy.
	m addMorphBack: (b fullCopy label: 'Stop';				actionSelector: #stop).

	m addMorphBack: (Morph new color: r color; extent: 50@5).
	m addMorphBack: (StringMorph new contents: 'Volume').
	m addMorphBack: space copy.
	
	volume := SimpleSliderMorph new
	color: Color veryVeryLightGray;
	extent: 60@2;
	target: self;
	actionSelector: #setVolume:.

	m addMorphBack: volume.

	m addMorphBack: (Morph new color: r color; extent: 50@5).

	r addMorphBack: (Morph new color: r color; extent: 5@5).
	r addMorphBack: m.
	

	self addMorphBack: r.

