intialization
createLogo
	"Create and the Scratch logo."

	logoMorph := (ScratchFrameMorph skinAt: #scratchLogo) asMorph.
	logoMorph position: topPane position + (12@8).
	topPane addMorph: logoMorph.
