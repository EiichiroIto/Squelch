motor ops
setPower: aNumber motor: motorNum
	"Set the power of the given motor to 0 to 7."

	| power msg |
	self portIsOpen ifFalse: [^ self].
	self selectMotor: motorNum.
	power := (aNumber truncated max: 0) min: 7.
	msg := #(84 254 0) asByteArray.
	msg at: 3 put: 96 + (power bitShift: 2).
	port nextPutAll: msg.
