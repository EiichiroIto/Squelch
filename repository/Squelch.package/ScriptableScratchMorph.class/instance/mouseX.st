sensing ops
mouseX

	| s centerX |
	DoubleSize ifTrue: [^ (Sensor cursorPoint x - ScratchOrigin x) // 2].

	self inPresentationMode ifFalse: [
		s := self meOrOwnerThatIsA: ScratchStageMorph.
		(s notNil and: [s isQuarterSize]) ifTrue: [
			centerX := s left + (s width // 4).
			^ 2 * (Sensor cursorPoint x - centerX)]].

	^ Sensor cursorPoint x - ScratchOrigin x
