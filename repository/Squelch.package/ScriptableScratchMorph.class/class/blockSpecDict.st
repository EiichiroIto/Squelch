block specs
blockSpecDict
	"Answer my block specification dictionary."

	BlockSpecDict ifNil: [self buildBlockSpecDictionary].
	^ BlockSpecDict

