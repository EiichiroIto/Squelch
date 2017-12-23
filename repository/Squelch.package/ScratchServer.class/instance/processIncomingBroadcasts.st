private-server
processIncomingBroadcasts
	"NOTE: Broadcast events are added to the outgoingBroadcasts queue as a side-effect of re-broadcasting them locally. To avoid having broadcasts bounce from peer to peer forever, the outgoingBroadcasts queue is cleard after incoming commands have been processed."

	stage ifNotNil: [
		incomingBroadcasts do: [:evtName |
			stage broadcastEventNamed: evtName with: 0]].

	incomingBroadcasts := incomingBroadcasts species new: 100.
	outgoingBroadcasts := outgoingBroadcasts species new: 100.
