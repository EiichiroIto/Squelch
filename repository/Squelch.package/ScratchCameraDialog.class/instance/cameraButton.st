intialization
cameraButton

	| onForm offForm button overForm |
	onForm := ScratchFrameMorph skinAt: #dialogButtonFrameOver.
	offForm := ScratchFrameMorph skinAt: #dialogButtonFrame.
	overForm := ScratchFrameMorph skinAt: #dialogButtonFrame.

	button := ResizableToggleButton2 new
		offForm: offForm
		onForm: onForm
		overForm: overForm.

	^ button
		padding: 39@22;
		icon: (ScratchFrameMorph skinAt: #camera);
		target: self;
		actionSelector: #savePhoto;
		setLabelColor: (Color gray: 0.15)
