playing
mediaStep
	"Make sure the camera is open, if possible, then get the next frame. Answer true if successful."

	| n |
	self ensureCameraOpen.
	cameraNum < 0 ifTrue: [^ false].  "no camera"

	n := CameraPlugin getFrameForCamera: cameraNum into: frameForm bits.
	n = 0 ifTrue: [^ false].  "no new frame"

	ScratchFrameMorph cameraMode = #motion ifTrue: [self motionStep].
	ScratchFrameMorph cameraMode = #colorTrack ifTrue: [self colorTrackStep].

	^ n ~~ 0
