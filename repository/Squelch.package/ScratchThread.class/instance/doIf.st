system cmds
doIf
	"Execute my enclosed blocks if my condition expression evaluates to true."

	| cmd |
	cmd := cmds at: ip.
	(self evalArg: (cmd at: 2)) ifTrue: [
		self evalCmdList: (cmd at: 3)].
