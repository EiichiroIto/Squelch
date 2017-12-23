initialization
addPlayButton

	| h |
	playButton := ResizableToggleButton2 new
		offForm: (ScratchFrameMorph skinAt: #btn)
		onForm: (ScratchFrameMorph skinAt: #btnPressed).

	playButton
		icon: (ScratchFrameMorph skinAt: #scratchSoundPlay);
		target: self;
		actionSelector: #startPreviewSound;
		toggleMode: false.

	h := (ScratchFrameMorph buttonLabel: 'Copy' localized selector: #duplicateMedia) height.
	h := h max: 21.
	playButton extent: (1.3 * h) rounded@h.

	rightMorph addMorphBack: playButton.
