motor ops
selectMotor: anInteger
	"Select the motor to which subsequent motor commands will be addressed. Motors are numbered 1-6."

	| motorNum msg |
	motorNum := (anInteger truncated - 1 max: 0) min: 7. "motor bit index"
	msg := #(84 254 128 0) asByteArray.
	msg at: 4 put: (1 bitShift: motorNum).
	port nextPutAll: msg.
