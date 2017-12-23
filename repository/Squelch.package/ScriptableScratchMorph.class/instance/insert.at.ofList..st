list ops
insert: anObject at: lineNum ofList: listName

	| list i |
	list := self listNamed: listName ifNone: [^ self].
	i := self lineNum: lineNum forList: list.
	#last = lineNum ifTrue: [i := list lineCount + 1].
	list insertLine: (self asListElement: anObject) at: i.

