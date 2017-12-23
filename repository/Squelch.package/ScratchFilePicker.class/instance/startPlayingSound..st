accessing
startPlayingSound: fullName
	"Attempt to play the sound with given name."

	self stopPlayingSound.

	(fullName asLowercase endsWith: '.mp3')
		ifTrue: [sound := [StreamingMP3Sound onFileNamed: fullName] ifError: [nil]]
		ifFalse: [sound := [SampledSound fromFileNamed: fullName] ifError: [nil]].

	sound ifNotNil: [
		(sound respondsTo: #volume:) ifTrue: [sound volume: 1.0].
		sound play].
