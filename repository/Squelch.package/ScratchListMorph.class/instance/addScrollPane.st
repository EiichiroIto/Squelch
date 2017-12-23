initialization
addScrollPane

	scrollPane := ScrollFrameMorph2 new
		vBarInset: 16;
		hBarInset: 18;
		color: Color transparent;
		growthFraction: 0.0;
		scrollbarStartInset: 2 endInset: -2;
		contents: (Morph new color: Color transparent).

	self addMorph: scrollPane.
