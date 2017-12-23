sprite handling
resizeTarget

	| factor  tb|
	tb := self targetBounds.
	reversed
		ifTrue: [ factor := (self center x - tb center x) / (tb left - tb center x) ]
		ifFalse: [ factor := (self center x - tb center x) / (tb right - tb center x) ].

	target multiplySizeBy: factor