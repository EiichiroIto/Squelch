accessing
stopPlayingSound
	"If I am playing a sound, stop it."

	sound ifNotNil: [sound pause].
	sound := nil.
