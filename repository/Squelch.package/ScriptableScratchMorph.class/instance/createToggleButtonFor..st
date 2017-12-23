blocks
createToggleButtonFor: block
	"Create the toggle button for each variable that could be viewed on the stage."

	| toggleButton |
	toggleButton := ToggleButton
		onForm: (ScratchFrameMorph skinAt: #watcherButtonPressed)
		offForm: (ScratchFrameMorph skinAt: #watcherButton).

	toggleButton
		target: block;
		actionSelector: #toggleWatcher;
		borderWidth: 0;
		setProperty: #balloonText toValue: 'View on stage' localized.

	^ toggleButton
