server control
startHosting
	"Open a socket on my port and start accepting connections."

	Socket initializeNetwork.
	self shutdownServer.

	serverSocket := Socket new.
	serverSocket listenOn: self class portNumber backlogSize: 20.

	incomingUDPSocket := Socket newUDP setPort: self class portNumber.
