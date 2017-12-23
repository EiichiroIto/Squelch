accessing
currentCategory: aString

	World activeHand newKeyboardFocus: nil.
	currentCategory := aString.
	self lightUpSelectorForCurrentCategory.
	self updateContents.
