sound ops
soundFromIndex: aNumber
	"Return a sound for the given number--rounded and modulo the number of costumes. Return nil if there are not sounds."

	| soundList i |
	soundList := media select: [:m | m isSound].
	soundList size = 0 ifTrue: [^ nil].

	i := ((aNumber rounded - 1) \\ soundList size) + 1.
	^ soundList at: i
