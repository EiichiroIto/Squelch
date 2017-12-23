instance creation
chooseNewFileDefault: defaultName title: titleString type: type

	| m |
	ScratchFileChooserDialog deleteDuplicates.
	m := self new
		createFileChooserLayout: true;
		type: type;
		defaultName: defaultName;
		title: titleString;
		listExtent: 400@280.

	^ m getUserResponseForNewFile
