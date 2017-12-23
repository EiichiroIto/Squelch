accessing
getTabTop
	"Used by ScratchFrameMorph when creating the tab pane. This returns the y position of where the top of the tabs should align. This situation is unfortunate (tabs should probaby be part of ScratchScriptEditorMorph), but we'll fix it later."

	ScratchFrameMorph isXO ifTrue: [^ thumbnailMorph bottom + 20].
	(readoutMorphs size > 0)
		ifTrue: [^ (readoutMorphs at: 1) bottom + 6]
		ifFalse: [^ nameMorph bottom + 5 + (ScratchTranslator stringExtent: '0' font: (ScratchFrameMorph getFont: #XYReadoutBold)) y + 6].
