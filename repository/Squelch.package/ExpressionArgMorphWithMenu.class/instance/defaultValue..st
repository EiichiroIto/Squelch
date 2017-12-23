accessing
defaultValue: anObject

	((#(listIndexMenu listIndexForDeleteMenu) includes: getMenuSelector) and:
	 [anObject isKindOf: String])
		ifTrue: [self specialValue: anObject]
		ifFalse: [super defaultValue: anObject].

