file read/write
updateLastHistoryEntryIfNeeded
	"If the the last entry in this project's history is an old-sytle entry (i.e. one that does not include the project name and author) update it."

	| lines lastLine oldAuthor tab s |
	lines := (projectInfo at: 'history' ifAbsent: ['']) lines.
	lines size = 0 ifTrue: [^ self].
	lastLine := lines at: lines size.
	(lastLine includes: Character tab) ifTrue: [^ self].  "last line is already a new-style entry"

	oldAuthor := projectInfo at: 'author' ifAbsent: [''].
	tab := String tab.
	lastLine := lastLine, tab, 'old', tab, projectName, tab, "blank scratchr name" tab, oldAuthor.
	lines at: lines size put: lastLine.

	s := WriteStream on: (String new: 1000).
	lines do: [:entry | s nextPutAll: entry; cr].
	projectInfo at: 'history' put: s contents.
