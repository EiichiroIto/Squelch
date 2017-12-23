initialization
addTransformButtons

	| specs b |
	specs := #(
		(paintGrow				enlarge		'Grow')
		(paintShrink			shrink		'Shrink')
		-
		(paintRotateLeft			rotateCCW	'Rotate counter-clock-wise')
		(paintRotateRight		rotateCW	'Rotate clock-wise')
		-
		(paintFlipVertical		flipH		'Flip horizontally')
		(paintFlipHorizontal		flipV		'Flip vertically')
	).

	transformButtons := AlignmentMorph newRow
		color: Color transparent;
		"inset: 0;"
		vResizing: #shrinkWrap;
		wrapCentering: #center.

	specs do: [:n |
		n = #-
			ifTrue: [
				transformButtons addMorphBack: (Morph new extent: 3@10; color: Color transparent)]
			ifFalse: [
				b := ToggleButton new
					onForm: (ScratchFrameMorph skinAt: ((n at: 1), 'ButtonPressed'))
						offForm: (ScratchFrameMorph skinAt: ((n at: 1), 'Button'))
						overForm: (ScratchFrameMorph skinAt: ((n at: 1), 'Button'));
					target: canvasMorph;
					isMomentary: true;
					toggleMode: false;
					actionSelector: (n at: 2);
					setProperty: #balloonText toValue: (n at: 3) localized.
				transformButtons addMorphBack: b]].

	self addMorph: transformButtons.
