accessing
thumbnailFormExtent: extent
	"Answer a Form of the given extent containing a thumbnail of me. This default implementation answers a blank thumbnail."

	^ (Form extent: extent depth: 2) fillWhite
