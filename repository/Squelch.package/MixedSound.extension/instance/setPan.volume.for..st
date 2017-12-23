*Squelch
setPan: leftRightPan volume: volume for: index
	| pan vol |
	pan := ((leftRightPan * ScaleFactor) asInteger max: 0) min: ScaleFactor.
	vol := ((volume * ScaleFactor) asInteger max: 0) min: ScaleFactor.
	leftVols at: index put: (ScaleFactor - pan) * vol // ScaleFactor.
	rightVols at: index put: pan * vol // ScaleFactor