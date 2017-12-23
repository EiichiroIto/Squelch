utilities
open
	"ScratchFrameMorph open"

	ScratchFrameMorph new
		extent: Display extent - 50;
		position: 0 @ 0;
		startup;
		newScratchProject;
		openInWorld