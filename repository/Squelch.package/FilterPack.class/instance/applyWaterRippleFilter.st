private
applyWaterRippleFilter

	| fOut ripply |
	fOut := cachedForm deepCopy.
	waterArray1 ifNil: [waterArray1 := ByteArray new: (8 * fOut width * fOut height)].
	waterArray2 ifNil: [waterArray2 := ByteArray new: (8 * fOut width * fOut height)].
	ripply := (100.0 * (waterRippleRate abs / fOut width) sqrt) asInteger max: 1.

	ScratchPlugin
		primWaterRipples1: cachedForm bits
		into: fOut bits
		width: fOut width asInteger
		dropNum: ripply
		array1: waterArray1
		array2: waterArray2.

	resultForm := fOut.
