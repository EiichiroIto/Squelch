variables
addVariable: varName
	"Add a new user variable with the given name to this object. Do nothing if the variable already exists or is built in."

	(vars includesKey: varName asString) ifFalse: [
		vars at: varName asString put: 0].
	self isClone: false.
