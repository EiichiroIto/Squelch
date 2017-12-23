drawing
drawOn: aCanvas
	"Draw myself if my visibility is > 0. If my visibility is 1, draw using the normal 'paint' mode. Otherwise, draw using 'alpha' resulting in a partially transparent rendering."

	| f alpha |
	f := self filteredForm.
	visibility < 100 ifTrue: [
		visibility > 0 ifTrue: [
			alpha := ((255.0 * visibility) / 100.0) truncated.
			aCanvas paintImage: f at: bounds origin sourceRect: f boundingBox alpha: alpha].
		^ self].

	aCanvas paintImage: f at: bounds origin.
