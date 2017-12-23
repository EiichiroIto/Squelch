serial port
portNames
	"Answer a collection of possible port names for the Scratch sensor board. Filter out modems and PDA cradles."

	ScratchPlugin serialPortOpsAvailable ifFalse: [
		^ (1 to: 32) collect: [:i | 'COM', i printString]].

	^ SerialPort2 portNames reject: [:n |
		(n asLowercase includesSubString: 'modem') or:
		[n asLowercase includesSubString: 'pda-sync']].
