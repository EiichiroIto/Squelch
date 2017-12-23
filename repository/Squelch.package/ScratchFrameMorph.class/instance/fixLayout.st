geometry
fixLayout

	| stageExtent xyReadout w |
	stageExtent :=
		workPane isQuarterSize
			ifTrue: [workPane extent // 2]
			ifFalse: [workPane extent].

	topPane
		position: self topLeft;
		width: self width;
		height: (menuPanel height + 0 max: logoMorph height + 10).

	stageFrame
		extent: stageExtent + (14@42);
		top: topPane bottom;
		right: self right.

	workPane position: stageFrame topLeft + (4@37).

	titlePane
		position: stageFrame topLeft + (0@1);
		width: stageFrame width - 6;
		height: 36.

	self fixProjectTitleMorphLayout.

	scriptsPane fixLayout.
	w := (viewerPane catButtonsExtent x + 17)
		min: (self width - (scriptsPane bareMinimumWidth + stageFrame width))
		max: 40.
	viewerPane position: topPane bottomLeft;
		width: w;
		height: self bottom - topPane bottom.

	scriptsPane
		position: viewerPane topRight;
		width: self width - (stageFrame width + viewerPane width);
		height: self bottom - topPane bottom;
		fixLayout.

	libraryPane position: stageFrame bottomLeft;
		width: (self right - scriptsPane right);
		height: self bottom - libraryPane top.

	menuPanel
		left: logoMorph right + 18;
		top: topPane top + ((topPane height - menuPanel height) // 2) + 2.

	viewModeButtonsPanel
		right: stageFrame right - 8;
		top: self top + 7.

	stageButtonsPanel
		position: (stageFrame left + 10)@(topPane bottom + 5);
		width: stageFrame width - 28;
		height: (workPane top - stageFrame top) - 8.

	xyReadout := readoutPane submorphs at: 1.
	readoutPane
		width: xyReadout width + 23;
		height: xyReadout height + 15;
		position: stageFrame bottomRight - ((readoutPane width + 6)@3).
	xyReadout position: readoutPane position + (18@5).

	toolbarPanel
		left: (stageFrame left - 4 max: menuPanel right);
		top: self top + ((topPane height - toolbarPanel height) // 2) + 3.

	((toolbarPanel right - 5) > viewModeButtonsPanel left)
		ifTrue: [toolbarPanel delete]
		ifFalse: [
			(toolbarPanel owner = self) ifFalse: [
				self addMorphFront: toolbarPanel]].
