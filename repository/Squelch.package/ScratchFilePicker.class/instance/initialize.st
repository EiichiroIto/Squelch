initialization
initialize

	super initialize.
	self initFromForm: (ScratchFrameMorph skinAt: #filePickerFrame).
	fetchInProgress := false.
	showThumbnails := false.
	finalSelection := false.
	feedbackMorph := StringMorph new.  "used to show a remote directory fetch in progress"
	freezeFocus := false.

	self buildButtons.
	self buildContentsPane.

	self extent: 380@310.
	self currentDirectory: FileSystem workingDirectory.
