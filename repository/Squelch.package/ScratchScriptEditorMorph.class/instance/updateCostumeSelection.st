stepping
updateCostumeSelection
	"Update the currently selected costume if the costumes tab is selected."

	| currentCostume |
	currentCategory = 'Costumes' ifFalse: [^ self].
	currentCostume := self target costume.

	pageViewerMorph contents submorphsDo: [:m |
		((m isKindOf: MediaItemMorph) and:
		 [m media isImage]) ifTrue: [
			m highlight: (m media = currentCostume)]].
