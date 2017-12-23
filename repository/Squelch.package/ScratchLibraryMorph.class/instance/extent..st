geometry
extent: aRectangle

	| nameHeight |
	super extent: aRectangle.
	scrollPane isNil | stagePane isNil ifTrue: [^ self].
	
	thumbWidth := 50.
	nameHeight := (ScratchTranslator stringExtent: ('Sprite1' localized) font: (ScratchFrameMorph getFont: #LibraryItemName)) y.
	itemExtent := 54@(54 + nameHeight).

	stagePane width: itemExtent x + 0.
	scrollPane left: stagePane right.

	self fixLayout.
