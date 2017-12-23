language translation
parameterSpecs: aString
	"Answer the sequence of parameter specs (e.g. %n) for the given block specification. Used for checking translations."
	"self parameterSpecs: 'this %b is %s a %c test %n%'"
	"self parameterSpecs: 'this %b'"
	"self parameterSpecs: 'this %'"
	"self parameterSpecs: 'this'"

	| result i |
	result := OrderedCollection new.
	i := 1.
	[i < aString size] whileTrue: [
		i := aString indexOf: $% startingAt: i.
		i = 0 ifTrue: [i := aString size].  "% not found"
		i < aString size ifTrue: [
			result addLast: (aString copyFrom: i to: i + 1)].
		i := i + 2].

	^ result asArray
