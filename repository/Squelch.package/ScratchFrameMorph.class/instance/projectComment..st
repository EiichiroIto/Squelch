view mode
projectComment: aString

	aString = DefaultNotes ifTrue: [
		projectInfo removeKey: 'comment' ifAbsent: [].
		^ self].

	projectInfo at: 'comment' put: aString asString.
