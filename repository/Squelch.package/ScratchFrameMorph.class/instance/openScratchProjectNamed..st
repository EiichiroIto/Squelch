file read/write
openScratchProjectNamed: fName
	"Open a Scratch project with the given name."

	| f projData newProj fn |
	self closeMediaEditorsAndDialogs
		ifFalse: [ ^ self ].
	fn := fName.
	f := FileStream readOnlyFileNamed: fn.
	f ifNil: [ ^ self inform: 'Could not read' withDetails: fName ].
	"[" 
	projData := f binary contentsOfEntireFile.
	newProj := self extractProjectFrom: projData.
	projectInfo := self extractInfoFrom: projData "]
		ifError: [ :err :rcvr | ^ self inform: 'Could not read project; file may be damaged' withDetails: '(' , err , ')' ]".
	projectDirectory := fn asFileReference parent.
	ScratchFileChooserDialog setLastFolderTo: projectDirectory forType: #project.
	projectName := fn asFileReference basename.
	self installNewProject: newProj.
	self initializeWatcherPositions.
	viewerPane updateContents