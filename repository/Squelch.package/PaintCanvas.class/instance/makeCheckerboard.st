private
makeCheckerboard
	"Create a checkboard form the same size as my canvas form and fill it with a checkboard pattern (used to show transparnecy). "

	| f squareSize blt |
	f := Form extent: canvasForm extent depth: 1.
	squareSize := 4.
	f fillColor: Color white.

	blt := (BitBlt toForm: f)
		fillColor: Color black;
		combinationRule: Form over;
		destRect: (0@0 extent: squareSize@squareSize).

	0 to: f height by: (2 * squareSize) do: [:y |
		blt destY: y.
		0 to: f width by: (2 * squareSize) do: [:x | blt destX: x; copyBits].
		blt destY: y + squareSize.
		squareSize to: f width by: (2 * squareSize) do: [:x | blt destX: x; copyBits]].

	^ f
