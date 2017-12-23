midi
tryToOpenMidiPort
	"Attempt to open the MIDI port. First try the port selected by the user, if any. If that port number is not a MIDI output port, try to find another port number. If all measures fail, leave midiPort set to nil."

	| possiblePorts dir portNum |
	SimpleMIDIPort midiIsSupported ifFalse: [midiPort := nil. ^ self].

	possiblePorts := (0 to: SimpleMIDIPort primPortCount - 1) select: [:i |
		dir := SimpleMIDIPort primPortDirectionalityOf: i.
		(dir = 2) | (dir = 3)].  "out or in/out port"

	possiblePorts size = 0 ifTrue: [midiPort := nil. ^ self].  "no midi ports"


	(possiblePorts includes: midiPortNum)
		ifTrue: [portNum := midiPortNum]  "use the port requested by the user"
		ifFalse: [portNum := possiblePorts first].  "use the first available port"
	
	midiPort := SimpleMIDIPort openOnPortNumber: portNum.	
	self assert: midiPort notNil.
	midiPort ensureOpen.
	"[midiPort := SimpleMIDIPort openOnPortNumber: portNum] ifError: [midiPort := nil]."
