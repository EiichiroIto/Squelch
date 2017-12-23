initialization
addValueSelectors

	| r m b |
	b := SimpleButtonMorph new target: self; borderColor: Color black; useSquareCorners.
	b borderColor: #raised; borderWidth: 3.
	r := AlignmentMorph newRow.
	r color: Color transparent; borderWidth: 0; inset: 0.
	r hResizing: #spaceFill; vResizing: #shrinkWrap; extent: 5@5.
	r centering: #center.

	r addMorphBack: (Morph new color: r color; extent: 5@5).

	"r addMorphBack: (b fullCopy label: '<<';					actionSelector: #slower)."
	r addMorphBack: (b fullCopy label: 'Reset Play Rate';	actionSelector: #resetSamplingRate).
	"r addMorphBack: (b fullCopy label: '>>';					actionSelector: #faster)."

	r addMorphBack: (Morph new color: r color; extent: 25@5).
	m := StringMorph new contents: 'Sampling Rate'.
	r addMorphBack: m.
	m := Morph new color: r color; extent: 5@5. "spacer"
	r addMorphBack: m.

	rateSlider := SimpleSliderMorph new
	color: Color veryVeryLightGray;
	extent: 60@2;
	target: self;
	minVal: 0.2;
	maxVal: 2.5;
	actionSelector: #samplingRate:.
	r addMorphBack: rateSlider.
	r addMorphBack: (Morph new color: r color; extent: 30@5).

	m := StringMorph new contents: 'Index: '.
	r addMorphBack: m.
	m := UpdatingStringMorph new
		target: graph; getSelector: #cursor; putSelector: #cursor:;
		growable: false; width: 30; step.
	r addMorphBack: m.
	
	m := Morph new color: r color; extent: 20@5. "spacer"
	r addMorphBack: m.

	m := StringMorph new contents: 'Value: '.
	r addMorphBack: m.
	m := UpdatingStringMorph new
		target: graph; getSelector: #valueAtCursor; putSelector: #valueAtCursor:;
		growable: false; width: 40; step.
	r addMorphBack: m.

	m := Morph new color: r color; extent: 20@5. "spacer"
	r addMorphBack: m.

	"r addMorphBack: ( b fullCopy label: 'zoom to selection';		actionSelector: #zoomToSelection).
	m := Morph new color: r color; extent: 5@5.
	r addMorphBack: m."

	self addMorphBack: r.

