drawing
drawBackgroundOn: aCanvas
	"Draw my background."

	| r |
	"color isTransparent ifTrue: [^ self]."
	color := Color gray darker.

	aCanvas fillRectangle: (myBox insetBy: 7) color: color.

	r := ((stagePane right + 3) @ (myBox top + topSectionHeight + 12)) extent: (1 @ (myBox height - topSectionHeight - 30)).
	aCanvas fillRectangle: r color: (Color gray: 0.3).

	r := (r origin + (1@0)) extent: (1 @ r height).
	aCanvas fillRectangle: r color: Color gray.
