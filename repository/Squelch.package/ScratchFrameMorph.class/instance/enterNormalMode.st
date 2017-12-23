view mode
enterNormalMode
	"Go into normal (full-stage) mode."

	(viewMode = #normal) ifTrue: [
		self updateViewModeButtons.
		^ self].

	viewMode := #normal.

	workPane isQuarterSize: false.
	workPane isInWorld
		ifTrue: [self fixLayout]
		ifFalse: [self exitPresentationMode].

	self updatePanes.
	self updateViewModeButtons.
