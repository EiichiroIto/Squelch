looks ops
changeZoomBy: percent
	"Change my zoom by the given percent."

	zoom := zoom + percent.
	self changed.
