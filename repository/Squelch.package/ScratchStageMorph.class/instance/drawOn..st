drawing
drawOn: aCanvas
	"Draw myself if my visibility is > 0. If my visibility is 1, draw using the normal 'paint' mode. Otherwise, draw using 'alpha' resulting in a partially transparent rendering."

	| clipC f p alpha |
	clipC := aCanvas copyClipRect: bounds.
	clipC fillRectangle: bounds color: Color white.
	f := self filteredForm.

	f ifNotNil: [
		p := bounds center - (f extent // 2) + (hPan@vPan).
		visibility < 100
			ifTrue: [
				visibility > 0 ifTrue: [
					alpha := ((255.0 * visibility) / 100.0) truncated.
					clipC paintImage: f at: p sourceRect: f boundingBox alpha: alpha]]
			ifFalse: [clipC paintImage: f at: p]].

	self updateTrailsForm.
	penTrailsForm ifNotNil: [clipC paintImage: penTrailsForm at: self position].
