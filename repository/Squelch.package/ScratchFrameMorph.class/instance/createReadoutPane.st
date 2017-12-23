intialization
createReadoutPane
	"Create and add my presentation mode button, new sprite buttongs, and mouse readout pane."

	| xyReadout |

	readoutPane := ImageFrameMorph new initFromForm: (ScratchFrameMorph skinAt: #mouseReadoutPane).
	xyReadout := self makeXYReadout.
	readoutPane	 addMorph: xyReadout.

	"make pane sticky so clicking on it doesn't pick up entire frame"
	self addMorph: readoutPane beSticky.
