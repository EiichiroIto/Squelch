import/export
importList

	| result |
	result := ScratchFileChooserDialog
		chooseExistingFileType: #list
		extensions: #(txt)
		title: 'Import List'.

	#cancelled = result ifTrue: [^ self].
	self importListFromFileNamed: result.
