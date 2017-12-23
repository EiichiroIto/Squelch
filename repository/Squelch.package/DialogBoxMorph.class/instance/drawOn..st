drawing
drawOn: aCanvas

	| i |
	i := (owner isKindOf: HandMorph) ifTrue: [2] ifFalse: [1].

	topLeftForm := topLeftForms at: i.
	bottomLeftForm := bottomLeftForms at: i.
	topRightForm := topRightForms at: i.
	bottomRightForm := bottomRightForms at: i.
	topEdgeForm := topEdgeForms at: i.
	leftEdgeForm := leftEdgeForms at: i.
	rightEdgeForm := rightEdgeForms at: i.
	bottomEdgeForm := bottomEdgeForms at: i.
	edgeCache := Array new: edgeCache size.

	super drawOn: aCanvas.
