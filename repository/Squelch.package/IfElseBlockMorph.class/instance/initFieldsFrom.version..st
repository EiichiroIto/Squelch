object i/o
initFieldsFrom: anObjStream version: classVersion

	super initFieldsFrom: anObjStream version: classVersion.
	self initFieldsNamed: #(
		trueBlock
		falseBlock
		nextBlock
	) from: anObjStream.
