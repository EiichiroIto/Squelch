stepping
step
	"Run each process until it gives up control, then filter out any processes that have terminated."

	| screenExtent oldJustSaved |
	fillScreenFlag ifTrue: [
		screenExtent := Display extent.
		((self position = (0@0)) and: [self extent = screenExtent]) ifFalse: [
			oldJustSaved := justSaved.
			self position: 0@0.
			self extent: screenExtent.
			self enterQuarterModeIfSmallScreen.
			scriptsPane currentCategory: scriptsPane currentCategory.
			justSaved := oldJustSaved.
			^ self]].

	workPane ifNotNil: [
		ScriptableScratchMorph scratchOrigin: workPane center.
		viewerPane target isNil 
			ifTrue: [workPane viewBlocksAndScripts]
			ifFalse: [viewerPane target isInWorld ifFalse: [workPane viewBlocksAndScripts]]].

	"Sensor processOSMenuEvents."
	paintingInProgress ifTrue: [^ self].

	workPane scratchServer ifNotNil: [workPane scratchServer stepServer].
	"self checkForWeDo."
	self updateToolButtons.
	self processWhenConditions.
	self processKeyboardEvents.
	workPane stepProcesses.
	workPane scratchServer ifNotNil: [workPane scratchServer stepServer].
	"self processDroppedFiles."
	workPane processesToRun size > 0
		ifTrue: [flagButton on]
		ifFalse: [flagButton off].
