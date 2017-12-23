private
popState
	"Restore the last state pushed onto the stack."

	| oldState |
	(stack isNil or: [stack size = 0]) ifTrue: [
		cmds := #().
		ip := 1.
		done := yield := true.
		^ self].

	oldState := stack removeLast.
	cmds := oldState at: 1.
	ip := oldState at: 2.
	startTime := oldState at: 3.
	tmp := oldState at: 4.
