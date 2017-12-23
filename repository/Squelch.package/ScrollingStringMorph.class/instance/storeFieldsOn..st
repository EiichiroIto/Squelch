object i/o
storeFieldsOn: anObjStream

	| showScrollbar |
	showScrollbar := scrollbar owner = self.
	self showScrollbar: false.

	super storeFieldsOn: anObjStream.
	font
		ifNil: [anObjStream putField: nil]
		ifNotNil: [anObjStream putField: (Array with: font name with: font pointSize)].

	anObjStream putField: showScrollbar.

	self storeFieldsNamed: #(
		firstVisibleLine
		textColor
		selectionColor
		lines
	) on: anObjStream.

	self showScrollbar: showScrollbar.
