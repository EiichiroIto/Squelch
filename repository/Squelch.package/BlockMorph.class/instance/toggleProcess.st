processes
toggleProcess

	(scratchProc isNil or: [scratchProc errorFlag])
		ifTrue: [self start]
		ifFalse: [self stop].
