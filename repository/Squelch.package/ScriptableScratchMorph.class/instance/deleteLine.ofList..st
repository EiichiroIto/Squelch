list ops
deleteLine: lineNum ofList: listName

	| list |
	list := self listNamed: listName ifNone: [^ self].
	lineNum = 'all' ifTrue: [list clear. ^ self].
	list deleteLineAt: (self lineNum: lineNum forList: list)
