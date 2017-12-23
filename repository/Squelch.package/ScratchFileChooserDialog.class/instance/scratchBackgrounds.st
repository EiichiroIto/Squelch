shortcuts
scratchBackgrounds
	"Scratch Backgrounds button was pressed."

	| backgrounds |
	backgrounds := ScratchFileChooserDialog getDefaultFolderForType: #background.
	backgrounds ifNotNil: [list currentDirectory: backgrounds].
