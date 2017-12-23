view mode
enterQuarterMode
	"Go into quarter stage mode."

	(viewMode = #quarter) ifTrue: [
		self updateViewModeButtons.
		^ self].

	viewMode := #quarter.

	workPane isQuarterSize: true.
	workPane isInWorld
		ifTrue: [self fixLayout]
		ifFalse: [self exitPresentationMode].

	self updatePanes.
	self updateViewModeButtons.
