playing
suspendPlaying

	cameraNum > 0 ifTrue: [
		CameraPlugin closeCamera: cameraNum.
		frameForm := prevFrameForm := historyForm :=  nil.
		cameraNum := -1].

