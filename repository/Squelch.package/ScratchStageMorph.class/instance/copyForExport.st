accessing
copyForExport
	"Answer a copy of me with no sprites for use in exporting the background by itself."

	^ super copyForExport removeAllMorphs
