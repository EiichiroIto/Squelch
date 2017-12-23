accessing
objName: aString

	"don't allow renaming a sprite to use a name already in use"
	(self spriteNameInUse: aString) ifTrue: [^ self].
	objName := aString.
	objName size = 0 ifTrue: [objName := self nextInstanceName].
