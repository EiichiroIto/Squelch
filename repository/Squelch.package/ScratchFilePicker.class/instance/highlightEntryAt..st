event handling
highlightEntryAt: aPoint
	"Highlight the entry at the given point, if any, and unhighlight all other entries. Answer true if the selected entry was already highlit, which means this is the second click on that entry."

	| secondClick |
	secondClick := false.
	contentsPaneMorph contents submorphsDo: [:m |
		(m isKindOf: ScratchFilePickerEntry) ifTrue: [
			(m containsPoint: aPoint)
				ifTrue: [secondClick := m isHighlit. m highlight: true]
				ifFalse: [m highlight: false]]].

	^ secondClick
