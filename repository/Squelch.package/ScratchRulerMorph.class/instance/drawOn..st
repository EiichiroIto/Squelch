drawing
drawOn: aCanvas

	| space bigSpace currVal s ss |
	
	"the amt of space btw each bar.  big Space = the amt of space btw each big bar"
	space := (self extent x/marks) truncated max: 1.
	bigSpace := 5* space asFloat.

	graph ifNotNil: [ss := graph editor origSamplingRate]
		   ifNil: [ss := 1].


	currVal := (min/ss) asFloat roundTo: 0.01.  "the value of where we are in teh rule"

	aCanvas fillRectangle: (Rectangle origin: (self left)@(self top) corner: (self right)@(self bottom)) color: Color lightGray.
	self removeAllMorphs.

	(self left) to: (self right) by: space do: 
		[:pos |
			(pos - (self left)) \\ bigSpace = 0
				ifTrue: [aCanvas line: (pos truncated)@((self top) truncated) to: (pos truncated)@((self top + 5) truncated) color: Color black.
				s := StringMorph contents: (currVal asString).
				s center: (pos truncated)@(self top + 12).
				self addMorph: s.]
				ifFalse: [aCanvas line: (pos truncated)@(self top truncated) to: (pos truncated)@((self top + 1) truncated) color: Color black.]. 
			currVal := currVal + ((max-min)/(marks*ss)) roundTo: 0.01. ].




