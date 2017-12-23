motor ops
thatWayMotor: motorNum
	"Set motor direction to that way."

	self portIsOpen ifFalse: [^ self].
	self selectMotor: motorNum.
	port nextPutAll: #(84 254 80) asByteArray.
