accessing
color2: aColor
	"Set the second color for gradiant fills."

	colorSwitcher background: aColor.
	(mode == #fill) ifTrue: [self updateOptionsPane].
