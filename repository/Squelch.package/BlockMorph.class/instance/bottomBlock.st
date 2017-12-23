block enumerating
bottomBlock
	"Answer the bottom Block of this stack. The top block may be a CommandBlockMorph, or perhaps some other kind of BlockMorph."

	| m |
	m := self.
	[m nextBlock isKindOf: BlockMorph] whileTrue: [m := m nextBlock].
	^ m
