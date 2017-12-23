event handling
textHandleContainsPoint: aPoint
	"Answer true if the the text handle contains the given point in canvas coordinates."

	#text = palette mode ifFalse: [^ false].
	^ (textBox topLeft - 5 extent: 9@9) containsPoint: aPoint
