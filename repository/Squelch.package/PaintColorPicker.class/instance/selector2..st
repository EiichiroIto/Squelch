accessing
selector2: sel

	(sel isNil or: [sel = 'nil' or: [sel isEmpty]])
		ifTrue: [selector2 := nil]
		ifFalse: [selector2 := sel asSymbol].