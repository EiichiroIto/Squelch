initialization
initialize

	userName := 'anonymous'.
	peerSockets :=  OrderedCollection new.
	peerNames := IdentityDictionary new.
	sensors := Dictionary new.
	lastSentValues := Dictionary new.
	incomingBroadcasts := OrderedCollection new.
	outgoingBroadcasts := OrderedCollection new.
	broadcastCache := Set new.
