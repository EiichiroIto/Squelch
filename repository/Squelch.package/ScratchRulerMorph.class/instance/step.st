stepping
step
	
	| graphStart graphEnd |
	graph ifNil: [^self].

	self extent x = graph extent x
		ifFalse: [self extent: (graph extent x)@(self extent y).].


	graphStart := graph startIndex min: graph data size.
	graphEnd := graphStart + (graph bounds width/graph scale) min: graph data size.
	
	(min = graphStart and:[ max = graphEnd])
		ifFalse: [ min := graphStart.
				  max := graphEnd truncated.
				  self changed.].