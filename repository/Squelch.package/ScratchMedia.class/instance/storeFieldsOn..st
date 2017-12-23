object i/o
storeFieldsOn: anObjStream

	self storeFieldsNamed: #(
		mediaName
	) on: anObjStream.
