system cmds
doRepeat
	"Execute my enclosed blocks the number of times given by my argument. tmp is used to count down the iterations."

	| cmd |
	cmd := cmds at: ip.
	tmp ifNil: [  "first time"
		tmp := self evalArg: (cmd at: 2)].
	tmp <= 0 ifTrue: [^ self].  "repeat is finished"

	tmp := tmp - 1.
	self evalCmdList: (cmd at: 3).
