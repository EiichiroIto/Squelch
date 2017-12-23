initialization
addSlider

	| r m spacer |
	r := AlignmentMorph newRow.
	r color: Color transparent; borderWidth: 0; inset: 0.
	r hResizing: #spaceFill; vResizing: #shrinkWrap; extent: 5@5.
	r centering: #center.	
	
	spacer := Morph new color: r color; extent: (graph left -10)@5.
	backButton := self makeSliderButton: 10@13.
	backButton addMorphCentered: (ImageMorph new form: (self class upArrow rotateBy: #left centerAt: 0@0)).

	fwdButton := self makeSliderButton: 10@13.
	fwdButton addMorphCentered: (ImageMorph new form: (self class upArrow rotateBy: #right centerAt: 0@0)).
	
	slider := SimpleSliderMorph new
		color: Color veryVeryLightGray;
		extent: (graph width)@2;
		target: self;
		setMaxVal: (graph bounds width/(graph scale*graph data size));
		actionSelector: #scrollTime:.
	
	r addMorph: spacer.
	r addMorph: fwdButton.
	r addMorph: slider.
	r addMorph: backButton.
	
	m := Morph new color: r color; extent: 15@5.  "spacer"
	r addMorphBack: m.
	time := UpdatingStringMorph new
		target: self;
		getSelector: #startTime; 
		width: 40; step.
	time useStringFormat.
	r addMorphBack: time.

	self addMorphBack: r.
