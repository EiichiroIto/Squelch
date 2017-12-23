utilities
clearToolTips
	"Delete all tooltip morphs from the world."

	World ifNil: [^ self].
	World submorphsDo: [:m |
		(m isKindOf: ScratchToolTipMorph) ifTrue: [m delete]].
