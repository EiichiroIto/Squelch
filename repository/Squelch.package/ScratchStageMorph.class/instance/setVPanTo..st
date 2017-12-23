looks ops
setVPanTo: aNumber
	"Set my vertical pan to the given offset."

	vPan := aNumber truncated.
	self changed.

