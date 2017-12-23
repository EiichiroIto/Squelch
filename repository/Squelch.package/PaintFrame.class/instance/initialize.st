initialization
initialize

	super initialize.
	self addMorph: (
		canvasMorph := PaintCanvas new
			extent: ScratchFrameMorph workpaneExtent;
			editForm: ((Form extent: PaintCanvas canvasExtent depth: 32) fillColor: Color transparent)).
	buttonRow ifNotNil: [
		buttonRow delete.
		self addMorph: buttonRow].
	self addMorph: (paletteMorph := canvasMorph palette).
	self addScrollbarsAndBevel.
	self addButtons.
	self addSetRotationCenterButton.
	self addTransformButtons.
	self addColorChoosers.
