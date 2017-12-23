private
spriteNameInUse: aString

	| s |
	(s := self meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [
		s submorphs do: [:m |
			m == self ifFalse: [
				((m isKindOf: ScriptableScratchMorph) and:
				 [(m objName compare: aString) = 2]) ifTrue: [
					^ true]]]].

	^ false
