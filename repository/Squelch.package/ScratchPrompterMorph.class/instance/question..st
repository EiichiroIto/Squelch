accessing
question: aString

	questionMorph := StringMorph new
		contents: aString;
		font: (ScratchFrameMorph getFont: #DialogBoxButton).

	self addMorph: questionMorph.
	self height: questionMorph height + typeinMorph height + 16.
