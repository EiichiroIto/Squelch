looks ops
think: stringOrNum duration: durationSecs elapsed: elapsedMSecs from: startPoint

	startPoint ifNil: [^ self think: stringOrNum].  "first call, show think bubble"
	elapsedMSecs >= (1000 * durationSecs) ifTrue: [self sayNothing].  "clear bubble"
