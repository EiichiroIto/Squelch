file read/write
importScratchProject
	"Allow the user to select a project to open, then merge that project's sprites with the
current project."

	| response |
	self closeMediaEditorsAndDialogs ifFalse: [^ self].
	self stopAll.

	response := ScratchFileChooserDialog
		chooseExistingFileType: #project
		extensions: #(scratch sb)
		title: 'Import Project'.
	response ifNil: [^ self].

	self importSpriteOrProject: response.
