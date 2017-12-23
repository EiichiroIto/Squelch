server control
shutdownServer
	"Destroy all open sockets."

	serverSocket ifNotNil: [
		serverSocket destroy.
		serverSocket := nil].

	incomingUDPSocket ifNotNil: [
		incomingUDPSocket destroy.
		incomingUDPSocket := nil].

	peerSockets do: [:sock | sock destroy].
	peerSockets := peerSockets species new.

	peerNames := peerNames species new.
	sensors := sensors species new.
	lastSentValues := lastSentValues species new.
	outgoingBroadcasts := outgoingBroadcasts species new.
