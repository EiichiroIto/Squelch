looks ops
goBackByLayers: aNumber
	"Decrease my layer by (i.e., move me towards the back by) the given number of layers."

	owner ifNil: [^ self].
	self layer: (owner submorphs indexOf: self) + aNumber truncated.
