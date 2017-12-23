accessing
scale: aNumber

	"setting the absolute scale of how the graph is display.  It is relative to MinScale, the minimum scale possible, which is the scale value of the viewer."

	aNumber < 1 ifTrue: [^self].
	scale := (aNumber*MinScale) asFloat min: 1.
	
	self calculateDataArray.
	self flushCachedForm; changed.
	editor viewer flushCachedForm; changed.

	editor updateSlider.
