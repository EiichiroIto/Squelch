list ops
contentsOfList: listName

	| list |
	list := self listNamed: listName ifNone: [^ ''].
	^ list concatenatedLines
