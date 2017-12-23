entry points
runUntilYield
	"Execute commands until it is time to yield control, a 'done' command is executed, or it is time to yield control."

	ip > cmds size ifTrue: [done := true].
	done ifTrue: [^ self].

	yield := false.
	[yield] whileFalse: [
		self evalCommand: (cmds at: ip).
		yield ifFalse: [ip := ip + 1].
		ip > cmds size ifTrue: [
			self popState.
			yield := true]].

