initialization
useStringFieldFrame

	frame := ImageFrameMorph new initFromForm: (ScratchFrameMorph skinAt: #stringFieldFrame).
	insetX := 3.
	heightPadding := 9.
	borderWidth := 5.
	self font: stringMorph font.
