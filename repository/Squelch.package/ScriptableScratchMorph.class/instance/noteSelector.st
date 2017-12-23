sound ops
noteSelector
	"Returns an instance of a ScratchNoteSelector for selecting notes. This object behaves like a CustomMenu."

	| stageMorph notePlayer |
	stageMorph := (self meOrOwnerThatIsA: ScratchStageMorph).
	stageMorph ifNil: [^ self midiNoteMenu].
	notePlayer := stageMorph notePlayerFor: self.
	notePlayer ifNil: [^ self midiNoteMenu].

	^ ScratchNoteSelector new setNotePlayer: notePlayer
