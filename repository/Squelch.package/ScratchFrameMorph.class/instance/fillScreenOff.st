menu/button actions
fillScreenOff
	"Stop filling the entire screen. Useful during development."


	Display fullscreenOff.
	World restoreDisplay.

	fillScreenFlag := false.
	self beUnsticky.
	self extent: Display extent - 50.
	UseErrorCatcher := false.
"	Preferences disable: #noviceMode.
	Preferences enable: #warnIfNoSourcesFile.
	Preferences enable: #warnIfNoChangesFile.
	Preferences insertionPointColor: (Color r: 0.4 g: 1.0 b: 0.0).
	Preferences textHighlightColor: (Color r: 0.4 g: 1.0 b: 0.0)."