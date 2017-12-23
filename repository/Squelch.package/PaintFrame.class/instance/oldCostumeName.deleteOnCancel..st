entry points
oldCostumeName: aString deleteOnCancel: aBoolean
	"Set state used when editing a Scratch costumes or painting a new sprite."

	oldCostumeName := aString.
	deleteSpriteOnCancel := aBoolean.
	aBoolean ifTrue: [canvasMorph editForm: (Form extent: 4@4 depth: 8)].  "clears cat"
