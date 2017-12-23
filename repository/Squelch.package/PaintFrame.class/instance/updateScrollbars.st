geometry
updateScrollbars
	"Update my scrollbars based on my current scale."

	| visible scaledTotal |
	visible := canvasMorph extent.
	scaledTotal := canvasMorph canvasForm extent * canvasMorph scale asFloat.
	hScrollbar
		percentVisible: visible x / scaledTotal x;
		scrollFraction: canvasMorph scrollFractionX.
	vScrollbar
		percentVisible: visible y / scaledTotal y;
		scrollFraction: canvasMorph scrollFractionY.
