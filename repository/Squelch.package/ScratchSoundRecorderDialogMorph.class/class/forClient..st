instance creation
forClient: aScriptableScratchMorph
	"SoundRecorderDialogMorph forClient: "

	| dialog |
	dialog := super new
		withButtonsForYes: false no: false okay: true cancel: true;
		client: aScriptableScratchMorph;
		title: 'Sound Recorder'.
	^ dialog getUserResponse