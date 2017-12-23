class initialization
setLabelFont
	"BlockMorph setLabelFont"

	| menu fName fSize |
	menu := CustomMenu new.
	StrikeFont fontNames do: [:fn | menu add: fn action: fn].
	menu addLine.
	menu add: 'normal' action: #normal.
	(fName := menu startUp) ifNil: [^ self].

	#normal = fName ifTrue: [
		LabelFont := StrikeFont fontName: 'VerdanaBoldNarrowSpace' size: 10.
		^ self].

	menu := CustomMenu new.
	(StrikeFont sizesForFontName: fName) do: [:sz | menu add: sz printString action: sz].
	(fSize := menu startUp) ifNil: [^ self].
	LabelFont := StrikeFont fontName: fName size: fSize.
