initialization
initVertical: aBoolean

	aBoolean
		ifTrue: [
		 	self vFrameForm: (ScratchFrameMorph skinAt: #vScrollFrame)
				sliderForm: (ScratchFrameMorph skinAt: #vScrollSlider)]
		ifFalse: [
		 	self hFrameForm: (ScratchFrameMorph skinAt: #hScrollFrame)
				sliderForm: (ScratchFrameMorph skinAt: #hScrollSlider)].
