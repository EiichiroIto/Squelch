clones
deleteAllClones
	"Delete all clones."

	self allClones do: [:clone | clone delete].
