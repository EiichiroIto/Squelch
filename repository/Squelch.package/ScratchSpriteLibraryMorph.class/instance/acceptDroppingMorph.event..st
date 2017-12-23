dropping/grabbing
acceptDroppingMorph: aMorph event: evt
	"This method allows re-ordering of sprites in the sprite library area."

	| insertAfter libraryItems spriteLibrary movedThumbnail mostOverlap mostOverlapIndex sf |
	((aMorph isKindOf: LibraryItemMorph) and:
	 [(spriteLibrary := self meOrOwnerThatIsA: ScratchSpriteLibraryMorph) notNil])
		ifFalse: [^ super acceptDroppingMorph: aMorph event: evt].

	"Set the new position of the morph that just moved"
	movedThumbnail := self submorphs detect: [:m | (m target == aMorph target)] ifNone: [^ self].

	libraryItems := self submorphs select: [:m | 
		(m bounds intersects: aMorph bounds) and:
		[(m ~~ aMorph)]].

	"Select the thumbnail with the most overlap with movedThumbnail"
	libraryItems := libraryItems sort: [:m1 :m2 | 
		((m1 bounds intersect: aMorph bounds) area < 
			(m2 bounds intersect: aMorph bounds) area)].

	movedThumbnail position: aMorph position.
	aMorph delete.

	libraryItems isEmpty
		ifTrue: [insertAfter := nil]  "end of list"
		ifFalse: [
			mostOverlap := libraryItems last.
			(movedThumbnail center x > mostOverlap center x)
				ifTrue: [
					mostOverlapIndex := self submorphs indexOf: mostOverlap.
					self submorphCount == mostOverlapIndex
						ifTrue: [insertAfter := nil]
						ifFalse: [insertAfter := self submorphs at: (mostOverlapIndex + 1)]]
				ifFalse: [insertAfter := mostOverlap]].

	spriteLibrary insertItem: movedThumbnail before: insertAfter.

	sf := self meOrOwnerThatIsA: ScratchFrameMorph.
	sf ifNotNil: [ sf workPane updateSpritesList ].
