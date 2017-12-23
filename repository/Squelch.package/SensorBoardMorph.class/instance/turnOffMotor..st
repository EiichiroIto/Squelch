motor ops
turnOffMotor: motorNum

	self portIsOpen ifFalse: [^ self].
	self selectMotor: motorNum.
	port nextPutAll: #(84 254 68) asByteArray.
