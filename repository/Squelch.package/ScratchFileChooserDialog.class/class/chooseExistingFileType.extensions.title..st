instance creation
chooseExistingFileType: type extensions: anArrayOrNil title: titleString

	| m |
	ScratchFileChooserDialog deleteDuplicates.
	m := self new
		createFileChooserLayout: false;
		type: type;
		extensions: anArrayOrNil;
		title: titleString.

	^ m getUserResponse
