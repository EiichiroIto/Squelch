geometry
extent: newExtent

	newExtent = self extent ifFalse: [
		super extent: newExtent.
		(colorPickerContainer notNil and:
		 [shadePickerContainer notNil]) ifTrue: [
			colorPickerContainer
				extent: (newExtent x - 8)@(newExtent y - 22);
				position: (self left + 4)@(self top + 4).
			shadePickerContainer
				extent: (newExtent x - 8)@(9);
				position: (self left + 4)@(self bottom - 15).
			self createColorWheels]].
