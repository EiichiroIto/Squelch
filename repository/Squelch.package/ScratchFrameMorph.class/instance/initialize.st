intialization
initialize

	super initialize.
	fillScreenFlag := false.
	paintingInProgress := false.
	projectInfo := Dictionary new.
	watcherPositions := Dictionary new.
	justSaved := false.
	author := ''.
	loginName := ''.
	loginPassword := ''.
	viewMode := #normal.

	self createBasicPanes.
	self createLogo.
	self createMenuPanel.
	self createViewModeButtonsPanel.
	self createStageButtonsPanel.
	self createToolbar.

	self extent: 1000@600.
