menu/button actions
joinScratchSession
	"Join another Scratch user or a Scratch-compatible remote application."

	| server addrString ok |
	server := ScratchServer new.
	server stage: workPane.
	workPane scratchServer: server.

	addrString := StringDialog askWithCancel: 'IP address:'.
	addrString size = 0 ifTrue: [^ self].

	ok := workPane scratchServer joinSessionAt: addrString.
	ok ifFalse: [DialogBoxMorph warn: 'Could not connect to ', addrString].
