initialization
addColorChoosers
	"ColorPicker := SquareColorPicker := nil"

	"color picker is somewhat slow to create, so cache one and copy it"
	(ColorPicker isNil or:
	 [ColorPicker extent ~= (112@108)]) ifTrue: [
		ColorPicker := PaintColorPicker new initFromForm: (ScratchFrameMorph skinAt: #paintCanvasFrame);
			selector: #color1:;
			selector2: #color2:;
			extent: 120@108].
	colorPicker := ColorPicker fullCopy target: canvasMorph palette.

	SquareColorPicker ifNil: [
		SquareColorPicker := PaintColorSquarePicker new initFromForm: (ScratchFrameMorph skinAt: #paintCanvasFrame);
			selector: #color1:;
			selector2: #color2:;
			extent: 120@108].
	colorSquarePicker := SquareColorPicker fullCopy target: canvasMorph palette.
	colorSquarePicker adjustLayoutInset.
	colorPickerButton := ToggleButton
		onForm: (ScratchFrameMorph skinAt: #squareColorSquare)
		offForm: (ScratchFrameMorph skinAt: #colorSquare).
	colorPickerButton
		color: Color transparent;
		target: self;
		borderWidth: 0;
		actionSelector: #presentColorPicker;
		actWhen: #buttonUp.

	self addMorph: colorPickerButton.
	self addMorph: colorSquarePicker.
