accessing
helpScreenName
	"Answer the name of the help screen for this block, or nil if no help is available."

	#addGlobalVariable = actionSelector ifTrue: [^ 'addVariable'].
	(#(addVariable addGlobalVariable deleteVariable) includes: actionSelector)
		ifTrue: [^ actionSelector asString].

	^ nil
