menu
slower

	| rate |
	rate := rateSlider getScaledValue/1.1.
	rateSlider setScaledValue: rate.
	self samplingRate: rate.

	