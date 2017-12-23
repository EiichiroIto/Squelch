sound ops
drum: midiKey duration: beats elapsed: elapsedMSecs from: aNotePlayer

	| stage player |
	aNotePlayer ifNil: [  "first call, start playing the drum"
		(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ ScratchNotePlayer new].
		(player := stage notePlayerFor: self) ifNil: [^ ScratchNotePlayer new].
		^ player copy drumOn: midiKey].

	elapsedMSecs >= ((60000 * beats) // self tempo) ifTrue: [aNotePlayer drumOff].
