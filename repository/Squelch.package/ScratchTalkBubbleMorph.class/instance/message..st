accessing
message: aString
	"(ScratchTalkBubbleMorph new message: 'Hello!') openInWorld"

	| maxWidth xOffset |
	maxWidth := 145.
	contentsMorph
		width: maxWidth;
		contents: aString trimBoth;
		fitContents.

	self extent: contentsMorph extent + (0@28).
	xOffset := contentsMorph width >= maxWidth
		ifTrue: [3]
		ifFalse: [((self width - contentsMorph width) // 2) + 3].
	contentsMorph position: self position + (xOffset @ 5).
