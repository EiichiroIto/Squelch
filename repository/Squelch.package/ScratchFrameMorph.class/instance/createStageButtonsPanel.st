intialization
createStageButtonsPanel
	"Create and add a panel containing the project title, green flag, and stop buttons."

	| buttonSpecs bName button |
	"create panel"
	stageButtonsPanel := AlignmentMorph new
		color: Color transparent;
		listCentering: #center;
		height: 20.

	projectTitleMorph := StringMorph new
		forceUnicodeRendering: true;
		contents: '';
		font: (ScratchFrameMorph getFont: #FrameMorphProjectTitle).
	stageButtonsPanel
		addMorphBack: projectTitleMorph;
		addMorphBack: (AlignmentMorph newSpacer: Color transparent).

	"buttonSpecs defines the toolbar buttons; first is icon name, second is selector"
	buttonSpecs := #(
		"name	selector		tool tip"
		(go		shoutGo		'Start green flag scripts')
		(stop	stopAll		'Stop everything')).

	buttonSpecs do: [:spec |
		bName := spec first.
		button := ToggleButton
			onForm: (ScratchFrameMorph skinAt: (bName, 'ButtonGrayPressed') asSymbol)
			offForm: (ScratchFrameMorph skinAt: (bName, 'ButtonGray') asSymbol)
			overForm: (ScratchFrameMorph skinAt: (bName, 'ButtonGrayPressed') asSymbol).
		button
			target: self;
			actionSelector: (spec at: 2);
			isMomentary: true;
			setProperty: #balloonText toValue: (spec at: 3) localized.

		stageButtonsPanel addMorphBack: button.
		bName = #go ifTrue: [
			flagButton := button.
			stageButtonsPanel addMorphBack: (Morph new color: Color transparent; extent: 2@5)]].

	titlePane addMorph: stageButtonsPanel.
