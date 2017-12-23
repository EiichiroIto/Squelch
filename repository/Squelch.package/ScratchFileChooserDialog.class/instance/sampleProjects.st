shortcuts
sampleProjects
	"Sample Projects button was pressed."

	FileSystem workingDirectory / 'Projects'
		in: [ :dir | 
			dir isDirectory
				ifTrue: [ list currentDirectory: dir ] ]