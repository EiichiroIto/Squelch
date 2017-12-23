entry points
editForm: aForm regPoint: regPoint textBox: savedTextBox isStage: isStage
	"Set the Form and textBox that I should edit. Make a copy of the original Form."

	| p |
	canvasForm := Form extent: (aForm extent max: self extent) depth: 32.
	p := (((canvasForm extent // 2) - regPoint) min: (canvasForm extent - aForm extent)) max: 0@0.
	aForm displayOn: canvasForm at: p rule: Form paint.
	registrationPoint := p + regPoint.
	bgForm := self makeCheckerboard.
	self clearTextBox.
	undoList := OrderedCollection new.
	undoIndex := 0.
	scrollX := scrollY := 0.
	self clearMoveState.

	savedTextBox ifNotNil: [  "install saved textbox"
		textBox := savedTextBox copy.
		isStage ifFalse: [textBox position: p + textBox position].
		textBox extent: (self extent - textBox topLeft).
		textColor := textBox textColor.
		textBox
			suppressAntiAliasing: true;
			renderWithSqueak: true;
			textColor: Color black;
			borderWidth: 0].

	self changed.
