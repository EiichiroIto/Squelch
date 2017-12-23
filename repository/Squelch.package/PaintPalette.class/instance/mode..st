initialization
mode: aSymbol

	canvasMorph ifNotNil: [canvasMorph commitMove].
	self showRotationCenter ifTrue: [self showRotationCenter: false].
	mode := aSymbol.
	brushSizeMenu ifNotNil: [brushSizeMenu delete].
	canvasMorph ifNotNil: [
		mode = #text 
			ifTrue: [
				self color1: canvasMorph textColor.
				World activeHand newKeyboardFocus: canvasMorph]
			ifFalse: [
			self color1: self storedColor]].
	self updateOptionsPane.
	self updateToolbarButtons.

	self owner changed.
