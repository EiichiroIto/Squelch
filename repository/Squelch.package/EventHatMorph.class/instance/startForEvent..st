other
startForEvent: aScratchEvent
	"Starts a process for this event hat triggered by the given event. Answer the process that was started or nil if no new process was started."
	"Details: The current policy is to stop and re-start the script for all events except key-pressed. Key-pressed events are just ignored if the script for that event is already running."

	| stage |
	(aScratchEvent name = 'Scratch-KeyPressedEvent') ifFalse: [
		scratchProc ifNotNil: [self stop]].  "non-key events stop currently running process, if any"

	self hasRunningProcess ifTrue: [^ nil].  "don't re-trigger if running"

	scriptOwner ifNil: [^ nil].
	(stage := scriptOwner meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ nil].
	scratchProc := stage startProcessFor: self.
	self changed.
	^ scratchProc
