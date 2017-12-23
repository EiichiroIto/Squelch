interaction
yes
	"Save the edited form back to the original object."

	| triple |
	originalObject ifNil: [^ self exitPaintEditor].

	triple := self newFormTextBoxAndRegPoint.
	triple ifNil: [^ self beep; cancelled].

	originalObject
		editedForm: triple first textBox: triple second;
		rotationCenter: triple third.
	self exitPaintEditor.
	super yes.
