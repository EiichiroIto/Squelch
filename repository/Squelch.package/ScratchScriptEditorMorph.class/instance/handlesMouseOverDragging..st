event handling
handlesMouseOverDragging: evt

	| m |
	evt hand submorphs size = 1 ifFalse: [^ false].
	m := evt hand firstSubmorph.

	^ m isKindOf: BlockMorph.
