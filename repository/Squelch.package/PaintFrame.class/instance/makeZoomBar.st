initialization
makeZoomBar

	| b t |
	zoomBar := AlignmentMorph newRow
		color: Color transparent;
		wrapCentering: #bottomRight;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.

	#(out in) do: [:n |
		b := ToggleButton
			onForm: (ScratchFrameMorph skinAt: ('paintZoom', n asString capitalized, 'Button'))
			offForm: (ScratchFrameMorph skinAt: ('paintZoom', n asString capitalized, 'Button')).
		b
			target: self;
			actionSelector: #scaleCanvas:;
			arguments: (Array with: n);
			borderWidth: 0;
			setProperty: #balloonText toValue: ('Zoom ', n asString) localized.
		zoomBar addMorphBack: b.

		#out = n ifTrue: [
			#(1 2 4 8 16) do: [:scale |
				t := ToggleButton
					onForm: (ScratchFrameMorph skinAt: ('zoom', scale asString, 'ButtonPressed'))
					offForm: (ScratchFrameMorph skinAt: ('zoom', scale asString, 'Button')).
				t
					target: self;
					actionSelector: #scaleCanvas:;
					arguments: (Array with: scale);
					setProperty: #balloonText toValue: scale asString, 'x'.
				zoomBar addMorphBack: t.
				zoomBar addMorphBack: (Morph new extent: 2@2; color: Color transparent)]]].

	^ zoomBar
