private
copyForExport
	"Answer a copy of me for exporting."

	| objToExport |
	objToExport := self fullCopy.
	objToExport objName: objName.
	objToExport blocksBin allMorphsDo: [:m |
		(m isKindOf: BlockMorph) ifTrue: [m stop].
		(m isKindOf: SpriteArgMorph) ifTrue: [m clearMorphReference]].
	objToExport convertStacksToTuples.
	^ objToExport
