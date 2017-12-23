variables
allVarNames
	"Answer a set of all variable and list variable names."

	| allNames |
	allNames := vars keys.
	allNames addAll: lists keys.
	^ allNames

