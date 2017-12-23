stepping
step

	| w n outF |
	(w := self world) ifNotNil: [w activeHand newKeyboardFocus: self].
	frameForm ifNil: [^ self].

	n := CameraPlugin getFrameForCamera: 1 into: frameForm bits.
	n > 0 ifTrue: [
		outF := viewFinderMorph form.
		(WarpBlt toForm: outF)
			sourceForm: frameForm;
			cellSize: 1;  "installs a new colormap if cellSize > 1"
			combinationRule: Form over;
			copyQuad: frameForm boundingBox innerCorners toRect: outF boundingBox.
		viewFinderMorph changed].

