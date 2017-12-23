list ops
addList

	| sFrame result listName |
	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ self beep].

	result := NewVariableDialog ask: 'List name?'.
	result = #cancelled ifTrue: [^ self].
	listName := result first.
	result second
		ifTrue: [self createListNamed: listName]
		ifFalse: [sFrame workPane createListNamed: listName].
	sFrame viewerPane categoryChanged: 'variables'.
