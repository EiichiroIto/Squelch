private
deleteDirectory
	"Delete the directory or file that is currently highlit."

	| entries selectedDir dirEntries response |
	entries := contentsPaneMorph contents submorphs.
	selectedDir := entries detect: [:e | e isHighlit & e entryIsDirectory] ifNone: [^ self].

	dirEntries := (self currentDirectory directoryNamed: selectedDir entryName) entries.
	dirEntries size > 0 ifTrue: [^ self].  "do nothing if selectedDir is not empty"

	freezeFocus := true.
	response := DialogBoxMorph ask: 
		'Are you sure you want to delete the empty folder ''' , selectedDir entryName , '''?'.
	freezeFocus := false.

	response ifTrue: [
		[self currentDirectory deleteDirectory: e entryName]
			ifError: [^ DialogBoxMorph warn: 'Could not delete folder.'].
		^ self currentDirectory: self currentDirectory].
