private-variables
recordVariableValues
	"Record the current values of my global variables."

	lastSentValues := Dictionary new.

	stage ifNotNil: [
		stage varNames do: [:v | lastSentValues at: v put: (stage getVar: v)]].
