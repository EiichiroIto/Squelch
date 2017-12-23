drawing
drawBackgroundOn: aCanvas
	"Draw my background."

	color isTransparent ifTrue: [^ self].

	aCanvas
		fillRectangle: (self topLeft corner: pageViewerMorph topRight)
		color: color.
