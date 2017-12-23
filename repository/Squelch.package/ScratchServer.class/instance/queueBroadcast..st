private-server
queueBroadcast: aString
	"Queue the given broadcast event to be sent to my peers."

	self sessionInProgress ifFalse: [^ self].

	(#(	'Scratch-KeyPressedEvent'
		'Scratch-MouseClickEvent'
		'Scratch-StartClicked'
	) includes: aString) ifTrue: [^ self].

	outgoingBroadcasts add: aString.
