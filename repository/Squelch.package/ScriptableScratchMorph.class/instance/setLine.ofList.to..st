list ops
setLine: lineNum ofList: listName to: anObject

	| list |
	list := self listNamed: listName ifNone: [^ ''].
	^ list setLineAt: (self lineNum: lineNum forList: list) to: (self asListElement: anObject)
