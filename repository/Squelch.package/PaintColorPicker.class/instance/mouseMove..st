event handling
mouseMove: evt

	target ifNil: [^ self].

	((colorPickerImage bounds containsPoint: evt cursorPoint) or: [
	 (shadePickerImage bounds containsPoint: evt cursorPoint)]) ifTrue: [
		selectedColor := Display colorAt: evt cursorPoint].

	evt shiftPressed | evt yellowButtonPressed
		ifTrue: [selector2 ifNotNil: [target perform: selector2 with: selectedColor]]
		ifFalse: [selector ifNotNil: [target perform: selector with: selectedColor]].
