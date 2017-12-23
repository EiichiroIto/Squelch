pen ops
penSize: aNumber
	"Set my pen width."

	penSize := aNumber rounded min: (ScratchFrameMorph workpaneExtent x * 2) max: 1.
