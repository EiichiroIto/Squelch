stepping
step
	"Run each process until it gives up control, then filter out any processes that have terminated."

	| screenExtent |
	screenExtent := DisplayScreen actualScreenSize.
	((self position = (0@0)) and: [self extent = screenExtent]) ifFalse: [
		self position: 0@0.
		^ self extent: screenExtent].

	ScriptableScratchMorph scratchOrigin: stage center.

	stage scratchServer ifNotNil: [stage scratchServer stepServer].
	self processWhenConditions.
	self processKeyboardEvents.
	stage stepProcesses.
	stage step.
	self stepSubmorphs.
	offscreenWorld incrRedrawDouble: doubleSize.

	stage processesToRun size > 0
		ifTrue: [flagButton on]
		ifFalse: [flagButton off].
