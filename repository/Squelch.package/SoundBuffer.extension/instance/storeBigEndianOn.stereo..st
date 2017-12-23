*Squelch
storeBigEndianOn: aBinaryStream stereo: stereo
	"Store my samples onto the given stream in big-endian format (most-significant byte first)."

	| reverseBytes |
	reverseBytes := Smalltalk isBigEndian not.
	reverseBytes
		ifTrue: [ self reverseEndianness ].
	aBinaryStream next: self size // 2 putAll: self startingAt: 1.
	reverseBytes
		ifTrue: [ self reverseEndianness ]