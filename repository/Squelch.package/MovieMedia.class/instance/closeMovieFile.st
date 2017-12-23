file ops
closeMovieFile

	movieFile ifNotNil: [movieFile closeFile].
	sound ifNotNil: [sound pause].
	movieFile := nil.
	sound := nil.

	origForm := (Form extent: 8@8 depth: 4) fillColor: Color lightGray.
	outForm := origForm deepCopy.
	self updateOutForm.
