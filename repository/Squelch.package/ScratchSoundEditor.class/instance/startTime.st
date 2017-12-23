graph ops
startTime
	
	| ss |
	"secs := cursor / samplingRate.
	hrs := secs // 3600.
	mins := (secs \\ 3600) // 60.
	secs := secs \\ 60 asFloat.
	ms := ((secs \\ 1) * 100) asFloat truncated.
	secs := secs // 1."

	" hrs asString,':',mins asString, ':', secs asString, '.', ms asString."
	
	origSamplingRate isNil
		ifTrue: [ss := 20000]
		ifFalse: [ss := origSamplingRate].
	^ ((cursor asFloat/ss) roundTo: 0.01) asString.