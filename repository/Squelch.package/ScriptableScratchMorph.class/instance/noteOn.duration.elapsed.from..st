sound ops
noteOn: midiKey duration: beats elapsed: elapsedMSecs from: aNotePlayer

	| stage player |
	aNotePlayer ifNil: [  "first call, start playing the note"
		(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ ScratchNotePlayer new].
		(player := stage notePlayerFor: self) ifNil: [^ ScratchNotePlayer new].
		^ player copy noteOn: midiKey].

	elapsedMSecs >= ((60000 * beats) // self tempo) ifTrue: [aNotePlayer noteOff].
