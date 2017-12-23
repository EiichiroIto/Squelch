operations
isNumber: aString

	| n |
	aString size = 0 ifTrue: [^ false].
	('-.0123456789' includes: aString first) ifFalse: [^ false].
	n := [aString asNumber] ifError: [nil].
	n ifNil: [^ false].
	^ n printString = aString
