viewing
zoom: aNumber

	scale := ((scale*aNumber asFloat) max: MinScale asFloat) min: 1.
	
	self calculateDataArray.
	self flushCachedForm; changed.
	editor viewer flushCachedForm; changed.

	editor updateSlider.