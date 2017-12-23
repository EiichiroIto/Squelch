motion ops
glideSecs: duration toX: endX y: endY elapsed: elapsed from: startPoint
	"Interpolate my position from my current postion to the given x and y over the given duration. If startPoint is nil, just answer my current position; this sets the starting point for the interpolation."

	| fraction endPoint |
	startPoint ifNil: [^ self referencePosition].
	endPoint := endX@endY.
	duration < 0.001
		ifTrue: [fraction := 1]
		ifFalse: [fraction := elapsed asFloat / (1000.0 * duration)].
	fraction > 1.0 ifTrue: [fraction := 1].
	fraction < 0.0 ifTrue: [fraction := 0].
	self referencePosition: startPoint + (fraction * (endPoint - startPoint)) truncated.
