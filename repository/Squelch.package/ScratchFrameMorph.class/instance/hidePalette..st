geometry
hidePalette: hidePalette
	"Hide or show the blocks palette."

	hidePalette = viewerPane owner isNil ifTrue: [^ self].  "no change"

	hidePalette
		ifTrue: [
			viewerPane delete.
			scriptsPane
				initFrontFromForm: (ScratchFrameMorph skinAt: #blocksPaletteFrameTransparent2) topSectionHeight: 90;
				middleBarLeftMargin: 5 rightMargin: 0]
		ifFalse: [
			self addMorph: viewerPane.
			scriptsPane
				initFrontFromForm: (ScratchFrameMorph skinAt: #scriptPaneFrameTransparent2) topSectionHeight: 90;
				middleBarLeftMargin: 0 rightMargin: 0].

	scriptsPane color: (Color r: 149/255 g: 154/255 b: 159/255).
