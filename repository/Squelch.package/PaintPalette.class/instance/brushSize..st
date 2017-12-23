accessing
brushSize: aNumber
	"Set the brush size for painting and erasing."

	mode = #erase
		ifTrue: [eraserSize := aNumber]
		ifFalse: [brushSize := aNumber].

	brushSizeMenu ifNotNil: [brushSizeMenu delete].
	self updateOptionsPane.
