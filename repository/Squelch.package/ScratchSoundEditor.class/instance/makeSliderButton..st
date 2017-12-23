initialization
makeSliderButton: buttonExtent

	| button |
	button := BorderedMorph
		newBounds: (self innerBounds bottomRight - buttonExtent extent: buttonExtent)
		color: Color lightGray.

	button setBorderWidth: 1 borderColor: #raised.
	^ button
