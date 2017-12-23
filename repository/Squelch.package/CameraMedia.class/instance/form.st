accessing
form

	frameForm ifNotNil: [^ frameForm].
	^ (Form extent: frameExtent depth: 2) fillColor: Color gray
