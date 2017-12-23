private
offsetForLine: lineIndex
	"Answer the offset from my origin to the start of the line with the given index, taking RTL into account."

	| top w |
	top := self textInset y + (lineHeight * (lineIndex - firstVisibleLine)).
	ScratchTranslator isRTL
		ifTrue: [
			w := renderer stringWidth: (lines at: lineIndex).
			^ (self width - (self textInset x + w + scrollbar width)) @ top]
		ifFalse: [^ self textInset x @ top].
