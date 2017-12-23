file read/write
nameFromFileName: fileName
	"Return the given Scratch file name without the trailing .sb or .scratch extension, if it has one. Ensure the the result is UTF8."

	| s |
	s := fileName.
	(s asLowercase endsWith: '.scratch') ifTrue: [s := s copyFrom: 1 to: s size - 8].
	(s asLowercase endsWith: '.sb') ifTrue: [s := s copyFrom: 1 to: s size - 3].
	"s isUnicode ifFalse: [s := UTF8 withAll: s]."

	^ s

