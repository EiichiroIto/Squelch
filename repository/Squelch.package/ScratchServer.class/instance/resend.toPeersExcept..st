private-incoming commands
resend: msgString toPeersExcept: requestSocket
	"Handle a broadcast command: broadcast <event-name>"

	peerSockets do: [:sock |
		sock ~= requestSocket ifTrue: [sock sendMessage: msgString]].
