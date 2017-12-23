intialization
createBasicPanes
	"Create and add my palette (viewer), script editor, stage, and library panes."

	topPane := ImageFrameMorph new initFromForm: (ScratchFrameMorph skinAt: 'topPane').
	viewerPane := ScratchViewerMorph new rebuildCategorySelectors.	
	scriptsPane := ScratchScriptEditorMorph new.
	stageFrame := ImageFrameMorph new initFromForm: (ScratchFrameMorph skinAt: 'stagePane').
	titlePane := ImageFrameMorph new initFromForm: (ScratchFrameMorph skinAt: 'titlePane').
	workPane := ScratchStageMorph new extent: WorkpaneExtent.
	libraryPane := ScratchLibraryMorph new.

	"make panes sticky so clicking on them doesn't pick up entire frame"
	self
		addMorph: topPane beSticky;
		addMorph: viewerPane beSticky;
		addMorph: scriptsPane beSticky;
		addMorph: stageFrame beSticky;
		addMorph: workPane beSticky;
		addMorph: titlePane beSticky;
		addMorph: libraryPane beSticky.

	self createReadoutPane.
	workPane comeToFront.
