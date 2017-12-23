geometry
fixLayout

	canvasMorph ifNil: [^ self].
	canvasMorph position: (self right - canvasMorph width - 55)@(self top + 42).
	canvasButtons position: (self left + 20)@(canvasMorph top + 80).
	paletteMorph position:
		(self left + 20)@(canvasButtons bottom + 5).
	hScrollbar
		position: canvasMorph bottomLeft + (0@9);
		width: canvasMorph width.
	vScrollbar
		position: canvasMorph topRight + (9@0);
		height: canvasMorph height.

	titleBin left: self left + ((self width - titleBin width) // 2) - 5.
	fileButtons position: (self left + 20)@(canvasButtons top - 35).
	transformButtons position: (self left + 18)@(canvasMorph top).
	colorSquarePicker position: (self left + 25)@(paletteMorph bottom - 55).
	colorPickerButton position: (colorSquarePicker right + 5)@(colorSquarePicker top + 30).
	setRotationCenterMorph position: (self left + (((canvasMorph left - self left) - setRotationCenterMorph width) // 2)) @ (colorSquarePicker bottom - 3).
	buttonRow position: (self right - buttonRow width - 30)@(self bottom - buttonRow height - 22).
	canvasFrame position: canvasMorph position - (4@4).
	zoomBar position: (canvasMorph left - zoomBar width - 15)@(setRotationCenterMorph top - 21).
