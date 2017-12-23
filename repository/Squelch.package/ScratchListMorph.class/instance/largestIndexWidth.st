private
largestIndexWidth
	"Estimate the width needed for the largest cell number."
	"Note: we estimate using the width of the the digit '0' times the number of digits needed."

	| digitWidth digitCount n |
	digitWidth := (ScratchFrameMorph getFont: #Label) widthOf: $0.
	n := cellMorphs size + 1 max: 100.
	digitCount := n log ceiling.
	^ digitCount * digitWidth

