dropping/grabbing
rootForGrabOf: aMorph
	"Allow the given submorph to be extracted."

	| root |
	root := aMorph.
	[root = self] whileFalse: [
		root owner == self ifTrue: [^ root].
		root := root owner].

	^ super rootForGrabOf: aMorph
