private-incoming commands
doPeerName: cmd from: requestSock
	"Handle a peer-name command: peer-name <peerName>"

	| peerName |
	cmd size = 2 ifFalse: [^ self].
	((peerName := cmd at: 2) isKindOf: String) ifFalse: [^ self].

	peerNames at: requestSock put: peerName.
	self dispatch: 'send-vars' from: nil.
