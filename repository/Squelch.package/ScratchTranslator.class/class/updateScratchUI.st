rendering menu
updateScratchUI
	"Update the UI of all ScratchFrameMorphs after changing the font or font scale."

	RenderCenterOffsetCache := RenderCenterOffsetCache species new.
	RenderVerticalTrimCache := RenderVerticalTrimCache species new.
	ScratchFrameMorph allInstancesDo: [:m | m rebuildUIForNewLanguage].
