initialization
createColorPickers

	colorPickerContainer := BorderedMorph new.
	colorPickerImage := ImageMorph new.
	colorPickerContainer
		borderWidth: 1;
		borderColor: (Color r: 0.505 g: 0.505 b: 0.505);
		extent: 500@500;
		addMorph: colorPickerImage.
	self addMorph: colorPickerContainer.
	colorPickerImage position: colorPickerImage position + (1@1).

	shadePickerContainer := BorderedMorph new.
	shadePickerImage := ImageMorph new.
	shadePickerContainer
		borderWidth: 1;
		borderColor: (Color r: 0.505 g: 0.505 b: 0.505);
		addMorph: shadePickerImage.
	self addMorph: shadePickerContainer.
	shadePickerImage position: shadePickerImage position + (1@1).
