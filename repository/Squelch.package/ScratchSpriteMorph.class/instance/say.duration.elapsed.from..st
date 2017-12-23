looks ops
say: stringOrNum duration: durationSecs elapsed: elapsedMSecs from: startPoint

	startPoint ifNil: [^ self say: stringOrNum].  "first call, show talk bubble"
	elapsedMSecs >= (1000 * durationSecs) ifTrue: [self sayNothing].  "clear bubble"
