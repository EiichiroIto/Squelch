sound ops
midiInstrument: aNumber
	"Old 'set instrument to _' block. Set the MIDI instrument used for note sounds."

	| stage player |
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ self].
	(player := stage notePlayerFor: self) ifNotNil: [
		player instrument: aNumber].
