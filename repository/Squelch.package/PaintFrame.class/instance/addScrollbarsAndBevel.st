initialization
addScrollbarsAndBevel

	self addMorph: (
		hScrollbar := ScratchScrollBar newHorizontal
			target: canvasMorph;
			selector: #scrollFractionX:).
	self addMorph: (
		vScrollbar := ScratchScrollBar newVertical
			target: canvasMorph;
			selector: #scrollFractionY:).
	self addMorphBack: (
		canvasFrame := ImageFrameMorph2 new
			initFromForm: (ScratchFrameMorph skinAt: #paintCanvasFrame);
			extent: canvasMorph extent + (8@8)).
