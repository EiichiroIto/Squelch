instance creation
string: str for: morph

	^ self new
		message: str;
		target: morph;
		color: (Color r: 0.9 g: 0.9 b: 0.9);
		useRoundedCorners;
		borderWidth: 0.
