private
rand
	"This is a cheap, integer random generator from the old Apple Smalltalk. It's not statistically good, but it is very fast. Answers an integer between 0 and 65535."

	randSeed ifNil: [randSeed := Time millisecondClockValue bitAnd: 65535].
	randSeed := (13849 + (27181 * randSeed)) bitAnd: 65535.
	^ randSeed
