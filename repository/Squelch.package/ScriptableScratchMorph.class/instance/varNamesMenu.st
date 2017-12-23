variables
varNamesMenu
	"Answer a list of variable names."

	| varList stage |
	varList := #().
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [varList := stage varNames].
	self == stage ifFalse: [
		varList size > 0 ifTrue: [varList := varList copyWith: #-].
		varList := varList, self varNames].

	^ varList