accessing
thumbnailFormExtent: extent
	"Answer a Form of the given extent containing a thumbnail of me."

	| f scale shrunk |
	f := (Form extent: extent depth: 16) fillColor: Color gray.
	frameForm ifNotNil: [
		scale := (f width / frameForm width) min: (f height / frameForm height).
		shrunk := (frameForm asFormOfDepth: 16) magnify: frameForm boundingBox by: scale smoothing: 1.
		shrunk displayOn: f at: (f extent - shrunk extent) // 2 rule: Form paint].
	^ f
