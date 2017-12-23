accessing
scale: aNumber
	"Set the scale factor of my view. For example, 8 shows each pixel of canvas at eight times its actual size." 

	| oldCenter |
	oldCenter := self screenToCanvas: self center.
	scale := aNumber asFloat max: 0.01.
	self centerAt: oldCenter.
