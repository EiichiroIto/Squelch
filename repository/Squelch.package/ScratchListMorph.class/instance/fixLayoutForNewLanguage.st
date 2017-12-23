geometry
fixLayoutForNewLanguage
	"This method updates the height and word-wrapping of cells after a language or font change."

	| cellContents oldH |
	cellMorphs size = 0 ifTrue: [self fixLayout. ^ self showEmpty].
	cellContents := cellMorphs first firstSubmorph.
	oldH := cellContents height.
	cellContents font: cellContents font.
	cellContents height = oldH ifTrue: [self fixLayout. ^ self].  "no size change"

	scrollPane vScrollRelative: 0.
	cellMorphs do: [:c | c firstSubmorph font: c firstSubmorph font].
	self fixLayout.
