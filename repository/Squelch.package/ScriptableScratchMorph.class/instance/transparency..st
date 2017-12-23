looks ops
transparency: aNumber
	"Set my transparency. 0 is opaque; 100 is transparent."

	self visibility: (100 - aNumber abs).
