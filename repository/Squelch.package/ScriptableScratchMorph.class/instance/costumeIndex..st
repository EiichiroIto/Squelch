looks ops
costumeIndex: aNumber
	"Set my costume to the costume at the given index modulo my total number of costumes. Costumes are numbered starting at 1."

	| cList i newC |
	cList := media reject: [:m | m isSound].
	cList size = 0 ifTrue: [^ self].  "should never happen..."
	i := ((aNumber rounded - 1) \\ cList size) + 1.
	newC := cList at: i.
	costume == newC ifFalse: [self lookLike: newC mediaName].
