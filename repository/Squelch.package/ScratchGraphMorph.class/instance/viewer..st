accessing
viewer: aBoolean

	viewer := aBoolean. "whether or not this graphMorph is the viewer graph Morph"
	
	viewer ifFalse: [self color: Color white.].