drawing
drawBackgroundOn: aCanvas
	"Draw my background."

	color isTransparent ifTrue: [^ self].

	aCanvas
		fillRectangle: (self topLeft extent: (self width @ catButtonsExtent y))
		color: color.
