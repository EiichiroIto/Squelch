stepping
step
	"Update my title and sensor readouts. If scanning for ports, keep scanning."

	| frame |
	#checkData = scanState ifTrue: [self scanForPort].

	self portIsOpen
		ifTrue: [self processIncomingData]
		ifFalse: [port := nil].

	self updateTitle.

	1 to: 8 do: [:i |
		(readouts at: i) contents: (self privateSensor: i) truncated printString.
		(scratchBoardV3 and: [i = 4])
			ifTrue: [(readouts at: i) contents: ((self privateSensor: i) < 10) printString]. "button"
		frame := (readouts at: i) owner.
		(frame respondsTo: #fixLayout) ifTrue: [frame fixLayout]].
