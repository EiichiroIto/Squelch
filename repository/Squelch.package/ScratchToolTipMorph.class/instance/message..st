accessing
message: aString

	message := StringMorph
		contents: aString
		font: self messageFont.
	self addMorph: message.
	self extent: message extent + (12@3).
	message position: 6@1.
