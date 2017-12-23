sensing ops
promptInProgress

	| s |
	(s := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ false].
	s submorphsDo: [:m |
		(m isKindOf: ScratchPrompterMorph) ifTrue: [^ true]].
	^ false
