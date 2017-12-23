accessing
currentCategory: aString

	| xOffset |
	currentCategory := aString.
	self target ifNil: [^ self].
	xOffset := 0.

	World activeHand newKeyboardFocus: nil.

	currentCategory = 'Scripts' ifTrue: [
		pageViewerMorph contents: self target blocksBin].
	currentCategory = 'Costumes' ifTrue: [
		pageViewerMorph contents: (self target costumesPage: xOffset)].
	currentCategory = 'Sounds' ifTrue: [
		pageViewerMorph contents: (self target soundsPage: xOffset)].

	pageViewerMorph contents color: ScratchFrameMorph scriptsPaneColor.

	self world ifNotNil: [self world startSteppingSubmorphsOf: pageViewerMorph contents].

