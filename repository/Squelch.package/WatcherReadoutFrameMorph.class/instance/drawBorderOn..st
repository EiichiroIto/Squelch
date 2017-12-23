drawing
drawBorderOn: aCanvas

	"border lines"
	aCanvas
		line: (self topLeft + (2@0)) to: (self topRight - (3@0)) color: borderColor;
		line: (self topLeft + (0@2)) to: (self bottomLeft - (0@3)) color: borderColor;
		line: (self bottomLeft + (2@(-1))) to: (self bottomRight - (3@1)) color: borderColor;
		line: (self bottomRight - (1@3)) to: (self topRight + ((-1)@2)) color: borderColor.

	"border corners"
	aCanvas
		line: (self topLeft + (1@1)) to: (self topLeft + (1@1)) color: borderColor;
		line: (self topRight - (2@(-1))) to: (self topRight - (2@(-1))) color: borderColor;
		line: (self bottomRight - (2@2)) to: (self bottomRight - (2@2)) color: borderColor;
		line: (self bottomLeft - ((-1)@2)) to: (self bottomLeft - ((-1)@2)) color: borderColor.
