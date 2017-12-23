geometry
fixLayout

	| stageExtent stageBox y totalW x |
	stageExtent := doubleSize ifTrue: [2 * stage extent] ifFalse: [stage extent].
	stageBox := Rectangle center: self center extent: stageExtent.
	stage owner center: self center.
	dummyMorph bounds: stage owner bounds.

	y := stageBox top - 24.
	buttons first position: (stageBox left + 5) @ y.  "exit presentation button"

	"other buttons"
	totalW := (buttons collect: [:b | b width] from: 2 to: buttons size) sum.
	x := stageBox right - totalW - (2 * (buttons size - 2)) - 5.
	buttons allButFirst do: [:b |
		b position: x@y.
		x := x + b width + 2].

	offscreenWorld redrawAll.
