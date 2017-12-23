file read/write
clearStage

	self stopAll.
	projectDirectory := ScratchFileChooserDialog getDefaultFolderForType: #project.
	projectName := ''.
	projectInfo := Dictionary new.

	self installNewProject: ScratchStageMorph new.
	self initializeWatcherPositions.
	justSaved := true.
