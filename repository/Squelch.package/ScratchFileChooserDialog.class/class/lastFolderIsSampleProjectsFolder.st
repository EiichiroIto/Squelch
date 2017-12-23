accessing
lastFolderIsSampleProjectsFolder
	"Return true if the last projects folder is the sample projects folder."

	| lastDirPath sampleProjectDirPath |
	lastDirPath := (self getLastFolderForType: #project) pathString.
	sampleProjectDirPath := (FileSystem workingDirectory / 'Projects') pathString.
	^ lastDirPath beginsWith: sampleProjectDirPath
