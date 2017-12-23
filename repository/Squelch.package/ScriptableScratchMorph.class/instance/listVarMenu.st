list ops
listVarMenu
	"Answer a menu for selecting a list variables."

	| result stage |
	result := #().
	((stage := self meOrOwnerThatIsA: ScratchStageMorph) notNil & (stage ~= self)) ifTrue: [
		result := stage listVarNames].

	lists size > 0 ifTrue: [
		result size > 0 ifTrue: [result := result copyWith: '-'].
		result := result, self listVarNames].

	^ result
