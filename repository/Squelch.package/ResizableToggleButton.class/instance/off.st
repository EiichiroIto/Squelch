accessing
off
	"Turn myself off."

	| myLabel |
	isOn ifFalse: [^ self].
	isOn := false.
	self changed.

	(myLabel := self findA: StringMorph) ifNotNil: [
		offLabelColor ifNotNil: [
			myLabel color: offLabelColor]].
