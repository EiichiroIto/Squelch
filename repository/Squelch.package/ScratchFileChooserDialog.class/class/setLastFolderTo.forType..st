accessing
setLastFolderTo: dir forType: type
	"Remember the given dir as the last folder used for the given type of file."

	(dir isKindOf: ScratchServerDirectory) ifTrue: [^ self].
	LastFolderForType at: type put: dir.

