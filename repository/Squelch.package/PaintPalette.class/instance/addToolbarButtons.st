initialization
addToolbarButtons

	| b firstRow secondRow buttonSpecs bName bTip |
	toolbarButtons := AlignmentMorph newColumn
		"inset: 0;"
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	firstRow := AlignmentMorph newRow
		"inset: 0;"
		color: Color transparent;
		vResizing: #shrinkWrap.
	secondRow := AlignmentMorph newRow
		"inset: 0;"
		color: Color transparent;
		vResizing: #shrinkWrap.

	buttonSpecs := #(
		"name			tip"
		(paint			'Paintbrush')
		(erase			'Eraser')
		(fill				'Fill tool (fill areas with color or gradient)')
		(rect 			'Rectangle tool (draw outlined or filled rectangle or square)')
		(oval 			'Ellipse tool (draw outlined or filled ellipse or circle)')
	).

	buttonSpecs do: [:spec |
		bName := spec at: 1.
		bTip := spec at: 2.
		b := ToggleButton new
			onForm: (ScratchFrameMorph skinAt: (bName, 'ToolButtonPressed'))
			offForm: (ScratchFrameMorph skinAt: (bName, 'ToolButton'))
			overForm: (ScratchFrameMorph skinAt: (bName, 'ToolButtonOver'));
			target: self;
			isMomentary: false;
			toggleMode: false;
			actionSelector: #mode:;
			arguments: (Array with: bName);
			setProperty: #balloonText toValue: bTip localized;
			actWhen: #buttonDown.
		firstRow addMorphBack: b].

	buttonSpecs := #(
		"name			tip"
		(line			'Line tool (draw lines)')
		(text			'Text tool (edit text layer)')
		(move			'Select tool (move, modify, or delete selection)')
		(stamp 			'Stamp tool (select area, then stamp copies of it)')
		(eyedropper 	'Eyedropper tool (select a color)')
	).

	buttonSpecs do: [:spec |
		bName := spec at: 1.
		bTip := spec at: 2.
		b := ToggleButton new
			onForm: (ScratchFrameMorph skinAt: (bName, 'ToolButtonPressed'))
			offForm: (ScratchFrameMorph skinAt: (bName, 'ToolButton'))
			overForm: (ScratchFrameMorph skinAt: (bName, 'ToolButtonOver'));
			target: self;
			isMomentary: false;
			toggleMode: false;
			actionSelector: #mode:;
			arguments: (Array with: bName);
			setProperty: #balloonText toValue: bTip localized;
			actWhen: #buttonDown.
		secondRow addMorphBack: b.
		].

	toolbarButtons addMorphBack: firstRow.
	toolbarButtons addMorphBack: secondRow.
	self addMorph: toolbarButtons.
