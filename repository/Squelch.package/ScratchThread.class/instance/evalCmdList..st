private
evalCmdList: anArrayOrNil
	"Evaluate the given sequence of commands. A nil argument means to execute the empty list of commands."

	self pushState.
	anArrayOrNil
		ifNil: [cmds := #()]
		ifNotNil: [cmds := anArrayOrNil].
	ip := 0.
