sensing ops
getAttribute: attr
	"Answer the value of my variable or built-in attribute with the given name. Answer zero if I have no attribute or variable with the given name."

	| a |
	(vars includesKey: attr) ifTrue: [^ vars at: attr].

	a := attr localized.
	'x position' localized = a ifTrue: [^ self xpos].
	'y position' localized = a ifTrue: [^ self ypos].
	'direction' localized = a ifTrue: [^ self heading].
	'costume #' localized = a ifTrue: [^ self costumeIndex].
	'size' localized = a ifTrue: [^ self scale].
	'volume' localized = a ifTrue: [^ self volume].
	^ 0
