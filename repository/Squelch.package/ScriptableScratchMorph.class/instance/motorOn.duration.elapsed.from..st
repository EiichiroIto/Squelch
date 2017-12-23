motor ops
motorOn: motorName duration: secs elapsed: elapsedMSecs from: motorID
	"Turn the given motor on for the given number of seconds."

	motorID ifNil: [  "first call, start motor"
		self motorOn: motorName.
		^ motorName].

	elapsedMSecs >= (1000 * secs) ifTrue: [self motorOff: motorID].
