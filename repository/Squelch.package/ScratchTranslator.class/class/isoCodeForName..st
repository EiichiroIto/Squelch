language translation
isoCodeForName: aString

	(ISODict includes: aString)
		ifFalse:[^ aString]
		ifTrue:[^ ISODict keyAtValue: aString].
