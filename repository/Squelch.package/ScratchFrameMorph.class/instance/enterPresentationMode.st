view mode
enterPresentationMode
	"Go into presentation mode."

	| presenter |
	"ScratchPlugin pluginAvailable ifFalse: [
		self updateViewModeButtons.
		^ self beep]."

	(viewMode = #presentation) ifTrue: [^ self].

	lastViewMode := viewMode.
	viewMode := #presentation.

	self closeDialogBoxes.
	workPane isQuarterSize: false.
	presenter := ScratchPresenterMorph new frame: self.

	self delete.

	Display fillBlack.
	"Display fullscreen: true."
	World restoreDisplay.
	Display fillBlack.
	World assuredCanvas.  "re-allocate canvas after entering full-screen mode"

	"((Display width >= 965) & (Display height >= 750))
		ifTrue: [presenter beDoubleSize]."
	presenter extent: Display extent.

	World addMorphFront: presenter.
	World startSteppingSubmorphsOf: presenter.
	World activeHand newKeyboardFocus: nil.
	self updatePenPositions.
	self updateViewModeButtons.

	World assuredCanvas.  "re-allocate canvas after entering full-screen mode"
	World fullRepaintNeeded.
	World displayWorldSafely.
