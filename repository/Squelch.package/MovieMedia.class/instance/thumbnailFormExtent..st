accessing
thumbnailFormExtent: extent
	"Answer a Form of the given extent containing a thumbnail of me."

	| f scale shrunk icon |
	f := (Form extent: extent depth: 32) fillWhite.
	self movieFileIsOpen ifFalse: [^ f].

	movieFile hasVideo ifTrue: [
		movieFile videoSetFrame: 1 stream: 0.
		movieFile videoReadFrameInto: origForm stream: 0.
		scale := (f width / origForm width) min: (f height / origForm height).
		shrunk := origForm magnify: origForm boundingBox by: scale smoothing: 2.
		shrunk displayOn: f at: (f extent - shrunk extent) // 2 rule: Form paint.
		^ f].

	movieFile hasAudio ifTrue: [
		icon := ScratchFrameMorph skinAt: #scratchSound.
		icon displayOn: f at: (f extent - icon extent) // 2 rule: Form paint].

	^ f
