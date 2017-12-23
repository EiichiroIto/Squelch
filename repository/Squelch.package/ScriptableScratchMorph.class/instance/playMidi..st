sound ops
playMidi: fileName
	"Play the midi file with the given name."

	| fname score player |
	fname := fileName, '.mid'.
	(FileDirectory default fileExists: fname) ifFalse: [^ self].
	score := (MIDIFileReader scoreFromFileNamed: fname).
	player := ScorePlayer onScore: score.
	player openMIDIPort: 0.
	player play.
