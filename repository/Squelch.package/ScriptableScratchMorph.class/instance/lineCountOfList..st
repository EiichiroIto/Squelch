list ops
lineCountOfList: listName

	| list |
	list := self listNamed: listName ifNone: [^ 0].
	^ list lineCount
