private
labelWhenClosed
	"Answer the label string to used when the comment is closed."

	| maxW firstLine ellipses s w |
	maxW := self width - 22.
	firstLine := commentMorph lines at: 1.
	(labelMorph stringWidth: firstLine) < maxW ifTrue: [^ firstLine].
	ellipses := ScratchTranslator ellipsesSuffix.

	1 to: firstLine size do: [:i |
		s := firstLine copyFrom: 1 to: i.
		w := labelMorph stringWidth: s, ellipses.
		w > maxW ifTrue: [
			^ (firstLine copyFrom: 1 to: i - 1), ellipses]].

	^ firstLine

