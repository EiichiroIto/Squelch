accessing
thumbnailFormExtent: extent
	"Answer a Form of the given extent containing a thumbnail of me."

	| f compositeF scale shrunk |
	f := (Form extent: extent depth: 32) fillColor: Color transparent.
	form ifNotNil: [
		compositeF := self compositeForm.
		scale := (f width / compositeF width) min: (f height / compositeF height).
		scale < 1
			ifTrue: [
				shrunk := (compositeF asFormOfDepth: 32)
					magnify: compositeF boundingBox
					by: scale
					smoothing: 2]
			ifFalse: [
				shrunk := compositeF].

		shrunk displayOn: f at: (f extent - shrunk extent) // 2 rule: Form paint].
	^ f
