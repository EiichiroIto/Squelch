accessing
categoryChanged: aString
	"If the given category is my current category, update my contents. Otherwise, do nothing."

	self target ifNil: [^ self].
	currentCategory = aString ifTrue: [self currentCategory: aString].
