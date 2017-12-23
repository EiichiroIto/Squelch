instance creation
editNotesFor: aScratchFrameMorph
	"Choose a name for sharing the current Scratch project file. Display the project thumbnail and info string and allow the info string to be edited. Answer the new project name."

	^ self new
		createNotesDialogFor: aScratchFrameMorph;
		extent: 350@450.
