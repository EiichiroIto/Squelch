stepping
step

	| s |
	super step.
	isKeyboardFocus ifTrue: [^ self]. "do not update if user is editing"
	(target notNil & getSelector notNil) ifFalse: [^ self].

	s := target perform: getSelector.
	s = self contents ifFalse: [self contents: s].
