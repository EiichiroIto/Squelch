list ops
asListElement: anObject
	"Answer the given object converted to an object suitable for storing in a list."

	(anObject isKindOf: String) ifTrue: [^ anObject].
	(anObject isKindOf: Boolean) ifTrue: [
		^ anObject ifTrue: ['1'] ifFalse: ['0']].
	^ anObject printString
