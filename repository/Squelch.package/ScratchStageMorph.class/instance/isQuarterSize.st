accessing
isQuarterSize

	isQuarterSize ifNil: [isQuarterSize := false].  "lazy initialization"
	^ isQuarterSize
