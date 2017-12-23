accessing
getLastFolderForType: type
	"Return the last used folder for the given type. If this is the first time the type has been used, return the default folder for that type."

	| dir |
	dir := LastFolderForType at: type ifAbsent: [nil].
	dir ifNotNil: [
		(dir isKindOf: FileDirectory) 
			ifTrue: [(dir parentDirectory directoryExists: dir pathName) ifTrue: [^ dir]]].

	^ ScratchFileChooserDialog getDefaultFolderForType: type
