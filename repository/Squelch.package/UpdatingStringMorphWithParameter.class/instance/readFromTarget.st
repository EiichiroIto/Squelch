target access
readFromTarget
	| v |
	(target isNil or: [ getSelector isNil ])
		ifTrue: [ ^ contents ].
	getSelector numArgs = 1
		ifFalse: [ ^ super readFromTarget ].
	v := target perform: getSelector with: parameter.
	(v isKindOf: Text)
		ifTrue: [ v := v asString ].
	^ self acceptValueFromTarget: v