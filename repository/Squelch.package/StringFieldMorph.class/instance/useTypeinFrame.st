initialization
useTypeinFrame

	frame := ImageFrameMorph new initFromForm: (ScratchFrameMorph skinAt: #typein).
	insetX := 2.
	heightPadding := 5.
	borderWidth := 2.
	self font: stringMorph font.
