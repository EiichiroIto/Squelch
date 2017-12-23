server control
stepServer
	"Do one server step."
	"Note: processIncomingCommands clears outgoingBroadcasts, so do sendOutgoingCommands first."

	self sessionInProgress ifFalse: [^ self].
	self acceptNewConnections.
	self sendOutgoingCommands.
	self processIncomingCommands.
	self processIncomingBroadcasts.

