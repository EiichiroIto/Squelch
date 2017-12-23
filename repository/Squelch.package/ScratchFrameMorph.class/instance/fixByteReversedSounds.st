file read/write
fixByteReversedSounds
	"See if the current project contains any byte-reversed copies of one of the standard sounds. If it does, byte-reverse all sounds. This is a workaround for a bug in Scratch 1.0 that did not upload sounds in big-endian order."

	| allSoundBuffers badMeowPrefix badPopPrefix foundBadSound |
	allSoundBuffers := IdentitySet new.
	self allProjectMedia do: [:media |
		media isSound ifTrue: [
			allSoundBuffers add: media sound samples]].
	allSoundBuffers remove: ScriptableScratchMorph meowSound samples ifAbsent: [].
	allSoundBuffers remove: ScriptableScratchMorph popSound samples ifAbsent: [].

	badMeowPrefix := ScriptableScratchMorph oldMeowPrefixReversed.
	badPopPrefix := (ScriptableScratchMorph popSound samples copyFrom: 1 to: 100) reverseEndianness.
	foundBadSound := false.
	allSoundBuffers do: [:buf |
		foundBadSound ifFalse: [
			((buf beginsWith: badMeowPrefix) or:
			 [buf beginsWith: badPopPrefix])
				ifTrue: [foundBadSound := true]]].

	foundBadSound ifTrue: [
		allSoundBuffers do: [:buf | buf reverseEndiannessStereo: false]].
