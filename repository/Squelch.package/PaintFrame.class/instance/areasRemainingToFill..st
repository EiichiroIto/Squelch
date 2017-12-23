drawing
areasRemainingToFill: aRectangle
	"Drawing optimization. If damage is within my bounds, don't drawn anything below me."

	((bounds insetBy: 15) containsRect: aRectangle)
		ifTrue: [^ #()]
		ifFalse: [^ Array with: aRectangle].

