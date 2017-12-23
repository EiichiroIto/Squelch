menu
fontMenu

	| menu fName fSize |
	menu := CustomMenu new.
	StrikeFont fontNames do: [:fn | menu add: fn action: fn].
	(fName := menu startUp) ifNil: [^ self].

	menu := CustomMenu new.
	(StrikeFont sizesForFontName: fName) do: [:sz | menu add: sz printString action: sz].
	(fSize := menu startUp) ifNil: [^ self].
	self font: (StrikeFont fontName: fName size: fSize).
	self changed.

