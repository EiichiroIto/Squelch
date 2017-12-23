initialization
buildContentsPane
	"Build a scroll pane to hold the directory contents."

	contentsPaneMorph := ScrollFrameMorph2 new
		color: self color;
		contents: (Morph new color: self color);
		showHorizontalScrollbar: false;
		hBarInset: 18;
		vBarInset: 18.

	self addMorphBack: contentsPaneMorph.
