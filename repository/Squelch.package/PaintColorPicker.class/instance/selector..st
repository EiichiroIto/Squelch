accessing
selector: sel

	(sel isNil or: [sel = 'nil' or: [sel isEmpty]])
		ifTrue: [selector := nil]
		ifFalse: [selector := sel asSymbol].
