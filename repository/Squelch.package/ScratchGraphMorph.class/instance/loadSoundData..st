commands
loadSoundData: aCollection

	| factor absV newData |
	factor := 0.
	aCollection do: [:v | (absV := v abs) > factor ifTrue: [scale := absV]].
	scale := 100.0 / factor.
	newData := OrderedCollection new: aCollection size.
	1 to: aCollection size do: [:i | newData addLast: (factor * (aCollection at: i))].

	self data: newData.
	self startIndex: 1.
	self cursor: 1.
