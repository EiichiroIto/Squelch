motor ops
thisWayMotor: motorNum
	"Set motor direction to this way."

	self portIsOpen ifFalse: [^ self].
	self selectMotor: motorNum.
	port nextPutAll: #(84 254 76) asByteArray.
