menu/button actions
newScratchProject
	"Make a new, blank Scratch project."

	| response newProject sprite |
	self closeMediaEditorsAndDialogs ifFalse: [^ self].
	self stopAll.

	(justSaved or: [self projectIsEmpty]) ifFalse: [
		"ask the user if they want to save the current project"
		response := DialogBoxMorph askWithCancel: 'Save the current project?'.
		response = #cancelled ifTrue: [^ self].
		response ifTrue: [self saveScratchProjectNoDialog.
			justSaved ifFalse: [^ self]]].

	projectDirectory := ScratchFileChooserDialog getDefaultFolderForType: #project.
	projectName := ''.
	projectInfo := Dictionary new.

	newProject := ScratchStageMorph new.
	sprite := ScratchFrameMorph defaultSprite veryDeepCopy.
	sprite position: (241@181) - sprite extent.
	newProject addMorph: sprite.
	self installNewProject: newProject.

	self initializeWatcherPositions.
	justSaved := true.
	"self enterNormalMode."
