sound ops
rewindSound: soundName
	"Rewind the given sound."

	| snd |
	snd := self soundNamed: soundName ifAbsent: [^ self].
	snd rewindSound.
