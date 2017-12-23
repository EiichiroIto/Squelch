other
soundRecorder
	"Return the shared Scratch SoundRecorder. Create and start it, if necessary."

	Recorder ifNil: [
		Recorder := SoundRecorder new.
		Recorder startRecording].
	Recorder isActive ifFalse: [Recorder startRecording].
	^ Recorder
