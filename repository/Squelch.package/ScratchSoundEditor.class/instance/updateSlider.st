other
updateSlider

	"this is the order that these methods have to be called in order to update slider!!!"
	graph computeSlider.  
	self fixSliderRange.
	self updateSliderValue.