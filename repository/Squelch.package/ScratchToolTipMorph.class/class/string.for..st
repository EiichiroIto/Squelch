instance creation
string: str for: morph

	^ self new
		message: str;
		target: morph;
		color: Color paleYellow;
		borderWidth: 1;
		borderColor: Color black
