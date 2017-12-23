private-incoming commands
processCommandFrom: requestSock
	"Handle a command from the given socket. Do nothing if there are no messages."

	| msg |
	(msg := requestSock nextMessage) ifNil: [^ self].

	[self dispatch: msg asString from: requestSock]
		ifError: [:err :rcvr | err].
