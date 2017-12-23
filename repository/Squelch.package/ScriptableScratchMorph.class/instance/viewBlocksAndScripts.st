blocks
viewBlocksAndScripts

	| sFrame editor viewer tabs |
	self isClone ifTrue: [^ self].

	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ self].
	editor := sFrame scriptsPane.
	viewer := sFrame viewerPane.
	tabs := sFrame scriptsPane tabPane.
	sFrame view: self tab: tabs currentTab category: viewer currentCategory.

	self world ifNotNil: [
		self zoomRectFrom: self bounds to: editor bounds].
