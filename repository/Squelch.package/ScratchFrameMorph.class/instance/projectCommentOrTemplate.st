accessing
projectCommentOrTemplate

	| s |
	s := projectInfo at: 'comment' ifAbsent: [''].
	s size = 0 ifTrue: [s := DefaultNotes].
	^ s
