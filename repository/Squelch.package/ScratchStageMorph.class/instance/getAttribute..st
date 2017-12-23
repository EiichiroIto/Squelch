sensing ops
getAttribute: attr
	"Answer the value of my variable or built-in attribute with the given name. Answer zero if I have no attribute or variable with the given name."

	| a |
	(vars includesKey: attr) ifTrue: [^ vars at: attr].

	a := attr localized.
	'background #' localized = a ifTrue: [^ self backgroundIndex].
	'volume' localized = a ifTrue: [^ self volume].
	^ 0
