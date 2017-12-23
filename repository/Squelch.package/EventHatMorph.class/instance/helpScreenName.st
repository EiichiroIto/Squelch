other
helpScreenName
	"Answer the name of the help screen for this hat block, or nil if no help is available."

	(self isKindOf: MouseClickEventHatMorph) ifTrue: [^ 'mouseclickHat'].
	(self isKindOf: KeyEventHatMorph) ifTrue: [^ 'keyHat'].
	self eventName = 'Scratch-StartClicked'
		ifTrue: [^ 'startHat']
		ifFalse: [^ 'broadcastHat'].

	^ nil
