dropping/grabbing
acceptDroppingMorph: aMorph event: evt
	"This method allows re-ordering of media in the costumes and sounds tabs."

	| editor mediaItems insertAfter |
	((aMorph isKindOf: MediaItemMorph) and:
	 [(editor := self meOrOwnerThatIsA: ScratchScriptEditorMorph) notNil])
		ifFalse: [^ super acceptDroppingMorph: aMorph event: evt].

	mediaItems := self submorphs select: [:m |
		(m isKindOf: MediaItemMorph) and:
		 [(m ~~ aMorph) and:
		 [(m media mediaType = aMorph media mediaType) and:
		 [m bounds intersects: aMorph bounds]]]].
	mediaItems := mediaItems sort: [:m1 :m2 | m1 top < m2 top].

	mediaItems isEmpty
		ifTrue: [insertAfter := nil]  "end of list"
		ifFalse: [
			aMorph center y > mediaItems last center y
				ifTrue: [insertAfter := nil]  "end of list"
				ifFalse: [insertAfter := mediaItems last media]].

	editor target insertMedia: aMorph media before: insertAfter.
