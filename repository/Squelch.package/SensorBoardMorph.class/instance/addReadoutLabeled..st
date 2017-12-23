initialization
addReadoutLabeled: aString
	"Add a readout row with the given label. Answer the stringmorph that's the readout."

	| row box readout |
	row := AlignmentMorph newRow color: column color; layoutInset: 2.
	row addMorphBack: (Morph new color: column color; extent: 1@3). "spacer"
	row addMorphBack: (StringMorph contents: aString capitalized font: (StrikeFont fontName: 'VerdanaBold' size: 10)).
	row addMorphBack: (AlignmentMorph new color: column color; extent: 10@1; hResizing: #spaceFill).  "spacer"
	box := WatcherReadoutFrameMorph new
		extent: 42@14;
		color: (ScriptableScratchMorph blockColorFor: 'sensing').
	readout := StringMorph contents: '0' font: (StrikeFont fontName: 'VerdanaBold' size: 10).
	readout color: Color white.
	box addMorph: readout.
	row addMorphBack: box.
	column addMorphBack: row.
	^ readout
