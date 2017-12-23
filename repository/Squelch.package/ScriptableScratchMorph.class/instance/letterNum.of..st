string ops
letterNum: letterNum of: aString
	"Answer the ith letter of the given string. Answer the empty string if the index is out of bounds."

	| s |
	letterNum isNumber ifTrue: [^ letterNum asInteger].

	s := letterNum.
	(s isKindOf: String) ifTrue: [
		#first = s ifTrue: [^ 1].
		#last = s ifTrue: [^ aString size].
		#any = s ifTrue: [
			aString size = 0 ifTrue: [^ 1].
			^ (1 to: aString size lineCount) atRandom].
		^ s asNumberNoError].
	^ 0
