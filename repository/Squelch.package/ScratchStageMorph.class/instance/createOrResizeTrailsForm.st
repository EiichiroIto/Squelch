pen support
createOrResizeTrailsForm
	"If necessary, create a new penTrailsForm or resize the existing one to fill my bounds. On return, penTrailsForm will be a Form of the correct size."

	| newForm |
	penTrailsForm ifNil: [
		penTrailsForm := Form extent: self extent depth: 32.
		^ self].

	penTrailsForm extent = self extent ifFalse: [  "resize trails Form to my current exent"
		newForm := Form extent: self extent depth: 32.
		newForm
			copy: penTrailsForm boundingBox
			from: penTrailsForm
			to: 0@0
			rule: Form paint.
		penTrailsForm := newForm].
