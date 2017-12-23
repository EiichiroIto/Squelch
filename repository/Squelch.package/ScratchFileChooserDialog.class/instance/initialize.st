initialization
initialize
	"Create the file chooser dialog box"

	super initialize.
	choosingFolder := false.
	scratchFrame := nil.
	readingScratchFile := false.

	newTitleBin := AlignmentMorph newRow
		wrapCentering: #center;
		color: Color transparent.
	buttonRow hResizing: #spaceFill.

	self withButtonsForYes: false no: false okay: true cancel: true.
