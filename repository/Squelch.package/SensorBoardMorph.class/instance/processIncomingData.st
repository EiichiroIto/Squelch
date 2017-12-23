private
processIncomingData
	"Process incoming bytes from the serial port."
	"Details: To work around a problem with the Prolific USB-Serial drivers on some Windows machines, a strict turn-taking polling protocol is used. A poll byte is sent, the ScratchBoard sends a response, and after a small delay (to be sure that all the data from the last poll has arrived, another poll is sent. The goal is to never allow more that few bytes to accumulate in the serial input buffer and to avoid sending a poll byte while data is arriving. However, since different versions of the ScratchBoard may send different amounts of data, we don't want to hard-code the number of reply bytes. Thus"

	| buf msecsSinceLastPoll |
	(self portIsOpen and: [#on = scanState]) ifFalse: [^ self].

	useGoGoProtocol ifTrue: [
		buf := port readByteArray.
		buf do: [:b | self processGoGoByte: b].
		^ self].

	msecsSinceLastPoll := Time millisecondClockValue - lastPollMSecs.
	msecsSinceLastPoll < 20 ifTrue: [^ self].

	buf := port readByteArray.
	buf do: [:b | self processScratchByte: b].

	port nextPut: 1.	"send a ScratchBoard V4 poll byte"
	lastPollMSecs := Time millisecondClockValue.

