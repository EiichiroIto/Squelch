utilities
getIPAddressFromServer
	"Attempt to get my IP address from the AddressServer in bounded time. Returns nil if unsuccessful."
	"[self getIPAddressFromServer] msecs"

	| serverAddr sock msg |
	serverAddr := #(18 85 18 78) asByteArray.
	sock := MessageSocket new.
	sock connectTo: serverAddr port: 54330 waitSecs: 4.
	sock isConnected ifFalse: [^ nil].
	sock sendMessage: 'lookup'.
	20 timesRepeat: [
		sock sendData.
		(msg := sock nextMessage) ifNotNil: [sock destroy. ^ msg].
		Delay waitMSecs: 100].

	"timed out"
	sock destroy.
	^ nil
