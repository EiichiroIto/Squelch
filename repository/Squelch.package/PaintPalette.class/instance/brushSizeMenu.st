event handling
brushSizeMenu

	| b icon row n2 colorToUse |

	brushSizeMenu ifNotNil: [brushSizeMenu isInWorld ifTrue: [^ self]].
	brushSizeMenu := AlignmentMorph newColumn
		color: Color transparent;
		"inset: 0;"
		borderWidth: 1;
		useRoundedCorners;
		borderColor: (Color r: (173/255) g: (174/255) b: (181/255)).
	row := AlignmentMorph newRow
		borderWidth: 0";
		inset: 0".
	#(1 2 3 4 5 7 9 13 19 29 47 75) do: [:n | 
		n2 := n asNumber.
		(n2 <= 6) ifTrue: [n2 := n2 + 1].
		(n2 == 29) ifTrue: [n2 := 23].
		(n2 == 47) ifTrue: [n2 := 25].
		(n2 == 75) ifTrue: [n2 := 27].
		self mode = #erase
			ifTrue: [colorToUse := Color transparent]
			ifFalse: [colorToUse := self color1].
		icon := (PaintCanvas brushCursorSize: n2 color: colorToUse scale: 1).
		b := IconicButton new
			color: (Color r: (211/255) g: (212/255) b: (220/255));
			borderColor: (Color r: (173/255) g: (174/255) b: (181/255));
			labelGraphic: icon;
			width: 30; 
			height: 30;
			actionSelector: #brushSize:;
			target: self;
			arguments: (Array with: n).
		(self brushSize = n asNumber) ifTrue: [b color: Color white "(Color r: (188/255) g: (193/255) b: (200/255))"].
		row addMorphBack: b.
		(row submorphs size == 4) ifTrue: [
			brushSizeMenu addMorphBack: row.
			row := AlignmentMorph newRow borderWidth: 0"; inset: 0"]].
	brushSizeMenu position: (optionsPane left + 55)@(optionsPane bottom - 5).
	self owner addMorph: brushSizeMenu.