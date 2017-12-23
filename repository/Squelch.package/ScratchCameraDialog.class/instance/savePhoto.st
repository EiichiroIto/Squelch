button ops
savePhoto

	client ifNil: [^ self].

	frameForm
		ifNil: [client savePhoto: viewFinderMorph form deepCopy]
		ifNotNil: [client savePhoto: frameForm deepCopy].
