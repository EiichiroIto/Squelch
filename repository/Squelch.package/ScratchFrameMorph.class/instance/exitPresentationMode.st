view mode
exitPresentationMode
	"Exit presentation mode."

	TakeOverScreen ifFalse: [
		Display fullscreen: false.
		World restoreDisplay].

	ScriptableScratchMorph doubleSize: false.
	self addMorphFront: workPane.
	self fixLayout.
	World addMorphFront: self.
	World startSteppingSubmorphsOf: self.
	World fullRepaintNeeded.
	self updatePenPositions.

	lastViewMode = #normal ifTrue: [^ self enterNormalMode].
	lastViewMode = #quarter ifTrue: [^ self enterQuarterMode].
