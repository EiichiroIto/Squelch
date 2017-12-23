drawing
drawOn: aCanvas

	| stageRect |
	stageRect := Rectangle
		center: stage center
		extent: (doubleSize ifTrue: [2 * stage extent] ifFalse: [stage extent]).

	(self bounds areasOutside: stageRect) do: [:r |
		aCanvas fillRectangle: r color: color].

	(aCanvas clipRect intersects: stageRect) ifTrue: [
		offscreenWorld invalidRect: aCanvas clipRect.
		offscreenWorld incrRedrawDouble: doubleSize].

	dummyMorph changed