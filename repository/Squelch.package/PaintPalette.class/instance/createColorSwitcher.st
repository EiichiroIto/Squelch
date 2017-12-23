initialization
createColorSwitcher

	colorSwitcher := PaintColorSwitcher new.
	colorSwitcher setProperty: #balloonText toValue: 'Switch colors' localized.
	self addMorph: colorSwitcher.
