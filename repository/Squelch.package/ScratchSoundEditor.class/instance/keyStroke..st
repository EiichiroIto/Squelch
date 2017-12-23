event handling
keyStroke: evt

	| keyVal |
	keyVal := evt keyCharacter asciiValue.

	keyVal = 28 ifTrue: [ cursor := cursor + (( -10) / graph scale)].
	keyVal = 29 ifTrue: [ cursor := cursor + (10/graph scale)].