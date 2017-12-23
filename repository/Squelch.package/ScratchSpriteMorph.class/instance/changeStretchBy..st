looks ops
changeStretchBy: delta
	"Change my aspect ratio by the given amount."

	| currentStretch |
	currentStretch := (100.0 * scalePoint x) / scalePoint y.
	self setStretchTo: (currentStretch + delta).
