dropping/grabbing
insertItem: item1 before: item2orNil
	"Shuffle my sprite thumbnails.  I rearrange my submorphs so that the library is shuffled and layed out properly.  I don't bother updating the sprites list which is stored in the stage; I let it update on its own when updateSpritesList is called"

	| nextItem |
	item1 == item2orNil ifFalse: [
		item2orNil
			ifNil: [
				self addMorphBack: item1]
			ifNotNil: [
				self removeAllMorphsIn: (Array with: item1).
				self replaceSubmorph: item2orNil by: item1.
				nextItem := item2orNil.
				self submorphsBehind: item1 do: [:s |
					self replaceSubmorph: s by: nextItem.
					nextItem := s].
				self addMorphBack: nextItem]].
	(self meOrOwnerThatIsA: ScratchLibraryMorph) fixLayout.
