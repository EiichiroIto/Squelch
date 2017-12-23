looks ops
changeSizeBy: delta
	"Change my size by the given delta."

	| currentScale |
	currentScale := 100.0 * (scalePoint x max: scalePoint y).
	self setSizeTo: (currentScale + delta).
