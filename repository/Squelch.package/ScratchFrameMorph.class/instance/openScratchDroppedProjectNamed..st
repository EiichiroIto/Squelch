file read/write
openScratchDroppedProjectNamed: fName
	"Open a Scratch project with the given name that was dropped on the Scratch window."

	| response |
	self closeMediaEditorsAndDialogs ifFalse: [^ self].
	self stopAll.

	(justSaved or: [self projectIsEmpty]) ifFalse: [
		"ask the user if they want to save the current project"
		response := DialogBoxMorph askWithCancel: 'Save the current project?'.
		response = #cancelled ifTrue: [^ self].
		response ifTrue: [self saveScratchProjectNoDialog]].

	self openScratchProjectNamed: fName.
