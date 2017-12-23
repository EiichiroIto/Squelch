looks ops
setZoomTo: percent
	"Set my zoom to the given percent."

	zoom := percent truncated.
	self changed.
