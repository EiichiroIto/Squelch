list ops
append: anObject toList: listName

	| list |
	list := self listNamed: listName ifNone: [^ 0].
	list insertLine: (self asListElement: anObject) at: (list lineCount + 1).

