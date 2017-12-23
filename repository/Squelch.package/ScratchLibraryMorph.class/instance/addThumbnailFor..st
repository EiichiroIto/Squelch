private
addThumbnailFor: aMorph
	"Add a thumbnail for the given morph."

	| newThumbnail |
	newThumbnail := LibraryItemMorph new.
	newThumbnail extent: itemExtent thumbWidth: thumbWidth.
	newThumbnail  target: aMorph.
	(newThumbnail target isKindOf: ScratchStageMorph)
		ifTrue: [stagePane addMorph: newThumbnail]
		ifFalse: [scrollPane contents addMorphBack: newThumbnail].
	newThumbnail step.
