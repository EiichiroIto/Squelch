media
recordSound

	| frame |
	frame := self meOrOwnerThatIsA: ScratchFrameMorph.
	frame ifNil: [^ self beep].
	frame stopAll.
	World submorphs do: [:m |
		(m isKindOf: ScratchSoundRecorderDialogMorph) ifTrue: [m delete]].

	ScratchSoundRecorderDialogMorph forClient: self.

