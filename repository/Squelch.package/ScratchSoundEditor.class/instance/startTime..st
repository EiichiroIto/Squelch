graph ops
startTime: hrMinSecs
	
	| secs hrs mins hms |
	hms := hrMinSecs findTokens: ' :.'.
	hrs := hms at: 1.
	mins := hms at: 2.
	secs := hms at: 3.
	self startIndex: ((hrs asNumber * 3600) + (mins asNumber * 60) + secs asNumber) * samplingRate.
