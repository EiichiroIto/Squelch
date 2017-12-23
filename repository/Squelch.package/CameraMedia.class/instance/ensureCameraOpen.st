private
ensureCameraOpen
	"Try to open a camera. Do nothing if the camera is already open. Set cameraNum to -1 if no camera is available."

	| i |
	((cameraNum > 0) and: [CameraPlugin cameraIsOpen: cameraNum]) ifTrue: [^ self].

	frameForm := nil.
	cameraNum := -1.
	i := 1.
	[(i <= 8) and: [cameraNum < 0]] whileTrue: [
		(CameraPlugin cameraName: i) ifNotNil: [
			(CameraPlugin openCamera: i width: frameExtent x height: frameExtent y) ifNotNil: [
				frameForm := Form extent: (CameraPlugin frameExtent: i) depth: 32.
				frameExtent := frameForm extent.
				Delay waitMSecs: 400.
				cameraNum := i]].
		i := i + 1].
