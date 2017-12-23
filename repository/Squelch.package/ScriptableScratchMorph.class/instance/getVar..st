variables
getVar: varName
	"Answer the value of the given user variable of this object, or 0 if the variable has been deleted."

	^ vars at: varName asString ifAbsent: [0]
