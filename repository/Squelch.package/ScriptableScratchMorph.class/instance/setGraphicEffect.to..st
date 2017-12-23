looks ops
setGraphicEffect: effect to: aNumber
	"Set the given graphic effect to the given value."

	filterPack ifNil: [filterPack := FilterPack new].

	'blur' = effect ifTrue: [filterPack blur: aNumber].
	'brightness' = effect ifTrue: [filterPack brightnessShift: aNumber].
	'fisheye' = effect ifTrue: [filterPack fisheye: aNumber].
	'color' = effect ifTrue: [filterPack hueShift: aNumber].
	'mosaic' = effect ifTrue: [filterPack mosaicCount: aNumber].
	'pixelate' = effect ifTrue: [filterPack pixelateCount: aNumber].
	'pointillize' = effect ifTrue: [filterPack pointillizeSize: aNumber].
	'saturation' = effect ifTrue: [filterPack saturationShift: aNumber].
	('transparency' = effect) | ('ghost' = effect) ifTrue: [self transparency: aNumber].
	'water ripple' = effect ifTrue: [filterPack waterRippleRate: aNumber].
	'whirl' = effect ifTrue: [filterPack whirl: aNumber].

	costumeChangeMSecs := Time millisecondClockValue.
	self changed.
