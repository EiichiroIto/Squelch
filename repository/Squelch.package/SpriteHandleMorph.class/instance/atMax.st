testing
atMax
	"answer true if the target sprite cannot be made any bigger"

	| maxExtent |
	maxExtent := ScratchFrameMorph workpaneExtent asFloatPoint * 1.5.
	^(target extent x >= maxExtent x) or:
		[target extent y >= maxExtent y]