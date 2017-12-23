initialization
initialize

	super initialize.

	self makeModeButtonsPane.
	self makeRecordMeter.
	self makeRecordTimer.

	recorder := ScriptableScratchMorph soundRecorder stopRecording.
	recorder recordLevel: 0.5.
	savedMeterLevels := OrderedCollection new.
	curStep := 1.
	
	duration := 0.
	self setMode: #stop.
	self setMode: #play isDisabled: true.

	"fixes layout"
	mainColumn wrapCentering: #topLeft.
	self extent: 380@145.
