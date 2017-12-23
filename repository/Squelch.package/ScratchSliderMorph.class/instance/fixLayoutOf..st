private
fixLayoutOf: numberBox

	| stringMorph |
	stringMorph := numberBox firstSubmorph.
	numberBox width: stringMorph width + 6.
	stringMorph position: numberBox position + (3@2).
