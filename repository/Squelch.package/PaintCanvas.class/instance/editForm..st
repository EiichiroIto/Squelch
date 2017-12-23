entry points
editForm: aForm
	"Set the Form that I should edit. Make a copy of the original Form."

	self editForm: aForm regPoint: aForm center textBox: nil isStage: false.
