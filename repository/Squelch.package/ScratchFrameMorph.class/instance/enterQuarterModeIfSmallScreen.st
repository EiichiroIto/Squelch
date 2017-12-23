private
enterQuarterModeIfSmallScreen

	(Display width >= 980) & (Display height >= 555) ifTrue: [^ self].
	viewMode = #normal ifTrue: [self enterQuarterMode].
