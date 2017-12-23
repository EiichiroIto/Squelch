import/export
exportList

	| fName f |
	fName := titleMorph contents.
	fName size <= 1 ifTrue: [fName := 'newList'].
	fName := fName, '.txt'.

	fName := ScratchFileChooserDialog
		chooseNewFileDefault: fName
		title: 'File Name?'
		type: #list.
	fName = #cancelled ifTrue: [^ self].

	f := StandardFileStream newScratchFileNamed: fName.
	f ifNil: [^ self].
	cellMorphs do: [:m | f nextPutAll: m firstSubmorph contents; crlf].
	f close.
