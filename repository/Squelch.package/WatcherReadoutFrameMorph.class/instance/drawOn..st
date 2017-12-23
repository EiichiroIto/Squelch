drawing
drawOn: aCanvas

	"fill inside"
	aCanvas
		fillRectangle: (Rectangle origin: (self topLeft + (2@1)) corner: (self bottomRight - (2@1))) color: color;
		fillRectangle: (Rectangle origin: (self topLeft + (1@2)) corner: (self bottomRight - (1@2))) color: color.

	"white border"
	self drawBorderOn: aCanvas.

	"inner shadows"
	aCanvas
		line: (self topLeft + (2@1)) to: (self topRight - (3@ -1)) color: (self color darker darker);
		line: (self topLeft + (1@2)) to: (self bottomLeft - (-1@3)) color: (self color darker darker);
		line: (self topLeft + (2@2)) to: (self topRight - (3@ -2)) color: (self color darker);
		line: (self topLeft + (2@2)) to: (self bottomLeft - (-2@2)) color: (self color darker);
		line: (self bottomLeft - (-2@2)) to: (self bottomRight - (3@2)) color: (self color darker);
		line: (self topRight - (2@ -2)) to: (self bottomRight - (2@3)) color: (self color darker).
