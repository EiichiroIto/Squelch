variables
hideVariable: varName
	"Hide the watcher(s) for the given variable. If the receiver is a sprite and both it and and the stage have the given variable, hide both. Do nothing if the variable does not exist or is already hidden."

	| stage |
	self showOrHideVariable: varName show: false.

	stage := self meOrOwnerThatIsA: ScratchStageMorph.
	stage ~= self ifTrue: [stage showOrHideVariable: varName show: false].

