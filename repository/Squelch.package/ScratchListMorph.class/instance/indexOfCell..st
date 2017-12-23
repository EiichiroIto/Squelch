accessing
indexOfCell: cellMorph

	^ cellMorphs indexOf: cellMorph ifAbsent: [-1]
