private-server
processUDPCommands
	"Process incoming UDP commands."

	| buf n msg |
	incomingUDPSocket ifNil: [^ self].
	buf := String new: 3000.
	[true] whileTrue: [
		n := [incomingUDPSocket receiveDataInto: buf] ifError: [0].
		n = 0 ifTrue: [^ self].

		msg := buf copyFrom: 1 to: n.
		[self dispatch: msg from: nil] ifError: []].
