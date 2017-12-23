event handling
keyStroke: evt

	key := evt keyValue.
	uchar := evt keyCharacter charCode.
	self changed.

