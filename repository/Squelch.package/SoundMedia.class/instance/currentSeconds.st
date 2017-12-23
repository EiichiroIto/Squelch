accessing
currentSeconds

	playingSound
		ifNil: [^ 0]
		ifNotNil: [^ playingSound sounds first currentPosition].
