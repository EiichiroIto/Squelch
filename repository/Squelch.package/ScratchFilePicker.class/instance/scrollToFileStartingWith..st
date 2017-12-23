private
scrollToFileStartingWith: aCharacter

	| entries possibilities currentlyHighlightedIndex |
	self stopPlayingSound.

	entries := contentsPaneMorph contents submorphs.
	entries size = 0 ifTrue: [^ self].

	"get all folders and files starting with aCharacter"
	possibilities := entries select: [:e | e entryName asLowercase beginsWith: (String with: aCharacter)].
	possibilities isEmpty ifTrue: [^ self].

	"Find the currentlyHighlightedIndex"
	1 to: entries size do: [:i |
		e := entries at: i.
		e isHighlit ifTrue: [
			e highlight: false. 
			currentlyHighlightedIndex := i]].

	"Find the next file or folder (after the currentlyHighlightedIndex) starting with aCharacter"
	currentlyHighlightedIndex ifNotNil: [
		(currentlyHighlightedIndex + 1) to: entries size do: [:i |
			e := entries at: i.
			(e entryName asLowercase beginsWith: (String with: aCharacter)) ifTrue: [
				^ self highlightAndScrollToEntry: e]]].

	"If all else fails, highlight the first file or folder starting with aCharacter"
	^ self highlightAndScrollToEntry: possibilities first
