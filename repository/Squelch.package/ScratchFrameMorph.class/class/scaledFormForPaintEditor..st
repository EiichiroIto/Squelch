utilities
scaledFormForPaintEditor: aForm
	"Answer either the given form or a copy of it scaled down to fit into the paint editor."
	"This method supports a quick fix to the following problem: When a big image is loaded onto a sprite and then edited in the image editor, (a) you cannot edit offscreen pixels and (b) if you click 'OK' to accept the edits, the image will be cropped. This fix resizes the loaded image to fit into paint editor canvas to avoid these problems. In the longer term, we should fix the paint editor to allow editing images larger than the canvas size."

	| maxExtent scale |
	maxExtent := WorkpaneExtent.
	((aForm width <= maxExtent x) and:
	 [aForm height <= maxExtent y])
		ifTrue: [^ aForm].

	scale := (maxExtent x / aForm width) min: (maxExtent y / aForm height).
	^ ScratchPlugin scale: aForm by: scale
