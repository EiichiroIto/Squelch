drawing
drawString: aString at: aPoint on: aCanvas
	aCanvas
		drawString: aString
		in: (aPoint extent: 10000 @ 10000)
		font: font
		color: textColor