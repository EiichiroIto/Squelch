motor ops
motorOnFor: secs elapsed: elapsedMSecs from: motorID
	"Turn all motors on for the given number of seconds."

	motorID ifNil: [  "first call, start motor"
		self motorOn: ' '.
		^ #' '].

	elapsedMSecs >= (1000 * secs) ifTrue: [self motorOff: motorID].
