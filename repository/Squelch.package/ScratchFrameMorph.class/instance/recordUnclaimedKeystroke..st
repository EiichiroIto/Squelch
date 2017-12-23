event handling
recordUnclaimedKeystroke: evt
	unclaimedKeystrokes ifNil: [ unclaimedKeystrokes := OrderedCollection new ].
	unclaimedKeystrokes addLast: evt.
	[ unclaimedKeystrokes size > 10 ] whileTrue: [ unclaimedKeystrokes removeFirst ]