geometry
fixLayout

	| y x |
	"layout readout morphs vertically"
	y := nameMorph bottom + 5.
	readoutMorphs do: [:m |
		m position: m left@y].

	"layout readout and name morphs horizontally"
	nameMorph position: (thumbnailMorph topRight + (17@(thumbnailMorph height * 0.12))).
	x := nameMorph left.
	readoutMorphs do: [:m |
		m position: x@m top.
		x := m right + 5].

	"layout lock and pen morphs"
	lockButton ifNotNil: [
		lockButton position: (nameMorph right + 4)@(nameMorph top + ((nameMorph height - lockButton height) / 2)).
		penReadout position: (lockButton right + 4)@(nameMorph top + ((nameMorph height - penReadout height) / 2))].

	"place tab morph"
	(readoutMorphs size > 1) ifTrue: [
		topSectionHeight := (readoutMorphs at: 1) bottom - self top + tabPaneMorph height + 5].
	tabPaneMorph
		width: self width;
		position: (self left + 15) @ (self top + topSectionHeight - tabPaneMorph height + 1).

	"place scripts scroll pane"
	pageViewerMorph position: (self left @ (self top + topSectionHeight)).
	self extent: self extent. "force resize of page viewer morph"
