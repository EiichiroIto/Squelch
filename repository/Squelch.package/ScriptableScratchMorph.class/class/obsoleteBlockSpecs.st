block specs
obsoleteBlockSpecs
	"Answer a list of specifications for the graphic filter blocks."

	^ #(
	'obsolete number blocks'
		('abs %n'							r	abs -)
		('sqrt %n'							r	sqrt -)
	'obsolete sound blocks'
		('rewind sound %S'					-	rewindSound:)
	'obsolete sprite motion blocks'
		('point away from edge'				-	turnAwayFromEdge)
		('glide x:%n y:%n in %n secs'		t	gotoX:y:duration:elapsed:from: 50 50 1)
	'obsolete sprite looks blocks'
		('change costume by %n'			-	changeCostumeIndexBy: 1)
		('change background by %n' 		-	changeBackgroundIndexBy: 1)
		-
		('change stretch by %n'				-	changeStretchBy:)
		('set stretch to %n%'					-	setStretchTo: 100)
		-
		('say nothing'						-	sayNothing)
		-
		('change visibility by %n'			-	changeVisibilityBy: -10)
		('set visibility to %n%'				-	setVisibilityTo: 100)
	'obsolete image effects'
		('change color-effect by %n'		-	changeHueShiftBy: 25)
		('set color-effect to %n'				-	setHueShiftTo: 0)
		-
		('change fisheye by %n'			-	changeFisheyeBy: 10)
		('set fisheye to %n'					-	setFisheyeTo: 0)
		~
		('change whirl by %n'				-	changeWhirlBy: 30)
		('set whirl to %n'					-	setWhirlTo: 0)
		-
		('change pixelate by %n'			- 	changePixelateCountBy: 1)
		('set pixelate to %n'					- 	setPixelateCountTo: 1)
		~
		('change mosaic by %n'				- 	changeMosaicCountBy: 1)
		('set mosaic to %n'					- 	setMosaicCountTo: 1)
		-
		('change brightness-shift by %n'	-	changeBrightnessShiftBy: 10)
		('set brightness-shift to %n'			-	setBrightnessShiftTo: 0)
		~
		('change saturation-shift by %n'	-	changeSaturationShiftBy: 10)
		('set saturation-shift to %n'			-	setSaturationShiftTo: 0)
		-
		('change pointillize drop by %n'		-	changePointillizeSizeBy: 5)
		('set pointillize drop to %n'			-	setPointillizeSizeTo: 0)
		~
		('change water ripple by %n'		-	changeWaterRippleBy: 5)
		('set water ripple to %n'				-	setWaterRippleTo: 0)
		-
		('change blur by %n'				-	changeBlurBy: 1)
		('set blur to %n'						-	setBlurTo: 0)
	)
