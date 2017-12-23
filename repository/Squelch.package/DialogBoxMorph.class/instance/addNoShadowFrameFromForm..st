initialization
addNoShadowFrameFromForm: aForm

	| cornerExtent center |
	cornerExtent := (aForm extent - 1) // 2.
	center := aForm extent // 2.

	topLeftForms := Array new: 2.
	bottomLeftForms := Array new: 2.
	topRightForms := Array new: 2.
	bottomRightForms := Array new: 2.
	topEdgeForms := Array new: 2.
	leftEdgeForms := Array new: 2.
	rightEdgeForms := Array new: 2.
	bottomEdgeForms := Array new: 2.

	topLeftForms
		at: 1 put: topLeftForm deepCopy;
		at: 2 put: (aForm copy: (0@0 extent: cornerExtent)).
	topRightForms
		at: 1 put: topRightForm copy;
		at: 2 put: (aForm copy: ((aForm width - cornerExtent x) @ 0 extent: cornerExtent)).
	bottomLeftForms
		at: 1 put: bottomLeftForm copy;
		at: 2 put: (aForm copy: (0 @ (aForm height - cornerExtent y) extent: cornerExtent)).
	bottomRightForms
		at: 1 put: bottomRightForm copy;
		at: 2 put: (aForm copy: ((aForm extent - cornerExtent) extent: cornerExtent)).

	topEdgeForms
		at: 1 put: topEdgeForm copy;
		at: 2 put: (aForm copy: ((center x@0) extent: (1 @ cornerExtent y))).
	leftEdgeForms
		at: 1 put: leftEdgeForm copy;
		at: 2 put: (aForm copy: ((0 @ center y) extent: (cornerExtent x @ 1))).
	rightEdgeForms
		at: 1 put: rightEdgeForm copy;
		at: 2 put: (aForm copy: (((aForm width - cornerExtent x) @ center y) extent: (cornerExtent x @ 1))).
	bottomEdgeForms
		at: 1 put: bottomEdgeForm copy;
		at: 2 put: (aForm copy: ((center x@(aForm height - cornerExtent y)) extent: (1 @ cornerExtent y))).

