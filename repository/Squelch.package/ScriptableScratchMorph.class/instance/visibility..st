looks ops
visibility: aNumber
	"Set my visibility. 0 is invisible. 100 is fully opaque."

	visibility := (aNumber max: 0) min: 100.
	self changed.
