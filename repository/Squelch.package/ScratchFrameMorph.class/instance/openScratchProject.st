file read/write
openScratchProject
	"Allow the user to select a project to open, then open that project."

	| response newProj |
	self closeMediaEditorsAndDialogs ifFalse: [^ self].
	self stopAll.

	(justSaved or: [self projectIsEmpty]) ifFalse: [
		"ask the user if they want to save the current project"
		response := DialogBoxMorph askWithCancel: 'Save the current project?'.
		response = #cancelled ifTrue: [^ self].
		response ifTrue: [self saveScratchProjectNoDialog]].

	response := ScratchFileChooserDialog openScratchFileFor: self.
	response = #cancelled ifTrue: [^ self].

	(response isKindOf: String) ifTrue: [  "read the contents of a local file"
		^ self openScratchProjectNamed: response].

	(response isKindOf: ByteArray) ifTrue: [
		[projectInfo := self extractInfoFrom: response] ifError: [projectInfo := Dictionary new].
		[newProj := self extractProjectFrom: response] ifError: [^ self].
		self installNewProject: newProj.
		projectDirectory := ScratchFileChooserDialog getDefaultFolderForType: #project].
