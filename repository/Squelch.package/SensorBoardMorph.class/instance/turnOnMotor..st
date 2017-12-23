motor ops
turnOnMotor: motorNum

	self portIsOpen ifFalse: [^ self].
	self selectMotor: motorNum.
	port nextPutAll: #(84 254 64) asByteArray.
