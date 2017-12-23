initialization
addViewer

	| r |

	r := AlignmentMorph newRow.
	r color: Color transparent; borderWidth: 0; inset: 0.
	r hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	r centering: #center.

	r addMorphBack: (AlignmentMorph newSpacer: r color).
	r addMorphBack: viewer.
	r addMorphBack: (AlignmentMorph newSpacer: r color).

	self addMorphBack: r.
	
