accessing
shapeFilling: aBoolean
	"Set the shape filling mode for ovals and rectangles."

	shapeFilling := aBoolean.
	optionsPane firstSubmorph submorphs do: [:m |
		(m isKindOf: ToggleButton) ifTrue: [
			m off.
			((m arguments at: 1) = aBoolean) ifTrue: [m on]]].
