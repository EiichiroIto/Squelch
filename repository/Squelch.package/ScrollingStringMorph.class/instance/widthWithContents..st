private
widthWithContents: aString
	"Answer how wide I would need to be to fit the given string on a single line."

	^ (renderer stringWidth: aString) + self textInset x + borderWidth + scrollbar width + 3
