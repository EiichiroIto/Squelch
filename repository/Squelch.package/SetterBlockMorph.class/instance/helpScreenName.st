accessing
helpScreenName
	"Answer the name of the help screen for this hat block, or nil if no help is available."

	#setVar:to: = selector
		ifTrue: [^ 'variableSet']
		ifFalse: [^ 'variableChangeBy']
