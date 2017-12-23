private
showEmpty
	"Show the empty label."

	| page |
	scrollPane hScrollRelative: 0; vScrollRelative: 0.
	page := scrollPane contents
		removeAllMorphs;
		extent: scrollPane extent.

	numberMorphs size > 0 ifTrue: [numberMorphs := #()].

	emptyMorph
		contents: '(empty)' localized;
		position: (page center - (emptyMorph extent // 2)).
	page addMorph: emptyMorph.

	scrollPane updateScrollbars.
	listLayoutNeeded := false.

