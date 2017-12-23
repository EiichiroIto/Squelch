copying
updateReferencesUsing: aDictionary
	"Nil out my playing sound."

	super updateReferencesUsing: aDictionary.
	playingSound := nil.
