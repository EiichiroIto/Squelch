initialization
initialize

	super initialize.

	"position morphs"
	imageMorph := ImageMorph new form: (Form extent: 32@32 depth: 1).
	imageMorph position: 36@55.

	mainColumn addMorph: imageMorph.
