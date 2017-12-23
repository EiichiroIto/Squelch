blocks
blockCategories
	"Answer a list of block categories."

	^ (self class blockSpecs select: [:el |
		(el isKindOf: String) and: [el ~= '-' and: [el ~= '~']]]) asArray
