accessing
color

	currentForm
		ifNil: [^ color]
		ifNotNil: [^ currentForm color].
