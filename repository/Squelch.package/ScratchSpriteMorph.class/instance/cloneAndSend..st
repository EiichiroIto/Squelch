clone ops
cloneAndSend: msgName
	"Clone this sprite and send the clone (and only the clone) the given message."

	| frame clone |
	(frame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ self].

	clone := self fullCopy.
	clone objName: objName, ' clone'.
	clone isClone: true.
	clone blocksBin allMorphsDo: [:m |
		(m isKindOf: BlockMorph) ifTrue: [m stop]].

	frame workPane addMorph: clone.
	clone eventReceived: (ScratchEvent new name: msgName asString argument: 0).
