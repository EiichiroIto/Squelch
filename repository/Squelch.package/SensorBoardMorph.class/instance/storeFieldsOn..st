object i/o
storeFieldsOn: anObjStream

	super storeFieldsOn: anObjStream.
	anObjStream putField: 1.  "old portNum instance variable"

