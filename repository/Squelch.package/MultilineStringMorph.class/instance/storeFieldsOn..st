object i/o
storeFieldsOn: anObjStream

	super storeFieldsOn: anObjStream.

	anObjStream putField: {font name. font pointSize. font isOSFont}.  "font spec"
	self storeFieldsNamed: #(
		textColor
		selectionColor
		lines
	) on: anObjStream.

