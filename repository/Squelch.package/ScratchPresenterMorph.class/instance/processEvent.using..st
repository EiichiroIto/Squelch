event handling
processEvent: anEvent using: defaultDispatcher
	(self rejectsEvent: anEvent)
		ifTrue: [ ^ #rejected ].
	anEvent isKeyboard
		ifTrue: [ ^ self recordUnclaimedKeystroke: anEvent ].
	^ defaultDispatcher dispatchEvent: anEvent with: self