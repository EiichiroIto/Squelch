sound ops
playSound: soundName

	| snd |
	snd := self soundNamed: soundName ifAbsent: [^ self].
	snd playFromStart.
