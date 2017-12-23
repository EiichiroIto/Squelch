list ops
lineNum: lineNum forList: list

	| s |
	lineNum isNumber ifTrue: [^ lineNum asInteger].

	s := lineNum.
	(s isKindOf: String) ifTrue: [
		#first = s ifTrue: [^ 1].
		#last = s ifTrue: [^ list lineCount].
		#any = s ifTrue: [
			list lineCount = 0 ifTrue: [^ 1].
			^ (1 to: list lineCount) atRandom].
		^ s asNumberNoError].
	^ 0
