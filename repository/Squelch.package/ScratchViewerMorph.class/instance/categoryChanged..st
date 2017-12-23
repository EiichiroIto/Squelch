accessing
categoryChanged: aString
	"The given category has changed (e.g., due to a variable or script add/remove). If it's the current category, update my contents. Otherwise, do nothing."

	self target ifNil: [^ self].
	currentCategory = aString ifTrue: [self updateContents].
