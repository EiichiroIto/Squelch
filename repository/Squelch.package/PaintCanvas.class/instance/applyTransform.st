private-tranforms
applyTransform
	"Apply the current transform."

	| f degrees |
	f := transformSrcForm.
	degrees := transformDegrees.
	transformHFlip ifTrue: [degrees := degrees negated].
	transformVFlip ifTrue: [degrees := degrees negated].
	degrees ~= 0.0 ifTrue: [f := f rotateBy: degrees].
	transformScale ~= 1.0 ifTrue: [
		f := f magnify: f boundingBox by: transformScale smoothing: 1].
	transformHFlip ifTrue: [	f := f flipBy: #horizontal centerAt: f boundingBox center].
	transformVFlip ifTrue: [	f := f flipBy: #vertical centerAt: f boundingBox center].
	f := f copy: (f rectangleEnclosingPixelsNotOfColor: Color transparent).
	f offset: nil.
	moveOrStampForm := f.
	selectionRect := (selectionRect center - (f extent // 2)) extent: f extent.
	self changed.
