list ops
addGlobalList

	| sFrame listName |
	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ self beep].

	listName := StringDialog ask: 'List name?'.
	listName size = 0 ifTrue: [^ self].
	sFrame workPane createListNamed: listName.
	sFrame viewerPane categoryChanged: 'variables'.
