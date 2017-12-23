event handling
textSizeMenu

	| menu font sizeList choice oldFont newFont |
	menu := CustomMenu new.
	font := canvasMorph canvasTextBox font.
	font isOSFont
		ifTrue: [sizeList := #(8 9 10 12 14 18 24 36 48 60 72 96 120 144 216 288)]
		ifFalse: [sizeList := StrikeFont sizesForFontName: font name].

	sizeList size = 0 ifTrue: [^ self beep].  "should not happen"
	sizeList do: [:n | menu add: n printString action: n].
	choice := menu startUp.
	choice ifNil: [^ self].

	textSizeMorph contents: choice asString.
	oldFont := canvasMorph canvasTextBox font.
	oldFont isOSFont
		ifTrue: [newFont := StrikeFont osFontName: font name size: choice]
		ifFalse: [newFont := StrikeFont fontName: font name size: choice].

	canvasMorph canvasTextBox font: newFont.
	canvasMorph changed.