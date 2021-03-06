private
offsetForLine: lineIndex
	"Answer the offset from my origin to the start of the line with the given index, taking RTL into account."

	| top |
	top := self insetY + (lineHeight * (lineIndex - 1)).
	ScratchTranslator isRTL
		ifTrue: [^ (self width - (self insetX + (renderer stringWidth: (lines at: lineIndex)))) @ top]
		ifFalse: [^ self insetX @ top].
