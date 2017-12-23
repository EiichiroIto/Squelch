initialization
buttonType: type action: actionSelector
	"Answer a new button with the given type and selector. The button target will be me and it will use custom forms."

	| onForm offForm overForm disabledForm |
	onForm := ScratchFrameMorph skinAt: ('record', type, 'ButtonPressed').
	offForm := ScratchFrameMorph skinAt: ('record', type, 'Button').
	overForm := ScratchFrameMorph skinAt: ('record', type, 'ButtonOver').
	disabledForm := ScratchFrameMorph skinAt: ('record', type, 'ButtonDisabled').

	^ ToggleButton new
		isMomentary: false;
		onForm: onForm offForm: offForm overForm: overForm disabledForm: disabledForm;
		label: '' font: (ScratchFrameMorph getFont: #SoundRecorderButton);
		target: self;
		actionSelector: actionSelector.
