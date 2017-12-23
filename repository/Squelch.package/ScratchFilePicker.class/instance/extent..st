geometry
extent: aPoint
	"Resize my contents pane when I am resized."

	super extent: aPoint.
	contentsPaneMorph ifNotNil: [
		contentsPaneMorph
			bounds: ((self topLeft + (9@50)) corner: (self bottomRight - 7)).
		topBarMorph width: contentsPaneMorph width].
