private-server
sendOutgoingCommands
	"Send broadcasts and variable updates to my peers."

	| varUpdateMsg |
	self someVariableHasChanged
		ifTrue: [varUpdateMsg := self variableUpdateMessage]
		ifFalse: [varUpdateMsg := nil].

	peerSockets copy do: [:sock |
		sock isConnected
			ifTrue: [
				varUpdateMsg ifNotNil: [sock sendMessage: varUpdateMsg].
				outgoingBroadcasts do: [:evt | sock sendMessage: (self broadcastMessageFor: evt)].
				sock sendData]
			ifFalse: [
				sock destroy.
				peerSockets remove: sock ifAbsent: []]].

	self recordVariableValues.

