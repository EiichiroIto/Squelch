initialization
initialize

	super initialize.
	palette := PaintPalette new canvasMorph: self.
	scale := 1.
	scrollX := scrollY := 0.
	showSelection := false.
	textColor := Color black.
	textBox := MultilineStringMorph new
		font: (StrikeFont familyName: 'Helvetica Bold' size: 24);
		suppressAntiAliasing: true;
		textColor: Color black;		"pixel value 1 at depth 2"
		borderColor: Color white;		"pixel value 2 at depth 2"
		borderWidth: 0.
	textDragMode := #none.
	self extent: 250@250.
