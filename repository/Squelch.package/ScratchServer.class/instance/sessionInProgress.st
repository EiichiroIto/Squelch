server control
sessionInProgress
	"Answer true if this Scratch server has any external connections."

	^ (peerSockets size > 0) | (serverSocket notNil)

