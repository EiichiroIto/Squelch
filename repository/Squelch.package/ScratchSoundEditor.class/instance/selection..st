accessing
selection: anArrayorNil

	anArrayorNil ifNil: [selection := {nil. nil}.]
			 ifNotNil: [selection := anArrayorNil.].
	graph selection: selection.
	viewer selection: selection