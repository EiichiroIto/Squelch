initialization
initialize

	super initialize.
	scalePoint := 1.0@1.0.
	rotationDegrees := 0.0.				"clockwise angle of rotation"
	rotationStyle := #normal.				"#normal, #leftRight, or #none"
	rotatedForm := self costumeForm.		"cached rotated/scaled copy of costume form"
	offsetWhenRotated := 0@0.			"offset for rotated form needed to keep rotation center invariant"
	draggable := false.
	penDown := false.
	penSize := 1.
	penHue := 133.3.
	penShade := 50.
	self penColor: Color blue.
	self extent: rotatedForm extent.
