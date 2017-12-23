variables
showVariable: varName
	"Show the watcher(s) for the given variable. If the receiver is a sprite and both it and and the stage have the given variable, show both. Do nothing if the variable does not exist or is already showing."

	| stage |
	self showOrHideVariable: varName show: true.

	stage := self meOrOwnerThatIsA: ScratchStageMorph.
	stage ~= self ifTrue: [stage showOrHideVariable: varName show: true].

