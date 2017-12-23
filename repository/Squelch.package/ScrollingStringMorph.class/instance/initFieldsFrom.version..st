object i/o
initFieldsFrom: anObjStream version: classVersion

	| fontSpec showScrollbar |
	super initFieldsFrom: anObjStream version: classVersion.
	fontSpec := anObjStream nextField.
	fontSpec ifNotNil: [
		font := StrikeFont fontName: fontSpec first size: fontSpec second].

	showScrollbar := anObjStream nextField.

	self initFieldsNamed: #(
		firstVisibleLine
		textColor
		selectionColor
		lines
	) from: anObjStream.

	self font: font.
	self showScrollbar: false.
	self showScrollbar: showScrollbar.

