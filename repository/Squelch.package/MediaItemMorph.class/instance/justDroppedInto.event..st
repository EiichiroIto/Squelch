dropping/grabbing
justDroppedInto: aMorph event: evt

	self delete.
	(aMorph meOrOwnerThatIsA: ScratchViewerMorph) ifNotNil: [
		"delete myself when dropped on the blocks palette"
		^ self deleteMedia].

	(aMorph meOrOwnerThatIsA: ScratchBlockPaletteMorph) ifNotNil: [
		"I have been accepted into a media list; exit this method to prevent myself from being put into the Clipboard again"
		^ self].

	(scratchObj media includes: media) not ifTrue: [
		"I have been dropped outside of the media list; allow myself to be resurrected again".
		^ self deleteMedia]
