private
updateLockButton

	lockButton ifNil: [^ self].
	self target draggable
		ifTrue: [lockButton off]
		ifFalse: [lockButton on].
