looks ops
changeGraphicEffect: effect by: aNumber
	"Change the given graphic effect by the given value."

	filterPack ifNil: [filterPack := FilterPack new].

	'blur' = effect ifTrue: [filterPack blur: filterPack blur + aNumber].
	'brightness' = effect ifTrue: [filterPack brightnessShift: filterPack brightnessShift + aNumber].
	'fisheye' = effect ifTrue: [filterPack fisheye: filterPack fisheye + aNumber].
	'color' = effect ifTrue: [filterPack hueShift: filterPack hueShift + aNumber].
	'mosaic' = effect ifTrue: [filterPack mosaicCount: filterPack mosaicCount + aNumber].
	'pixelate' = effect ifTrue: [filterPack pixelateCount: filterPack pixelateCount + aNumber].
	'pointillize' = effect ifTrue: [filterPack pointillizeSize: filterPack pointillizeSize + aNumber].
	'saturation' = effect ifTrue: [filterPack saturationShift: filterPack saturationShift + aNumber].
	('transparency' = effect) | ('ghost' = effect) ifTrue: [
		self transparency: self transparency + aNumber].
	'water ripple' = effect ifTrue: [filterPack waterRippleRate: filterPack waterRippleRate + aNumber].
	'whirl' = effect ifTrue: [filterPack whirl: filterPack whirl + aNumber].

	costumeChangeMSecs := Time millisecondClockValue.
	self changed.
