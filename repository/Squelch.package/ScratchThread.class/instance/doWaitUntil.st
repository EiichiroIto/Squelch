system cmds
doWaitUntil
	"Test an expression and proceed only when it becomes true (i.e. yield if it is false)."

	| cmd |
	cmd := cmds at: ip.
	(self evalArg: (cmd at: 2)) ifFalse: [yield := true].
