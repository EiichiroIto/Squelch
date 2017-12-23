event handling
mouseDown: evt

	| p |
	"do stuff"
	p := evt cursorPoint.
	

	(slider containsPoint: p) ifTrue: [ 
		slider descending ifTrue: [scrollDelta := deltaVal negated.]
						  ifFalse: [scrollDelta := deltaVal.].].
	(backButton containsPoint: p) ifTrue: [ backButton borderInset. scrollDelta := deltaVal negated ].
	(fwdButton containsPoint: p) ifTrue: [ fwdButton borderInset. scrollDelta := deltaVal].