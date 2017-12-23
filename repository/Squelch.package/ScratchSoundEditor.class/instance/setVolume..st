menu
setVolume: aFloat

	"aFloat is a value btw 0 and 1.0"
	
	snd ifNil: [^self].
	snd adjustVolumeTo: aFloat overMSecs: 50.