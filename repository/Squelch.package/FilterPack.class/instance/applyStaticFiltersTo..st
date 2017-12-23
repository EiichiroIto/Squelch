private
applyStaticFiltersTo: srcForm
	"Apply all active static filters."

	| fOut tmp |
	resultForm := srcForm deepCopy.
	resultForm unhibernate.

	hueShift = 0 ifFalse: [
		ScratchPlugin primShiftHue: resultForm bits
			into: resultForm bits byDegrees: (1.8 * hueShift) asInteger].
	saturationShift = 0 ifFalse: [
		ScratchPlugin primShiftSaturation: resultForm bits
			into: resultForm bits by: saturationShift asInteger].
	brightnessShift = 0 ifFalse: [
		ScratchPlugin primShiftBrightness: resultForm bits
			into: resultForm bits by: brightnessShift asInteger].

	whirl = 0 ifFalse: [
		fOut := resultForm deepCopy.
		ScratchPlugin primWhirl: resultForm bits
			into: fOut bits width: resultForm width angle: whirl asInteger.
		resultForm := fOut].

	fisheye = 0 ifFalse: [
		"Note: The primitive takes power >= 0 where 100 is normal, >100 is fisheye, <100 is blackhole effect"
		ScratchPlugin
			primFisheye: resultForm bits copy  "copy the source bits"
			into: resultForm bits
			width: resultForm width
			power: ((fisheye asInteger + 100) max: 0)].

	pixelateCount abs >= 5 ifTrue: [self applyPixelateFilter].
	mosaicCount abs >= 5 ifTrue: [self applyMosaicFilter].

	blur = 0 ifFalse: [
		fOut := resultForm deepCopy.
		(blur asInteger min: 100) timesRepeat: [
			ScratchPlugin primBlur: resultForm bits into: fOut bits width: resultForm width.
			tmp := resultForm.
			resultForm := fOut.
			fOut := tmp]].

	cachedForm := resultForm.
