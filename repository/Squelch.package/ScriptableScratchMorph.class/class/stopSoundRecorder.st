other
stopSoundRecorder
	"Stop the shared sound recorder."
	"self stopSoundRecorder"

	Recorder ifNotNil: [Recorder stopRecording; clearRecordedSound].

