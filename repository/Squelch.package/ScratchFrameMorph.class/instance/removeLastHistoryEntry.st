uploading
removeLastHistoryEntry
	"Remove the last entry in the project history. This is done if an upload attempt fails or is cancelled."

	| lines s |
	lines := (projectInfo at: 'history' ifAbsent: ['']) lines.
	lines size = 0 ifTrue: [^ self].

	lines := lines copyFrom: 1 to: lines size - 1.

	s := WriteStream on: (String new: 1000).
	lines do: [:entry | s nextPutAll: entry; cr].
	projectInfo at: 'history' put: s contents.
