other
justDroppedInto: aMorph event: evt

	| r |
	super justDroppedInto: aMorph event: evt.
	owner = World ifFalse: [^ self].

	r := self bounds intersect: World bounds.
	(r width > 50) & (r height > 50) ifFalse: [  "almost off the screen; re-center"
		self position: World bounds center - (self extent // 2).
		self bottom > World bottom ifTrue: [self top: World bottom - (self height - 20)]].
