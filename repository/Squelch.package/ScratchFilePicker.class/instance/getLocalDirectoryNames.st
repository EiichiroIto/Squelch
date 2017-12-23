private
getLocalDirectoryNames
	"Answer the directories in currentDir. Suppress hidden volumes."

	| dirNames visible |
	dirNames := currentDir directoryNames.
	(visible := ScratchFrameMorph visibleDrives) ifNil: [^ dirNames].

	Smalltalk isMacOSX
		ifTrue: [currentDir pathName = '/Volumes' ifFalse: [^ dirNames]]
		ifFalse: [currentDir pathName = '' ifFalse: [^ dirNames]].

	^ dirNames select: [:dir | visible includes: dir asUppercase]
