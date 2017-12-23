menu/button actions
writeSummaryFile: fullFileName
	"Write a summary of this project to a file."

	| s sprites f fName |
	s := WriteStream on: (String new: 10000).

	s nextPutAll: 'Project: ', self projectName; crlf.
	fullFileName size > 0 ifTrue: [s nextPutAll: 'Location: ', fullFileName; crlf].
	(projectInfo includesKey: 'author') ifTrue: [
		s nextPutAll: 'Author: ', (projectInfo at: 'author'); crlf].
	(projectInfo includesKey: 'scratch-version') ifTrue: [
		s nextPutAll: 'Scratch: ', (projectInfo at: 'scratch-version'); crlf].
	(projectInfo includesKey: 'comment') ifTrue: [
		s nextPutAll: 'Notes:'; crlf.
		(projectInfo at: 'comment') lines do: [:l | s nextPutAll: '    ', l; crlf].
		s crlf].
	(projectInfo includesKey: 'history') ifTrue: [
		s nextPutAll: 'History:'; crlf.
		(projectInfo at: 'history') lines do: [:l | s nextPutAll: '    ', l; crlf].
		s crlf].

	self writeSummaryTotalsOn: s.
	s nextPutAll: '--------'; crlf.
	workPane printSummaryOn: s.
	sprites := workPane submorphs select: [:m | m isKindOf: ScratchSpriteMorph].
	sprites do: [:m |
		s skip: -2.  "remove last crlf"
		s nextPutAll: '--------'; crlf.
		m printSummaryOn: s].
	s nextPutAll: '--------'; crlf.

	"ParagraphEditor clipboardTextPut: s contents asText."

	fName := fullFileName.
	fullFileName size = 0
		ifTrue: [
			fName := ScratchFileChooserDialog
				chooseNewFileDefault: self uniqueSummaryFileName
				title: 'File Name?'
				type: #projectSummary.
			fName = #cancelled ifTrue: [^ self]]
		ifFalse: [
			fName := self uniqueSummaryFileName].

	f := StandardFileStream newScratchFileNamed: fName.
	f ifNil: [^ self].
	f nextPutAll: s contents.
	f close.
