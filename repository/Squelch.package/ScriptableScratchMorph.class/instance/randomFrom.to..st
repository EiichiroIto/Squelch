other ops
randomFrom: start to: stop
	"Answer a random number within the given range. If both min and max are integers, the result is rounded to the nearest integer."

	| min max result |
	min := start min: stop.
	max := start max: stop.
	result := (RandomGen next * (max - min)) + min.
	min isInteger & max isInteger
		ifTrue: [result := (RandomGen next * ((max + 1) - min)) truncated + min]
		ifFalse: [result := (RandomGen next * (max - min)) + min].
	^ result
