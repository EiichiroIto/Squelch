dropping/grabbing
wantsDroppedMorph: aMorph event: evt

	| f |
	((aMorph isKindOf: BlockMorph) or:
	 [(aMorph isKindOf: MediaItemMorph) or:
	 [(aMorph isKindOf: LibraryItemMorph) or:
	 [aMorph isKindOf: ScratchCommentMorph]]])
		ifTrue: [^ true].

	(aMorph isKindOf: ScratchSpriteMorph) ifTrue: [
		f := self meOrOwnerThatIsA: ScratchFrameMorph.
		f viewerPane pageViewer contents = self ifTrue: [^ true]].

	^ false
