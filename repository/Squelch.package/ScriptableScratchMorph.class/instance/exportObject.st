right button menu
exportObject

	| fName dir f objToExport |
	fName := ScratchFileChooserDialog
		chooseNewFileDefault: objName
		title: 'Export Sprite'
		type: #sprite.
	fName = #cancelled ifTrue: [^ self].
	fName size = 0 ifTrue: [^ self].
	(fName endsWith: '.sprite') ifFalse: [fName := fName, '.sprite'].
	fName := fName asFileReference basename.  "ignore path, if any; save in default directory"

	dir := ScratchFileChooserDialog getLastFolderForType: #sprite.
	(dir / fName) isFile ifTrue: [
		(DialogBoxMorph ask: 'Overwrite existing ', fName, '?') ifFalse: [^ self].
		(dir / fName) delete ].

	f := nil.
	[	f := (FileStream newFileNamed: (dir / fName) pathString) binary.
		objToExport := self copyForExport.
		objToExport objName: fName.
		ObjStream new storeObj: objToExport on: f showProgress: true.
		f close.
		"dir setMacFileNamed: fName type: 'STsb' creator: 'MITS'."
	] ifError: [
		f ifNotNil: [f close].
		self inform: 'Could not write file' withDetails: 'Export failed' localized].
