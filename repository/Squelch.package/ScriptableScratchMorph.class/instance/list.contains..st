list ops
list: listName contains: anObject

	| list |
	list := self listNamed: listName ifNone: [^ false].
	^ list contains: anObject
