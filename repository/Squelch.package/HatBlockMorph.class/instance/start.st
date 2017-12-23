processes
start

	| stage |
	self stop.
	scratchProc ifNil: [
		scriptOwner ifNil: [^ self].
		(stage := self receiver meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ self].
		scratchProc := stage startProcessFor: self.
		self changed].
