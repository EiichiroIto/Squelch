other
projectDirectory

	projectDirectory ifNil: [^ FileDirectory default].
	^ projectDirectory
