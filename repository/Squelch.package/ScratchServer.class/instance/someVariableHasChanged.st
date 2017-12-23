private-variables
someVariableHasChanged
	"Answer true if a global variable has changed since I last sent variable updates to my peers."

	| lastVal |
	stage ifNil: [^ false].

	stage varNames do: [:v |
		lastVal := lastSentValues at: v ifAbsent: [nil].
		lastVal ifNil: [^ true].
		(lastVal = (stage getVar: v)) ifFalse: [^ true]].

	^ false
