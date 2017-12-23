initialization
addRuler

	ruler := ScratchRulerMorph graphMorph: self.
	self addMorphBack: ruler.
	ruler position: self bottomLeft.
