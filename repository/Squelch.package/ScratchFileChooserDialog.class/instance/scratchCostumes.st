shortcuts
scratchCostumes
	"Scratch Costumes button was pressed."

	| costumes |
	costumes := ScratchFileChooserDialog getDefaultFolderForType: #costume.
	costumes ifNotNil: [list currentDirectory: costumes].
