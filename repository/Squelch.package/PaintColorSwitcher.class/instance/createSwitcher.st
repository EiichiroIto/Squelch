initialization
createSwitcher

	switcher := IconicButton new.
	switcher
		labelGraphic: (ScratchFrameMorph skinAt: #paintColorSwitcher)" borderWidth: 0";
		actionSelector: #switchColors;
		target: self;
		actWhen: #buttonDown.
	self addMorph: switcher.
	switcher position: 36@(self top + 5).
