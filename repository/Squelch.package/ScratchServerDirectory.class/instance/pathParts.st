accessing
pathParts
	"Answer my path as an array of directory names."

	^ (path findTokens: '/') asArray
