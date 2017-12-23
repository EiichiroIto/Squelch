private-incoming commands
dispatch: aString from: requestSock
	"Dispatch an incoming command from a remote Scratch."

	| cmd op |
	aString size = 0 ifTrue: [
		requestSock sendMessage: 'version "ScratchServer 2.0 alpha"'.
		^ self].

	op := self opcodeFrom: aString.
	op size = 0 ifTrue: [^ self].

	(#('broadcast' 'sensor-update' 'peer-name' 'send-vars') includes: op) ifFalse: [^ self].

	cmd := self parse: aString.

	'broadcast' = op ifTrue: [
		self doBroadcast: cmd from: requestSock.
		^ self resend: aString toPeersExcept: requestSock].

	'sensor-update' = op ifTrue: [
		self doSensorUpdate: cmd from: requestSock.
		^ self resend: aString toPeersExcept: requestSock].

	'peer-name' = op ifTrue: [^ self doPeerName: cmd from: requestSock].

	'send-vars' = op ifTrue: [
		self doSendVars: cmd from: requestSock.
		^ self resend: aString toPeersExcept: requestSock].

