event handling
mouseDown: evt

	evt yellowButtonPressed ifTrue: [^ self rightButtonMenu].

	evt hand toolType: nil.

	self on.
	actWhen = #buttonDown ifTrue: [
		self doButtonAction.
		self off].

