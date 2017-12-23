accessing
listContents

	^ cellMorphs collect: [:m | m firstSubmorph contents].
