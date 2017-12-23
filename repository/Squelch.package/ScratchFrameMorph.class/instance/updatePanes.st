private
updatePanes

	| p |
	menuPanel delete.
	self createMenuPanel.

	toolbarPanel delete.
	self createToolbar.

	viewModeButtonsPanel delete.
	self createViewModeButtonsPanel.

	stageButtonsPanel delete.
	self createStageButtonsPanel.
	titlePane addMorph: stageButtonsPanel.

	scriptsPane tabPane delete.
	scriptsPane createTabPane.

	readoutPane delete.
	self createReadoutPane.

	workPane sensorBoard owner
		ifNil: [p := nil]
		ifNotNil: [p := workPane sensorBoard position].

	workPane sensorBoard addReadouts.
	p ifNotNil:[
		self showSensorBoard.
		workPane sensorBoard position: p].

	libraryPane clearLibrary.

	self scratchWatchers do: [:w | w languageChanged].
	self listWatchers do: [:w | w fixLayoutForNewLanguage].

	World startSteppingSubmorphsOf: self.
	self fixLayout.
	scriptsPane fixLayout.
	self updateViewModeButtons.
