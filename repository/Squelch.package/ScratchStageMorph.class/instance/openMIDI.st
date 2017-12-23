midi
openMIDI
	"Prompt the user to select a MIDI port number, then open it."

	| possiblePorts dir menu choice |
	self closeMIDI.
	possiblePorts := (0 to: SimpleMIDIPort primPortCount - 1) select: [:i |
		dir := SimpleMIDIPort primPortDirectionalityOf: i.
		(dir = 2) | (dir = 3)].  "out or in/out port"
	possiblePorts size = 0 ifTrue: [^ self inform: 'No MIDI ports currently available.'].
	menu := CustomMenu new title: 'MIDI port:'.
	possiblePorts do: [:i | menu add: (SimpleMIDIPort portDescription: i) action: i].
	choice := menu startUp.
	choice ifNil: [^ self].
	midiPortNum := choice.
	self tryToOpenMidiPort.
