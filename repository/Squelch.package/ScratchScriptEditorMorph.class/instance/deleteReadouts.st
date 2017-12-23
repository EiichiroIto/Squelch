private
deleteReadouts
	"Delete the position/rotation readouts."

	readoutMorphs do: [:m | m delete].
	readoutMorphs := #().
