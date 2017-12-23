private-server
acceptNewConnections
	"Accept new connections, if any. Also process any newly connected outgoing sockets."

	| newSock |
	serverSocket ifNil: [^ self].
	[serverSocket isConnected] whileTrue: [
		newSock := serverSocket accept.
		peerSockets addLast: (MessageSocket new on: newSock).
		self resendAllVars].
