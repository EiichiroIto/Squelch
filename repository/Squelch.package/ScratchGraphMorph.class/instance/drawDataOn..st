private
drawDataOn: aCanvas

	| x start end left right yScale baseLine top bottom |
	super drawOn: aCanvas.

	viewer ifTrue: [self drawViewOn: aCanvas.].
	self drawSelectionOn: aCanvas.

	(posVals isNil) ifTrue: [^ self].

	maxVal = minVal ifTrue: [yScale := 1.] 
					ifFalse: [yScale := (bounds height - (2 * borderWidth)) asFloat / (maxVal - minVal)].
	baseLine := bounds bottom - borderWidth + (minVal * yScale) truncated.

	left := 0. right := 10.
	x := bounds left + borderWidth.

	start := (startIndex*scale) truncated min: data size max: 1.
	end := start + bounds width min: data size.

	start to: end do: [:i |
		i > posVals size ifTrue: [^self].
					
		left := x truncated. right := x + 1.
		right > (bounds right - borderWidth) ifTrue: [^ self].

		top := baseLine min: (baseLine - (yScale*(posVals at: i))) truncated.
		bottom := (baseLine max: baseLine - (yScale*(negVals at: i))) truncated.
											
		aCanvas fillRectangle: (left@top corner: right@bottom) color: dataColor.
		x := x + 1].