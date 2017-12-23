object i/o
initFieldsFrom: anObjStream version: classVersion

	self initFieldsNamed: #(
		mediaName
	) from: anObjStream.
