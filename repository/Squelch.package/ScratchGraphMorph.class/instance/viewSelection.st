viewing
viewSelection

	| diff |
	selection ifNil: [^self].
	scale := (MinScale*(data size/(selection second - selection first)) asFloat min: 1).
	self calculateDataArray.

	diff := (selection second - selection first) - bounds width.
	diff < 0
		ifTrue: [ self startIndex: selection first asInteger + (diff//2)]
		ifFalse: [self startIndex: selection first asInteger.].
	
	
	editor updateSlider.


	