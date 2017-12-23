other
asBlockTuple
	"Answer a tuple (Array) describing this block and its arguments."

	^ Array
		with: self class name
		with: scriptNameMorph choice
