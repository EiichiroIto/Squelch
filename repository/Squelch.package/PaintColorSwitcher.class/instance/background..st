accessing
background: aColor

	| t |
	background color: aColor.
	background removeAllMorphs.
	aColor = Color transparent ifTrue: [
		t := transparentMorph fullCopy.
		background addMorph:t.
		t position: (background position + (1@1))].
