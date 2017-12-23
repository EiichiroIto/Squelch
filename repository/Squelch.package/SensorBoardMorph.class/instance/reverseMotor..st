motor ops
reverseMotor: motorNum
	"Reverse the direction of the given motor."

	self portIsOpen ifFalse: [^ self].
	self selectMotor: motorNum.
	port nextPutAll: #(84 254 72) asByteArray.
