other
addAndView: aSpriteMorph
	"Add given morph to the work pane and view it."

	| pos i p |
	aSpriteMorph center: workPane center.
	pos := self scratchObjects collect: [:o | o referencePosition].
	i := 0.
	[pos includes: (p := (10 * i) asPoint)] whileTrue: [i := i + 1].
	workPane addMorphFront: aSpriteMorph.
	aSpriteMorph objName: aSpriteMorph nextInstanceName.
	aSpriteMorph referencePosition: p.
	aSpriteMorph startStepping.
	workPane sprites addLast: aSpriteMorph.
	self view: aSpriteMorph tab: 'Scripts' category: 'motion'.
