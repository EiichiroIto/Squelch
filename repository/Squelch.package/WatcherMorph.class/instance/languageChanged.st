accessing
languageChanged
	"Force label update after switching languages."

	lastTargetName := nil.
	self updateTargetName.
	readout target: readout target.  "forces contents to update"
	titleMorph extent: (ScratchTranslator stringExtent: titleMorph contents font: titleMorph font).
	readout extent: (ScratchTranslator stringExtent: readout contents font: readout font).
