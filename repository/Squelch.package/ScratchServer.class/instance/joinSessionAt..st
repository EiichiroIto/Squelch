server control
joinSessionAt: ipAddressString
	"Add an outgoing connection to the given address. Fail if a connection cannot be made in bounded amount of time. Answer true if the connection was added successfully."

	| addr sock ok |
	addr := NetNameResolver addressForName: ipAddressString timeout: 5.
	sock := MessageSocket new.
	ok := sock connectTo: addr port: ScratchServer portNumber waitSecs: 5.
	ok ifFalse: [sock destroy. ^ false].

	sock sendMessage: 'peer-name ', userName.
	peerSockets add: sock.
	^ true
