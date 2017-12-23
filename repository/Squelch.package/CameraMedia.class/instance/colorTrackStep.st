playing
colorTrackStep

	| p |
	p := VideoSensorPlugin
		trackColorIn: frameForm bits
		width: frameForm width
		rgb: ScratchFrameMorph colorToTrack asPackedRGB
		threshold: 50.
	p ifNil: [p := frameForm extent // 2].

	frameForm fill: (p - (15@3) extent: 30@6) fillColor: Color yellow.
	frameForm fill: (p - (3@15) extent: 6@30) fillColor: Color yellow.
