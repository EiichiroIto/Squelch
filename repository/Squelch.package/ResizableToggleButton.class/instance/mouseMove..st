event handling
mouseMove: evt

	actWhen = #buttonDown ifTrue: [^ self].
	(self containsPoint: evt cursorPoint)
		ifTrue: [self on]
		ifFalse: [self off].

