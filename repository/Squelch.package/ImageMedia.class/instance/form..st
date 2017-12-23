accessing
form: aForm

	form := aForm.
	form couldBeColorReduced
		ifTrue: [form := form colorReduced].  "reduce color depth to save space"

	rotationCenter := form extent // 2.
	jpegBytes := compositeForm := nil.
