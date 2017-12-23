menu/button actions
fillScreenOn
	"Start filling the entire screen and being sticky. Also configure a few other things for the end user such as turning off halos and the control menu (noviceMode) and making sure that error catching is enabled."

	TakeOverScreen ifTrue: [
		Display fullscreenOn.
		World restoreDisplay].

	fillScreenFlag := true.
	self position: 0@0.
	self beSticky.
	self comeToFront.
	UseErrorCatcher := true.
"	Sensor useOSEvents: true.
	Preferences enable: #noviceMode.
	Preferences disable: #warnIfNoSourcesFile.
	Preferences disable: #warnIfNoChangesFile.
	Preferences insertionPointColor: (Color r: 0.353 g: 0.607 b: 0.788).
	Preferences textHighlightColor: (Color r: 0.353 g: 0.607 b: 0.788)."
	self updateProjectName.
	self step.
