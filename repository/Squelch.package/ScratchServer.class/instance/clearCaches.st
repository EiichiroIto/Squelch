server control
clearCaches

	broadcastCache := broadcastCache species new.
	sensors := sensors species new.
	lastSentValues := lastSentValues species new.
	self resend: 'send-vars' toPeersExcept: nil.
