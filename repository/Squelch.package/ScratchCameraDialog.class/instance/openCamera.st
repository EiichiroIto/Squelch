accessing
openCamera

	| desiredExtent w |
	desiredExtent := 320@240.
	(CameraPlugin openCamera: 1 width: desiredExtent x height: desiredExtent y) ifNotNil: [
		CameraPlugin waitForCameraStart.
		frameForm := Form extent: (CameraPlugin frameExtent: 1) depth: 32].

	viewFinderMorph form: (Form extent: 320@240 depth: 32) fillBlack.
	self step.
	self extent: self extent.

	(w := self world) ifNotNil: [w activeHand newKeyboardFocus: self].
