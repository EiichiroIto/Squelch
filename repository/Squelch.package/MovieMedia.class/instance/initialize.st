initialization
initialize

	super initialize.
	fileName := ''.
	movieFile := nil.
	fade := 100.
	fadeColor := Color black.
	zoom := 100.
	hPan := 0.
	vPan := 0.
	msecsPerFrame := 100.
	currentFrame := 1.
	moviePlaying := false.
	movieFile := nil.
	sound := nil.
	origForm := (Form extent: 8@8 depth: 4) fillColor: Color lightGray.
	outForm := origForm deepCopy.
