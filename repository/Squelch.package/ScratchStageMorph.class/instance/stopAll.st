scratch processes/events
stopAll
	"Stop all processes and make sure I am stepping."

	| sFrame |
	World hands do: [:h | h newKeyboardFocus: nil].
	owner clearUnclaimedKeystrokes.
	HandMorph clearKeyState.
	SoundPlayer stopPlayingAll.
	self class stopSoundRecorder.
	self stopAllProcesses.
	self stopAsks.
	self deleteAllClones.
	self midiAllNotesOff.
	"WeDoPlugin resetWeDo."
	self stopPlaying.
	self allMorphsDo: [:m |
		(m isKindOf: ScriptableScratchMorph) ifTrue: [m stopPlaying]].

	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNotNil: [
		sFrame scriptsPane allMorphsDo: [:m |
			(m respondsTo: #stop) ifTrue: [m stop].
			(m respondsTo: #litUp:) ifTrue: [m litUp: false]].
		World startSteppingSubmorphsOf: sFrame].

	World startSteppingSubmorphsOf: self.
