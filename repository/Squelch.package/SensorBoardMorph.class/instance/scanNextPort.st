serial port
scanNextPort
	"Called during port scanning. The current port does not seem to be a ScratchBoard. Close it and try the next port in the list."

	self closePort.
	scanState := #start.
