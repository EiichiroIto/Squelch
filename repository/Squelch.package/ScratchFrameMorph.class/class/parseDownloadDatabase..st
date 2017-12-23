utilities
parseDownloadDatabase: fileName
	"Parse the HTML file for the Scratch download database."
	"self parseDownloadDatabase: 'mlist.html'"
	"To list downloads by date:
		(db collect: [:r | r first upTo: Character space]) asBag sortedElements"

	| raw lines inTable s records r |
	raw := (FileStream oldFileNamed: fileName) contentsOfEntireFile.
	lines := OrderedCollection new.
	inTable := false.
	raw lines do: [:ln |
		s := ln trimBoth.
		s = '</table>' ifTrue: [inTable := false].
		inTable ifTrue: [lines addLast: s].
		s = '<table>' ifTrue: [inTable := true]].

	records := OrderedCollection new.
	lines := ReadStream on: lines.
	[lines atEnd] whileFalse: [
		lines next = '<tr>' ifTrue: [
			r := self parseRecordFrom: lines.
			r size > 0 ifTrue: [records addLast: r asArray]]].

	^ records asArray

