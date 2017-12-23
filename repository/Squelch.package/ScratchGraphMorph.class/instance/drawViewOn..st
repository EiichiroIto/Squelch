private
drawViewOn: aCanvas

	"highlights the part of the graph morph we're viewing."
	| y ex start x |

	viewer ifFalse: [^self].
	
	
	start := ((editor graph startIndex*bounds width)/data size) truncated min: data size.
	ex := ((editor slider sliderThickness/editor slider extent x)*(bounds width)) min: data size.

	x := (bounds left + borderWidth + start).
	y := bounds top + borderWidth.

	aCanvas
		fillRectangle: (x@y extent: ex@(self height - (2 * borderWidth)))
		color: Color white. "lightYellow".
