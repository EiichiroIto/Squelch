processes
start

	| stage |
	self stop.
	self receiver ifNil: [^ self].
	scratchProc ifNotNil: [^ self].  "this stack is already running"

	(stage := self receiver meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ self].
	scratchProc := stage startProcessFor: self.
	self changed.
