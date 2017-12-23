I am the top-level of the paint editor. I have the following morphic compontents:

	canvasMorph			the area in which drawing is done
	paletteMorph			a palette of painting controls
	hScrollbar				horizontal scrollbar
	vScrollbar				vertical scrollbar
	transformButtons		an Array of button morphs for image transforms (flip, etc.)
	canvasButtons			an Array of button morphs for image transforms (flip, etc.)
	fileButtons				an Array of button morphs for import/export
	colorSquarePicker		an array of color squares
	colorPicker				a continuous color palette
	scaleMorph				string showing the current scale
	scaleMenuBar			menu bar frame round the scaleMorph

My other instance variables are:

	canvasFrame			the frame around canvasMorph
	scratchFrame			the ScratchFrame that created me (optional)
	originalObject			the source of the form being edited; informed if ok button pressed
	oldCostumeName			name of the Scratch costume being edited (optional)
	deleteSpriteOnCancel		true if operation is "paint a new sprite" (optional)

The optional values are not needed when editing a non-Scratch object such as an ImageMorph.
