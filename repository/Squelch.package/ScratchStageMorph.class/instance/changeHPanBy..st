looks ops
changeHPanBy: amount
	"Change my horizontal pan by the given amount."

	hPan := hPan + amount truncated.
	self changed.
