shortcuts
scratchSounds
	"Scratch Sounds button was pressed."

	| sounds |
	sounds := ScratchFileChooserDialog getDefaultFolderForType: #sound.
	sounds ifNotNil: [list currentDirectory: sounds].
