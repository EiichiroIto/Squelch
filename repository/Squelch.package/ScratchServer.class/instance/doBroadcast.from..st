private-incoming commands
doBroadcast: cmd from: requestSocket
	"Handle a broadcast command: broadcast <event-name>"

	| evtName |
	cmd size = 2 ifFalse: [^ self].
	((evtName := cmd at: 2) isKindOf: String) ifFalse: [^ self].

	incomingBroadcasts add: evtName.
	broadcastCache add: evtName.
