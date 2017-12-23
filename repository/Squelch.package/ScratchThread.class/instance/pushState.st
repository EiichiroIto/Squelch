private
pushState
	"Save my current state on the stack."

	stack addLast: (Array
		with: cmds
		with: ip
		with: startTime
		with: tmp).
