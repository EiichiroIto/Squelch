sensing ops
mouseY

	| s centerY |
	DoubleSize ifTrue: [^ (Sensor cursorPoint y - ScratchOrigin y) negated // 2].

	self inPresentationMode ifFalse: [
		s := self meOrOwnerThatIsA: ScratchStageMorph.
		(s notNil and: [s isQuarterSize]) ifTrue: [
			centerY := s top + (s height // 4).
			^ -2 * (Sensor cursorPoint y - centerY)]].

	^ (Sensor cursorPoint y - ScratchOrigin y) negated
