accessing
customScale
	"Called when the user wants to input a scale value."

	| answer |
	answer := FillInTheBlank request: 'Please type desired scale:' initialAnswer: '2x'.
	answer size = 0 ifTrue: [^ self].
	answer := answer copyWithout: $x.
	self zoom: answer asNumber.
