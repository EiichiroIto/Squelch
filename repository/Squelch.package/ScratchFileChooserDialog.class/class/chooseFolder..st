instance creation
chooseFolder: aDirectory

	| m |
	ScratchFileChooserDialog deleteDuplicates.
	m := self new
		createFileChooserLayout: false;
		choosingFolder: true;
		setDirectory: aDirectory;  "initial directory"
		extensions: '!';  "do not show files in the directories"
		title: 'Choose a folder'.

	^ m getUserResponseForFolder
