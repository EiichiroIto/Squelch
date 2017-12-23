initialization
addStopButton

	| h |
	stopButton := ResizableToggleButton2 new
		offForm: (ScratchFrameMorph skinAt: #btn)
		onForm: (ScratchFrameMorph skinAt: #btnPressed).

	stopButton
		icon: (ScratchFrameMorph skinAt: #scratchSoundStop);
		target: self;
		actionSelector: #stopPreviewSound;
		toggleMode: false.

	h := (ScratchFrameMorph buttonLabel: 'Copy' localized selector: #duplicateMedia) height.
	h := h max: 21.
	stopButton extent: h@h.

	rightMorph addMorphBack: stopButton.
