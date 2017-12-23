accessing
showRotationCenter: aBoolean

	showRotationCenter = aBoolean ifTrue: [^ self].

	canvasMorph commitMove.  "commit the last move operation if necessary"

	showRotationCenter := aBoolean.
	showRotationCenter
		ifTrue: [
			storedMode := mode.
			mode := #setRotationCenter.
			owner ifNotNil: [owner setRotationCenterButton on]]
		ifFalse: [
			mode := storedMode.
			owner ifNotNil: [owner setRotationCenterButton off]].

	self updateToolbarButtons.
	canvasMorph ifNotNil: [canvasMorph changed].
