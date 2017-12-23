sound ops
soundNamed: soundNameOrIndex ifAbsent: absentBlock
	"Return a SoundMedia with the given name (ignoring case differences) or index. If there is none, return the result of evaluating the given block."

	| snd i |
	snd := nil.
	(soundNameOrIndex isKindOf: String) ifTrue: [ "first, try using the argument as a sound name"
		snd := media
			detect: [:el | el isSound and: [(el mediaName compare: soundNameOrIndex) = 2]]
			ifNone: [nil].

		snd ifNil: [
			i := self interpretStringAsNumberIfPossible: soundNameOrIndex.
			i isNumber ifTrue: [
				snd := self soundFromIndex: i]].

		snd ifNil: [^ absentBlock value]].

	snd ifNil: [snd := self soundFromIndex: soundNameOrIndex asNumberNoError].

	snd
		ifNil: [^ absentBlock value]
		ifNotNil: [^ snd]

