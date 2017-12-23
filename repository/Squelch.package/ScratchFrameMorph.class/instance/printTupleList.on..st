uploading
printTupleList: anArray on: s

	s nextPut: $(.
	1 to: anArray size do: [:i |
		self printTupleElement: (anArray at: i) on: s.
		i = anArray size ifFalse: [s space]].
	s nextPut: $).
