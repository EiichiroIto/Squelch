private-server
processIncomingCommands
	"Process incoming commands from my peers."

	peerSockets copy do: [:sock |
		sock isConnected
			ifTrue: [
				self processCommandFrom: sock.
				sock sendData]
			ifFalse: [
				sock destroy.
				peerSockets remove: sock ifAbsent: []]].

	self processUDPCommands.
