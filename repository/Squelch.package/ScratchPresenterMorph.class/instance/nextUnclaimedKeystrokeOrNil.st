event handling
nextUnclaimedKeystrokeOrNil
	"Answer the next unclaimed keystroke from the buffer or nil if there isn't one."

	(unclaimedKeystrokes isNil or: [ unclaimedKeystrokes size = 0 ])
		ifTrue: [ ^ nil ]
		ifFalse: [ ^ unclaimedKeystrokes removeFirst ]