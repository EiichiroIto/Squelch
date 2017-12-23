looks ops
setHPanTo: aNumber
	"Set my horizontal pan to the given offset."

	hPan := aNumber truncated.
	self changed.

