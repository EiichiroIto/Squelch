private
helpScreenName
	"Answer the name of the help screen for this block, or nil if no help is available."

	#addGlobalVariable = actionSelector ifTrue: [^ 'addVariable'].
	#addGlobalList = actionSelector ifTrue: [^ 'addList'].
	(#(addVariable addGlobalVariable deleteVariable addList addGlobalList deleteList) includes: actionSelector)
		ifTrue: [^ actionSelector asString].

	^ nil
