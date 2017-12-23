accessing
on
	"Turn myself on."

	| myLabel |
	isOn ifTrue: [^ self].
	isOn := true.
	self changed.

	(myLabel := self findA: StringMorph) ifNotNil: [
		offLabelColor := myLabel color.
		myLabel color: Color black].
