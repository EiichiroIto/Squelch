looks ops
changeVPanBy: amount
	"Change my vertical pan by the given amount."

	vPan := vPan + amount truncated.
	self changed.
