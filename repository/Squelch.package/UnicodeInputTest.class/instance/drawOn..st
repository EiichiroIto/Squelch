drawing
drawOn: aCanvas

	|  |
	super drawOn: aCanvas.
	self drawString: 'keyValue: ', key printString at: self topLeft + (10@7) on: aCanvas.
	self drawString: 'unicodeChar: ', uchar printString at: self topLeft + (10@30) on: aCanvas.

	"f := ScratchTranslator
		formFor: (Unicode value: uchar) asString
		font: (StrikeFont fontName: 'VerdanaBold' size: 24)
		fgColor: Color black
		bgColor: color
		suppressAntiAliasing: false.
	f ifNotNil: [aCanvas paintImage: f at: self topLeft + (95@60)]."
