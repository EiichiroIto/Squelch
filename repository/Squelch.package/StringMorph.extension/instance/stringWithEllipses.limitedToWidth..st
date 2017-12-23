*Squelch
stringWithEllipses: aString limitedToWidth: aNumber
	"Answer the given string limited in width. If the string is too wide to fit, truncate it and append ellipses."

	| ellipses maxW s w |
	ellipses := ScratchTranslator ellipsesSuffix.
	maxW := aNumber - (self stringWidth: ellipses) max: 10.
	s := aString.
	(self stringWidth: s) < maxW
		ifTrue: [ ^ aString ].
	1 to: s size do: [ :i | 
		w := self stringWidth: (s copyFrom: 1 to: i) , ellipses.
		w > maxW
			ifTrue: [ ^ (s copyFrom: 1 to: i - 1) , ellipses ] ].
	^ aString