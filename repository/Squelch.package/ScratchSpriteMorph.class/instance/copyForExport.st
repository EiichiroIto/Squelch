private
copyForExport
	"Answer a copy of me for exporting."
	"Note: Sprites are always exported in the context of an empty background."

	| objToExport |
	objToExport := ScratchStageMorph new clearMediaAndCostume.
	objToExport position: owner position.
	objToExport addMorph: super copyForExport.
	^ objToExport
