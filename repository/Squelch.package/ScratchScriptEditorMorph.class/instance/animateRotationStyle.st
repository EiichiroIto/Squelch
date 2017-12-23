menu/button ops
animateRotationStyle

	| style thumbForm wasFlipped currentRotation pen center rotatedForm doFlip |
	style := self target rotationStyle.

	thumbnailMorph updateThumbnail.
	thumbForm := thumbnailMorph form deepCopy.
	currentRotation := self target rotationDegrees rounded.
	wasFlipped := ((currentRotation \\ 360) >= 90) & ((currentRotation \\ 360) <= 270).

	thumbnailMorph showDirection: false.

	pen := (Pen newOnForm: thumbnailMorph form) color: Color white.
	center := thumbnailMorph form center.
	currentRotation to: currentRotation + 360 by: 12 do: [:i |
		rotatedForm := thumbForm.  "no rotation by default"
		style = #normal ifTrue: [rotatedForm := thumbForm rotateBy: i].
		style = #leftRight ifTrue: [
			doFlip := ((i \\ 360) >= 90) & ((i \\ 360) <= 270).
			wasFlipped ifTrue: [doFlip := doFlip not].
			doFlip ifTrue: [rotatedForm := thumbForm flipBy: #horizontal centerAt: 0@0]].

		thumbnailMorph form fill: thumbnailMorph form boundingBox fillColor: Color transparent.
		rotatedForm
			displayOn: thumbnailMorph form
			at: (thumbnailMorph extent - rotatedForm extent) // 2
			rule: Form paint.
		pen place: center.
		pen goto: center + (Point r: 22 degrees: i).
		thumbnailMorph changed.

		World displayWorldSafely.
		(Delay forMilliseconds: 20) wait].

	thumbnailMorph showDirection: true.
	thumbnailMorph updateThumbnail.
