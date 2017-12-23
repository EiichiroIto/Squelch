other
presentColorPicker

	colorPicker owner
		ifNil: [self addMorph: colorPicker.
			colorPicker position: paletteMorph bottomLeft - (0@55) + (5@0)]
		ifNotNil: [colorPicker delete].
