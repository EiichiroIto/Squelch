server control
endScratchSession
	"Close all sockets. If I am hosting, this will end the session for everyone. If I am only a client, then I will leave the session but the session itself can continue to exist."

	self shutdownServer.

