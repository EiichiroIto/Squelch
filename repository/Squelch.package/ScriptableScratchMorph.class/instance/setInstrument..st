sound ops
setInstrument: aNumber
	"New 'set instrument to _' block. Set the instrument used for note sounds. Testing in beta but reverted."

	| stage map n player |
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ self].
	map := #(1 30 25 35).
	n := aNumber asNumberNoError asInteger.
	(n between: 1 and: map size)
		ifTrue: [n := map at: n]
		ifFalse: [n := 1].
	(player := stage notePlayerFor: self) ifNotNil: [
		player instrument: n].
