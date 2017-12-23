private
copyListsFor: aSprite
	"Answer a deep copy of my list variables dictionary."

	| result oldList copiedList |
	result := lists species new.
	lists associationsDo: [:assoc |
		oldList := assoc value.
		copiedList := ScratchListMorph new
			listName: oldList listName target: aSprite;
			newContents: oldList listContents.
		result at: assoc key put: copiedList].
	^ result

