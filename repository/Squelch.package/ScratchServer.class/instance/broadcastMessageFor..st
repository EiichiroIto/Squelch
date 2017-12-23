private-variables
broadcastMessageFor: aString
	"Answer a message to broadcast the given string."

	| msg |
	msg := WriteStream on: String new.
	msg nextPutAll: 'broadcast '.
	self putString: aString on: msg.

	^ msg contents
