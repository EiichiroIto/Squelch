motor ops
coastToStopMotor: motorNum
	"Let the given motor coast to a stop."

	self portIsOpen ifFalse: [^ self].
	self selectMotor: motorNum.
	port nextPutAll: #(84 254 84) asByteArray.
