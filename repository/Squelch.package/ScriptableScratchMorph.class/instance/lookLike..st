looks ops
lookLike: costumeNameOrIndex
	"Change to the costume indicated by the given name, index, or boolean. Noop if there is no costume of the given name in my library."
	"Note: Costumes can have names that look like numbers, but those numbers have nothing to do with the index of the costume. So, we first try interpreting the argument as a name. If that fails, we try interpreting it as a costume index number."

	| p newCostume i |
	p := self referencePosition.
	costume suspendPlaying.

	newCostume := nil.
	(costumeNameOrIndex isKindOf: String) ifTrue: [
		"try interpreting the argument as a costume name"
		newCostume := self costumeFromName: costumeNameOrIndex.

		"try interpreting the string as a number"
		newCostume ifNil: [
			i := self interpretStringAsNumberIfPossible: costumeNameOrIndex.
			i isNumber ifTrue: [
				newCostume := self costumeFromName: (self costumeNameFromNumber: i)]
				ifFalse: [^ self]]].  "string does not match a costume and cannot be coverted to a number"

	"treat other types (number, boolean) as a costume index"
	newCostume ifNil: [
		i := costumeNameOrIndex asNumberNoError.
		newCostume := self costumeFromName: (self costumeNameFromNumber: i)].

	newCostume ifNil: [^ self].  "should not happen..."

	costume := newCostume.
	costume resumePlaying.
	self costumeChanged.
	self referencePosition: p.
	World displayWorldSafely.
