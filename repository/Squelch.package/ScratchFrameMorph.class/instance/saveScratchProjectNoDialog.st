file read/write
saveScratchProjectNoDialog
	| fName dir |
	self closeMediaEditorsAndDialogs
		ifFalse: [ ^ self ].
	projectName ifNil: [ projectName := '' ].
	fName := self nameFromFileName: projectName.
	dir := ScratchFileChooserDialog getLastFolderForType: #project.
	fName size = 0 | (dir / (fName , '.sb')) isFile not
		ifTrue: [ ^ self saveScratchProject ].
	ScratchFileChooserDialog lastFolderIsSampleProjectsFolder
		ifTrue: [ ^ self saveScratchProject ].
	self updateLastHistoryEntryIfNeeded.
	projectName := (fName , '.sb') asFileReference basename.	"ignore path, if any; save in the original project directory"
	projectDirectory := dir.
	self updateHistoryProjectName: projectName op: 'save'.
	self writeScratchProject