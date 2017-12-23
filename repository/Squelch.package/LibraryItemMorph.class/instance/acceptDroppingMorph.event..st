dropping/grabbing
acceptDroppingMorph: aMorph event: evt
	"Copy the dropped scripts of another object into its target."

	(aMorph isKindOf: MediaItemMorph) ifTrue: [
		target addMediaItem: aMorph media copy.
		evt hand rejectDropMorph: aMorph event: evt].

	(aMorph isKindOf: BlockMorph) ifTrue: [
		evt hand rejectDropMorph: aMorph event: evt.
		target addStack: aMorph fullCopy].

	(aMorph isKindOf: ScratchCommentMorph) ifTrue: [
		evt hand rejectDropMorph: aMorph event: evt.
		target addComment: aMorph fullCopy].
