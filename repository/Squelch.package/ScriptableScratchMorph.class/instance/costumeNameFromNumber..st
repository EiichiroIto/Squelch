looks ops
costumeNameFromNumber: aNumber
	"Return a costume name for the given number--rounded and modulo the number of costumes."

	| costumeList i |
	costumeList := media reject: [:m | m isSound].
	costumeList size = 0 ifTrue: [^ 'costume'].

	i := ((aNumber rounded - 1) \\ costumeList size) + 1.
	^ (costumeList at: i) mediaName
