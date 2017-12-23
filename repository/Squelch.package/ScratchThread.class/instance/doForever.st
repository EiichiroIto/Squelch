system cmds
doForever
	"Execute my enclosed blocks forever."

	| cmd |
	cmd := cmds at: ip.
	self evalCmdList: (cmd at: 2).
