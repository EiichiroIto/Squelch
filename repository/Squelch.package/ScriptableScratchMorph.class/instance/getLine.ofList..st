list ops
getLine: lineNum ofList: listName

	| list |
	list := self listNamed: listName ifNone: [^ ''].
	^ list lineAt: (self lineNum: lineNum forList: list)
