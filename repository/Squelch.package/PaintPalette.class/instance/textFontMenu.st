event handling
textFontMenu

	| useOSFont fontList lcName menu choice fontSize font |
	useOSFont := true.
	fontList := UnicodePlugin getFontList.
	fontList size = 0 ifTrue: [
		useOSFont := false.
		fontList := StrikeFont fontNames reject: [:fn |
			lcName := fn asLowercase.
			(lcName includesSubString: 'arial') |
			(lcName includesSubString: 'helvetica') |
			(lcName includesSubString: 'narrowspace') |
			(lcName includesSubString: 'newyork')]].

	menu := CustomMenu new.
	fontList do: [:n | menu add: n asString action: n].
	choice := menu startUp.
	choice ifNil: [^ self].

	fontSize := textSizeMorph contents asNumber.
	useOSFont
		ifTrue: [font := StrikeFont osFontName: choice size: fontSize]
		ifFalse: [font := StrikeFont fontName: choice size: fontSize].

	canvasMorph canvasTextBox font: font.
	self updateOptionsPane.
	canvasMorph changed.

